<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\OpBarang;
use App\Models\OpDetailBarang;
use App\Models\OpSuplaier;
use App\Models\OpBarangCabangStock;
use App\Models\OpBarangCabangStockLog;

class StockBarangController extends Controller
{
    public function index()
    {
        return view("admin.stock.barang");
    }

    public function addStock()
    {
        $suplaier = OpSuplaier::where('status_suplaier', 1)->get();
        return view('admin.stock.add', compact('suplaier'));
    }

    public function DataStockJson()
    {
        $id_cabang = Auth::user()->id_cabang;
        $barang = OpBarangCabangStock::where('id_cabang', $id_cabang)->orderBy('created_at', 'DESC')->with(['barang', 'suplaier'])->get();
        return response()->json(['message' => 'Data get successfully', 'data' => $barang]);
    }

    public function DataGetBarang($KodeBarang)
    {

        $barang = OpBarang::where('kode_produk', $KodeBarang)
            ->with(['opBarangDetails', 'kategori', 'gudang'])
            ->first();

        if (!$barang) {
            return response()->json([
                'message' => 'Barang tidak ditemukan',
                'data' => null,
                'detail' => null
            ], 404);
        }

        $detail_barang = OpDetailBarang::with(['jenis', 'type'])
            ->where('id_barang', $barang->id)
            ->first();

        return response()->json([
            'message' => 'Data retrieved successfully',
            'data' => $barang,
            'detail' => $detail_barang
        ]);
    }


    public function store(Request $request)
    {

        // tabel op_stock_gudang
        $request->validate([
            // tabel produk
            'id_barang' => 'required|string',
            'id_suplaier' => 'required|string|max:255',
            'id_gudang' => 'required',
            'id_toko' => 'required',
            'jenis_transaksi_stock' => 'required|string',
            'jumlah_barang' => 'required|integer',
            'id_user' => 'required|string',
        ]);

        // Retrieve the current stock of the product
        $currentStock = OpBarangCabangStock::where('id_barang', $request->id_barang)
            ->where('id_gudang', $request->id_gudang)
            ->first();

        if ($currentStock) {
            // Jika barang sudah ada, tambahkan jumlah transaksi ke stok masuk/keluar
            if ($request->jenis_transaksi_stock == 'masuk') {
                $currentStock->stock_masuk += $request->jumlah_barang; // Tambahkan ke stok masuk
            } else if ($request->jenis_transaksi_stock == 'pengiriman') {
                $currentStock->stock_keluar += $request->jumlah_barang; // Tambahkan ke stok keluar
            }

            // Hitung ulang stok akhir
            $currentStock->stock_akhir = $currentStock->stock_masuk - $currentStock->stock_keluar;

            // Tambahkan keterangan berdasarkan jenis transaksi
            $currentStock->keterangan_stock_cabang = $request->jenis_transaksi_stock == 'masuk' ?
                'Masuk stock barang masuk: ' . $request->jumlah_barang :
                'Pengiriman stock barang keluar: ' . $request->jumlah_barang;

            $currentStock->save();
        } else {
            // Jika data belum ada, buat data baru
            OpBarangCabangStock::create([
                'id_barang' => $request->id_barang,
                'id_suplaier' => $request->id_suplaier,
                'id_gudang' => $request->id_gudang,
                'id_toko' => $request->id_toko,
                'id_cabang' => Auth::user()->id_cabang,
                'stock_masuk' => $request->jenis_transaksi_stock == 'masuk' ? $request->jumlah_barang : 0,
                'stock_keluar' => $request->jenis_transaksi_stock == 'pengiriman' ? $request->jumlah_barang : 0,
                'stock_akhir' => ($request->jenis_transaksi_stock == 'masuk' ? $request->jumlah_barang : 0) -
                    ($request->jenis_transaksi_stock == 'pengiriman' ? $request->jumlah_barang : 0),
                'jenis_transaksi_stock' => $request->jenis_transaksi_stock,
                'keterangan_stock_cabang' => $request->jenis_transaksi_stock == 'masuk' ?
                    'Masuk stock barang masuk: ' . $request->jumlah_barang :
                    'Pengiriman stock barang keluar: ' . $request->jumlah_barang,
                'id_user' => $request->id_user,
            ]);
        }
        // tabel log
        $latestStock = OpBarangCabangStockLog::where('id_barang', $request->id_barang)
            ->where('id_gudang', $request->id_gudang)
            ->orderBy('created_at', 'desc')
            ->first();

        $stockAkhir = 0;
        if ($latestStock) {
            $stockAkhir = $latestStock->stock_akhir;

            if ($request->jenis_transaksi_stock == 'masuk') {
                $stockAkhir += $request->jumlah_barang;
            } elseif ($request->jenis_transaksi_stock == 'pengiriman') {
                $stockAkhir -= $request->jumlah_barang;
            }
        } else {
            if ($request->jenis_transaksi_stock == 'masuk') {
                $stockAkhir = $request->jumlah_barang;
            } else {
                $stockAkhir = 0;
            }
        }

        $barang = OpBarangCabangStockLog::create([
            'id_barang' => $request->id_barang,
            'id_suplaier' => $request->id_suplaier,
            'id_gudang' => $request->id_gudang,
            'id_toko' => $request->id_toko,
            'id_cabang' => Auth::user()->id_cabang,
            'stock_masuk' => $request->jenis_transaksi_stock == 'masuk' ? $request->jumlah_barang : 0,
            'stock_keluar' => $request->jenis_transaksi_stock == 'pengiriman' ? $request->jumlah_barang : 0,
            'stock_akhir' => $stockAkhir, // Set the calculated stock_akhir
            'jenis_transaksi_stock' => $request->jenis_transaksi_stock,
            'keterangan_stock_cabang' => $request->jenis_transaksi_stock == 'masuk' ?
                'Masuk stock barang masuk: ' . $request->jumlah_barang :
                'Pengiriman stock barang keluar: ' . $request->jumlah_barang,
            'id_user' => $request->id_user,
        ]);

        return response()->json(['success' => true, 'message' => 'Data recorded successfully', 'data' => $barang]);
    }

    public function viewLog()
    {
        return view("admin.stock.log");
    }

    public function DataStockRiwayatJson()
    {
        $id_cabang = Auth::user()->id_cabang;
        $barang = OpBarangCabangStockLog::where('id_cabang', $id_cabang)->orderBy('created_at', 'DESC')->with(['barang', 'suplaier'])->get();
        return response()->json(['message' => 'Data get successfully', 'data' => $barang]);
    }

    public function destroy($id)
    {
        $log = OpBarangCabangStockLog::find($id);

        if (!$log) {
            return response()->json(['success' => false, 'message' => 'Data not found.'], 404);
        }

        // Hapus log yang dipilih
        $log->delete();

        // Ambil semua log yang relevan (dengan id_barang dan id_gudang yang sama)
        $logsToUpdate = OpBarangCabangStockLog::where('id_barang', $log->id_barang)
            ->where('id_gudang', $log->id_gudang)
            ->where('id_cabang', $log->id_cabang)
            ->orderBy('id', 'asc')
            ->get();

        $currentStockAkhir = 0;

        // Hitung ulang stock_akhir untuk setiap log
        foreach ($logsToUpdate as $updateLog) {
            if ($updateLog->jenis_transaksi_stock == 'masuk') {
                $currentStockAkhir += $updateLog->stock_masuk;
            } elseif ($updateLog->jenis_transaksi_stock == 'pengiriman') {
                $currentStockAkhir -= $updateLog->stock_keluar;
            }
            $updateLog->stock_akhir = $currentStockAkhir;
            $updateLog->save();
        }

        // Update OpStockGudang berdasarkan log terakhir
        $lastLog = $logsToUpdate->last();

        $stockGudang = OpBarangCabangStock::where('id_barang', $log->id_barang)
            ->where('id_gudang', $log->id_gudang)
            ->first();

        if ($stockGudang) {
            $stockGudang->stock_masuk = $logsToUpdate->where('jenis_transaksi_stock', 'masuk')->sum('stock_masuk');
            $stockGudang->stock_keluar = $logsToUpdate->where('jenis_transaksi_stock', 'pengiriman')->sum('stock_keluar');
            $stockGudang->stock_akhir = $lastLog ? $lastLog->stock_akhir : 0;
            $stockGudang->keterangan_stock_cabang = "Data telah diperbarui setelah penghapusan log.";
            $stockGudang->save();
        }



        return response()->json(['success' => true, 'message' => 'Data deleted and stock_akhir recalculated.']);
    }



    public function destroyStock($id)
    {
        $idCabang = Auth::user()->id_cabang;
        $stock = OpBarangCabangStock::find($id);

        if (!$stock) {
            return response()->json(['success' => false, 'message' => 'Data not found.'], 404);
        }

        // Hapus semua log terkait
        $logsDeleted = OpBarangCabangStockLog::where('id_barang', $stock->id_barang)
            ->where('id_cabang', $idCabang)
            ->count();

        if ($logsDeleted > 0) {
            OpBarangCabangStockLog::where('id_barang', $stock->id_barang)
                ->where('id_cabang', $idCabang)
                ->delete();
        } else {
            return response()->json(['success' => false, 'message' => 'No logs found to delete.'], 404);
        }

        // Hapus data OpStock
        $stock->delete();

        return response()->json(['success' => true, 'message' => 'Data and related logs deleted successfully.']);
    }
}
