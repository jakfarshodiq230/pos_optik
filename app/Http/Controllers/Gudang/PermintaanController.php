<?php

namespace App\Http\Controllers\Gudang;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\OpTransaksi;
use App\Models\OpTransaksiDetail;
use App\Models\OpTransaksiLog;
use App\Models\OpStockGudang;
use App\Models\OpStockGudangLog;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PermintaanController extends Controller
{
    public function index()
    {
        return view("gudang.pesanan.permintaan-barang");
    }

    public function GetDataPermintaan(Request $request)
    {
        $start = $request->input('start', 0); // starting index for pagination
        $length = $request->input('length', 10); // number of records per page

        // Start building the query
        $permintaan = OpTransaksiDetail::where('id_gudang', Auth::user()->id_gudang)->whereIn('status_pemesanan', ['pesan', 'kirim'])->whereIn('pemesanan', ['ya']);

        // Apply filters if they exist
        if ($request->has('tanggal_transaksi') && $request->tanggal_transaksi != '') {
            $permintaan = $permintaan->whereDate('tanggal_transaksi', $request->tanggal_transaksi);
        }
        if ($request->has('jenis_transaksi') && $request->jenis_transaksi != '') {
            $permintaan = $permintaan->where('jenis_transaksi', $request->jenis_transaksi);
        }

        // Get the total count before applying pagination
        $totalRecords = $permintaan->count();

        // Apply pagination
        $permintaan = $permintaan->with('user', 'cabang', 'transaksi')
            ->skip($start)
            ->take($length)
            ->get();

        // Check if there is any data
        if ($permintaan->isEmpty()) {
            return response()->json([
                'success' => false,
                'message' => 'No data found for the given filters',
                'data' => [],
            ]);
        }

        // Return data along with the total record count
        return response()->json([
            'success' => true,
            'message' => 'Items retrieved successfully',
            'data' => $permintaan,
            'recordsTotal' => $totalRecords,
            'recordsFiltered' => $totalRecords, // Adjust if you want to reflect filtered count
        ]);
    }

    public function GetDataIDPermintaan($kode)
    {
        $permintaan_barang = OpTransaksi::where('nomor_transaksi', $kode)->first();
        $permintaan_detail = OpTransaksiDetail::where('nomor_transaksi', $kode)->where('pemesanan', 'ya')->with('barang')->get();
        return view("gudang.pesanan.permintaan-detail", compact('permintaan_barang', 'permintaan_detail'));
    }

    public function TindakanPermintaan(Request $request)
    {
        // Validate the incoming request
        $request->validate([
            'id_pemesanan' => 'required|integer',
            'status_log' => 'required|string|max:255',
            'keterangan_log' => 'required|string|max:255',
            'nomor_transaksi' => 'required|string',
        ]);

        DB::beginTransaction();

        try {
            // Update the pesanan status if necessary
            OpTransaksiDetail::where('nomor_transaksi', $request->nomor_transaksi)
                ->where('pemesanan', 'ya')
                ->update(['status_pemesanan' => $request->status_log]);

            if ($request->status_log === 'kirim') {
                // Get order details based on the transaction number
                $barangPesan = OpTransaksiDetail::where('nomor_transaksi', $request->nomor_transaksi)->where('pemesanan', 'ya')->get();

                foreach ($barangPesan as $value) {
                    // Check for stock availability
                    $stockGudang = OpStockGudang::where('id_barang', $value->id_barang)->first();

                    if (!$stockGudang) {
                        throw new \Exception('Stock record not found for barang ID: ' . $value->id_barang);
                    }

                    $newStockAkhir = $stockGudang->stock_akhir - $value->jumlah_barang;

                    if ($newStockAkhir < 0) {
                        throw new \Exception('Stock tidak mencukupi untuk barang dengan ID: ' . $value->id_barang);
                    }

                    // Update the stock in the warehouse
                    OpStockGudang::where('id', $stockGudang->id)->update([
                        'stock_akhir' => $newStockAkhir,
                        'stock_keluar' => $stockGudang->stock_keluar + $value->jumlah_barang,
                        'jenis_transaksi_stock' => 'pesanan',
                        'keterangan_stock_gudang' => 'Stock keluar untuk pesanan ' . $request->nomor_transaksi,
                    ]);

                    // Log the stock movement
                    OpStockGudangLog::create([
                        'id_barang' => $stockGudang->id_barang,
                        'id_suplaier' => $stockGudang->id_suplaier,
                        'id_gudang' => $stockGudang->id_gudang,
                        'id_user' => Auth::user()->id ?? null,
                        'stock_masuk' => 0,
                        'stock_keluar' => $value->jumlah_barang,
                        'stock_akhir' => $newStockAkhir,
                        'jenis_transaksi_stock' => 'pesanan',
                        'keterangan_stock_gudang' => 'Stock keluar untuk pesanan ' . $request->nomor_transaksi,
                    ]);
                }
            }

            // Log the action
            OpTransaksiLog::create([
                'nomor_transaksi' => $request->nomor_transaksi,
                'status_log' => $request->status_log,
                'keterangan_log' => $request->keterangan_log,
                'id_user' => Auth::user()->id,
                'id_cabang' => Auth::user()->id_cabang,
                'id_gudang' => Auth::user()->id_gudang
            ]);

            // Commit the transaction
            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Stock updated and action logged successfully for transaction: ' . $request->nomor_transaksi,
            ]);
        } catch (\Exception $e) {
            // Rollback the transaction in case of an error
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Terjadi kesalahan: ' . $e->getMessage(),
            ], 422);
        }
    }

    public function CetakKirim($id)
    {
        $penjualan = OpTransaksi::with('user', 'cabang')->where('nomor_transaksi', $id)->where('id_cabang', Auth::user()->id_cabang)->first();
        $detailpenjulan = OpTransaksiDetail::with('barang', 'gudang')->where('nomor_transaksi', $id)->where('pemesanan', 'ya')->get();
        return view("gudang.pesanan.nota-pemesanan", compact('penjualan', 'detailpenjulan'));
    }
}
