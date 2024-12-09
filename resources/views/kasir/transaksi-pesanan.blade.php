@extends('template.kasir')
@section('styles')
    <style>
        .dataTables_wrapper .row {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .dataTables_length {
            margin-right: 20px;
            margin-top: 20px;
            margin-bottom: -50px;
        }
        .dataTables_wrapper .dt-buttons {
            margin-top: 10px;
        }
        .dataTables_filter {
            margin-left: 20px;
        }
        .panel_toolbox {
            float: right;
            min-width: 0px;
        }
    </style>
@endsection

@section('konten')
<div class="right_col" role="main">
    {{-- isi conten --}}
    <div class="col-md- col-sm-12 ">
        <div class="x_panel">
            <div class="x_title">
                <h2>TRANSAKSI PESANAN</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="row">
                    <div class="col-md-6 col-sm- ">
                        <div class="form-group row">
                            <input type="hidden" name="id" id="barang_id" value="">
                            <label class="col-form-label col-md-3 col-sm-3 ">Nomor Transaksi</label>
                            <div class="col-md-9 col-sm-9 ">
                                <input type="text" class="form-control form-control-sm" id="nomor_transaksi" name="nomor_transaksi" value="<?= $nomor_transaksi ?>" placeholder="Nomor Transaksi" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-3 col-sm-3 ">Nama</label>
                            <div class="col-md-0 col-sm-9 ">
                                <input type="text" class="form-control form-control-sm" id="nama" name="nama" placeholder="Nama">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-md-3 col-sm-3 ">Alamat<span class="required">*</span>
                            </label>
                            <div class="col-md-9 col-sm-9 ">
                                <textarea type="text" name="alamat" id="alamat" class="form-control form-control-sm" placeholder="Alamat"></textarea>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-md-3 col-sm-3 ">Petugas</label>
                            <div class="col-md-9 col-sm-9 ">
                                <input type="text" class="form-control form-control-sm" value="<?=  Auth::user()->name ?>" placeholder="Nama Petugas" readonly>
                                <input type="hidden" name="id_user" id="id_user" value="<?=  Auth::user()->id ?>" class="form-control form-control-sm" placeholder="Nama Petugas">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-md-3 col-sm-3 ">Phone TLF/WA</label>
                            <div class="col-md-9 col-sm-9 ">
                                <input type="text" name="phone_transaksi" id="phone_transaksi" class="form-control form-control-sm form-control form-control-sm-sm" placeholder="Phone TLF/WA">
                            </div>
                        </div>
                        <br>
                        <div class="form-group row mt-4">
                            <div class="col-md-12 col-sm-12 p-0">
                                <label class="col-form-label col-md-1 col-sm-1 ">R</label>
                                <input type="number" step="1" name="r_sph" id="r_sph" min="<?= $seting->sph_dari ?>" max="<?= $seting->sph_sampai ?>" class="form-control form-control-sm col-md-2 mr-2" placeholder="SPH">
                                <input type="number" step="1" name="r_cyl" id="r_cyl" min="<?= $seting->cyl_dari ?>" max="<?= $seting->cyl_sampai ?>" class="form-control form-control-sm col-md-2 mr-2" placeholder="CYL">
                                <input type="number" step="1" name="r_axs" id="r_axs" min="<?= $seting->axs_dari ?>" max="<?= $seting->axs_sampai ?>" class="form-control form-control-sm col-md-2 mr-2" placeholder="AXS">
                                <input type="number" step="1" name="r_add" id="r_add" min="<?= $seting->add_dari ?>" max="<?= $seting->add_sampai ?>" class="form-control form-control-sm col-md-2 mr-2" placeholder="ADD">
                                <input type="number" step="1" name="pd" id="pd" class="form-control form-control-sm col-md-2 mr-2" placeholder="PD">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6  bg-white">
                        <div class="form-group row">
                            <label class="control-label col-md-3 col-sm-3 ">Diamater</label>
                            <div class="col-md-9 col-sm-9 ">
                                <input type="number" name="diameter" id="diameter" class="form-control form-control-sm" placeholder="Diamater">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="control-label col-md-3 col-sm-3 ">Warna</label>
                            <div class="col-md-9 col-sm-9 ">
                                <input type="text" name="warna" id="warna" class="form-control form-control-sm" placeholder="Warna">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-md-3 col-sm-3 ">Tanggal Transaksi*</label>
                            <div class="col-md-9 col-sm-9 ">
                                <input type="date" name="tanggal_transaksi" id="tanggal_transaksi" class="form-control form-control-sm" placeholder="Harga Grosir">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-md-3 col-sm-3 ">Tanggal Selesai*</label>
                            <div class="col-md-9 col-sm-9 ">
                                <input type="date" name="tanggal_selesai" id="tanggal_selesai" class="form-control form-control-sm" placeholder="Harga Grosir">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-md-3 col-sm-3 ">Tanggal Ambil*</label>
                            <div class="col-md-9 col-sm-9 ">
                                <input type="date" name="tanggal_ambil" id="tanggal_ambil" class="form-control form-control-sm" placeholder="Tanggal Ambil">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label col-md-3 col-sm-3 ">Gudang</label>
                            <div class="col-md-9 col-sm-9 ">
                                <select class="select2_single form-control form-control-sm" tabindex="-1" name="id_gudang" id="id_gudang">
                                    <option value="" disabled selected>PILIH</option>
                                    @foreach ($gudang as $item)
                                        <option
                                            value="{{ $item->id }}">
                                            {{ $item->nama_gudang}}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <br>
                        <div class="form-group row">
                            <div class="col-md-12 col-sm-12 p-0">
                                <label class="col-form-label col-md-1 col-sm-1 ">L</label>
                                <input type="number" step="1" name="l_sph" id="l_sph" min="<?= $seting->sph_dari ?>" max="<?= $seting->sph_sampai ?>" class="form-control form-control-sm col-md-2 mr-2" placeholder="SPH">
                                <input type="number" step="1" name="l_cyl" id="l_cyl" min="<?= $seting->cyl_dari ?>" max="<?= $seting->cyl_sampai ?>" class="form-control form-control-sm col-md-2 mr-2" placeholder="CYL">
                                <input type="number" step="1" name="l_axs" id="l_axs" min="<?= $seting->axs_dari ?>" max="<?= $seting->axs_sampai ?>" class="form-control form-control-sm col-md-2 mr-2" placeholder="AXS">
                                <input type="number" step="1" name="l_add" id="l_add" min="<?= $seting->add_dari ?>" max="<?= $seting->add_sampai ?>" class="form-control form-control-sm col-md-2 mr-2" placeholder="ADD">
                                <input type="number" step="1" name="pd2" id="pd2" class="form-control form-control-sm col-md-2 mr-2" placeholder="PD">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Daftar Barang</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="form-group row">
                                    <div class="col-md-12 col-sm-12 ">
                                        <select class="select2_single form-control form-control-sm" tabindex="-1" name="id_produk" id="id_produk">
                                            <option value="" disabled selected>PILIH</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3 col-sm-3 ">Kode Barang</label>
                                    <div class="col-md-9 col-sm-9 ">
                                        <input type="text" name="kode_produk" id="kode_produk" class="form-control form-control-sm" placeholder="Kode Barang" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3 col-sm-3 ">Nama Barang</label>
                                    <div class="col-md-9 col-sm-9 ">
                                        <input type="text" name="nama_produk" id="nama_produk" class="form-control form-control-sm" placeholder="Nama Barang" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3 col-sm-3 ">Stock</label>
                                    <div class="col-md-9 col-sm-9 ">
                                        <input type="number" name="stock_barang" id="stock_barang" class="form-control form-control-sm" placeholder="Stock" readonly>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3 col-sm-3 ">Harga</label>
                                    <div class="col-md-9 col-sm-9 ">
                                        <select class="select2_single form-control form-control-sm" tabindex="-1" name="harga_barang" id="harga_barang">
                                            <option>PILIH</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="control-label col-md-3 col-sm-3 ">Jumlah</label>
                                    <div class="col-md-9 col-sm-9 ">
                                        <input type="number" name="jumlah_barang" id="jumlah_barang" class="form-control form-control-sm" value="0" placeholder="Jumlah Beli">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12" style="text-align: right; padding: 0px;">
                                <button class="btn btn-sm btn-success btnAdd" id="btnAdd" disabled>TAMBAH</button>
                            </div>
                        </div>
                    </div>


                    <div class="col-sm-8">
                        <div class="card-box table-responsive">
                            <table id="datatable-buttons2" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Rincian</th>
                                        <th>Harga</th>
                                        <th>Jumlah</th>
                                        <th>Sub Total</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>-</td>
                                        <td>-</td>
                                        <td>-</td>
                                        <td>-</td>
                                        <td>-</td>
                                        <td>-</td>
                                    </tr>
                                </tbody>
                            </table>

                            <!-- Section for Totals -->
                            <div class="text-end mt-3" style="border-top: 1px solid #ddd; padding-top: 10px;  text-align: right;">
                                <div class="mb-2">
                                    <label for="total" class="me-2"><strong>Total:</strong></label>
                                    <input type="text" id="total" name="total" class="form-control form-control-sm d-inline-block w-auto text-end" value="0" readonly>
                                    <input type="hidden" id="total_beli" name="total_beli" class="form-control form-control-sm d-inline-block w-auto text-end" value="0" readonly>
                                </div>
                                <div class="mb-2">
                                    <label for="diskon" class="me-2"><strong>Diskon:</strong></label>
                                    <input type="text" id="diskon" name="diskon" class="form-control form-control-sm d-inline-block w-auto text-end" value="0">
                                </div>
                                <div class="mb-2">
                                    <label for="jumlah_bayar" class="me-2"><strong>Jumlah Bayar/DP:</strong></label>
                                    <input type="text" id="jumlah_bayar" name="jumlah_bayar" class="form-control form-control-sm d-inline-block w-auto text-end" value="0" >
                                </div>
                                <div class="mb-2">
                                    <label for="sisa" class="me-2"><strong>Sisa:</strong></label>
                                    <input type="text" id="sisa" name="sisa" class="form-control form-control-sm d-inline-block w-auto text-end" value="0" readonly>
                                    <input type="hidden" id="sisa_bayar" name="sisa_bayar" class="form-control form-control-sm d-inline-block w-auto text-end" value="0" readonly>
                                </div>
                            </div>
                            <span class="text-danger " style="font-weight: bold; font-style: italic;">*Pembayaran wajib lunas di karenakan transaksi pemesanan dan pastikan sudah menerima uang cash atau bukti transfer</span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2 text-center" style="padding: 0px;">
                        <div class="form-group">
                            <label class="d-block">PEMBAYARAN</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="pembayaran" id="paymentCash" value="tunai" checked required>
                                <label class="form-check-label" for="paymentCash">CASH</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="pembayaran" id="pembayaranTrans" value="transfer">
                                <label class="form-check-label" for="pembayaranTrans">TRANSFER</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3 text-center" style="padding: 0px;">
                        <div class="form-group">
                            <label class="d-block">JENIS TRANSAKSI</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="jenis_transaksi" id="jenis_transaksi1" value="non_hutang" checked required>
                                <label class="form-check-label" for="jenis_transaksi1">NON UTANG</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="jenis_transaksi" id="jenis_transaksi2" value="hutang" disabled>
                                <label class="form-check-label" for="jenis_transaksi2">UTANG</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-7" style="text-align: right; padding: 0px;">
                        <button class="btn btn-sm btn-success mr-1" id="btnReset">RESET TRANSAKSI</button>
                        <button class="btn btn-sm btn-success mr-1" id="btnPrintNota" disabled data-id="<?= $nomor_transaksi ?>">PRINT NOTA</button>
                        <button class="btn btn-sm btn-success mr-1" id="btnProseTransaksi" >SIMPAN TRANSAKSI</button>
                        <button class="btn btn-sm btn-success " id="btnNewTransaksi" >TRANSAKSI BARU</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<audio id="notif-audio" src="{{ asset('audio/notif.mp3') }}"></audio>
@endsection

@section('scripts')
<!-- Include Select2 CSS -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />

<!-- Include jQuery (if not already included) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Include Select2 JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
<script>
    $('#id_produk, #harga_barang, #id_gudang').select2({
        placeholder: 'PILIH',
        allowClear: true
    });
    function printNota(id) {
        const url = `/kasir/transaksi-pemesanan-cetak/${id}`;
        window.location.href = url;
    }
    // menampilkan data tabel
    function loadCartData() {
        $.ajax({
            url: '/kasir/data-pemesanan-cart', // Endpoint for fetching data
            method: 'GET',
            success: function (response) {
                const no = 0;
                let total = 0;
                let tbody = $('#datatable-buttons2 tbody');
                tbody.empty(); // Clear existing rows

                if (response && response.data && Array.isArray(response.data)) {
                    response.data.forEach(item => {
                        const subTotal = parseFloat(item.sub_total) || 0;
                        total += subTotal;
                        tbody.append(`
                            <tr>
                                <td>${no +1 || '-'}</td>
                                <td>${item.barang['nama_produk'] + '<br>'|| '-'}</td>
                                <td>${item.harga ? `Rp ${parseFloat(item.harga).toLocaleString('id-ID')}` : '-'}</td>
                                <td>${item.jumlah_beli || '-'}</td>
                                <td>${item.sub_total ? `Rp ${parseFloat(item.sub_total).toLocaleString('id-ID')}` : '-'}</td>
                                <td class="text-center">
                                    <button class="btn btn-sm btn-danger delete-btn" data-id="${item.id}"><i class="fa fa-trash"></i></button>
                                </td>
                            </tr>
                        `);
                    });
                    $('#total').val(`Rp ${total.toLocaleString('id-ID')}`);
                    $('#total_beli').val(total);
                    updateSisa();
                } else {
                    tbody.append('<tr><td colspan="8">No data available</td></tr>');
                    $('#total').val('Rp 0');
                    $('#total_beli').val('Rp 0');
                }
            },
            error: function (xhr, status, error) {
                console.error('Error fetching cart data:', error);
                alert('Failed to fetch cart data. Please try again later.');
            }
        });
    }

    // Call the function to load data
    loadCartData();
    function parseCurrency(value) {
        return parseFloat(value.replace('Rp ', '').replace(/\./g, '').replace(/,/g, '') || 0);
    }

    function updateSisa() {
        const total = parseCurrency($('#total').val());
        const diskon = parseCurrency($('#diskon').val());
        const jumlahBayar = parseCurrency($('#jumlah_bayar').val());

        const sisa = total - diskon - jumlahBayar;
        $('#sisa').val(`Rp ${sisa.toLocaleString('id-ID')}`);
        $('#sisa_bayar').val(sisa);
    }

    $('#diskon, #jumlah_bayar').on('input', function () {
        updateSisa();
    });

    function checkJumlahBarang() {
        var jumlahBarang = parseInt($('#jumlah_barang').val(), 10);
        var stockBarang = parseInt($('#stock_barang').val(), 10);
        if (jumlahBarang === 0 || jumlahBarang > stockBarang || stockBarang < 2) {
            $('#btnAdd').prop('disabled', true); // Menonaktifkan tombol
        } else {
            $('#btnAdd').prop('disabled', false); // Mengaktifkan tombol
        }
    }

    checkJumlahBarang();
            $('#jumlah_barang').on('input', function() {
        checkJumlahBarang();
    });

    // simpan ke penjualan cart
    $('#btnAdd').on('click', function() {
        // Ambil nilai input
        var id = $('#id_produk').val();
        var kode = $('#kode_produk').val();
        var harga = $('#harga_barang').val();
        var jumlahBeli = $('#jumlah_barang').val();
        // Hitung sub_total
        var subTotal = harga * jumlahBeli;

        // Kirim data melalui AJAX
        $.ajax({
            url: '/kasir/simpan-pemesanan-cart', // Ganti dengan URL endpoint API Anda
            type: 'POST',
            data: {
                _token: '{{ csrf_token() }}',
                id:id,
                kode_produk: kode,
                harga: harga,
                jumlah_beli: jumlahBeli,
                sub_total: subTotal
            },
            success: function(response) {
                if (response.success) {
                    // Reset input setelah berhasil
                    $('#kode_produk').val('');
                    $('#nama_produk').val('');
                    $('#stock_barang').val('');
                    $('#harga').val('');
                    $('#jumlah_barang').val('');
                    $('#id_produk, #harga_barang').trigger('change');
                    loadCartData();
                    const notifAudio = document.getElementById('notif-audio');
                    if (notifAudio) {
                        notifAudio.volume = 1.0;
                        notifAudio.play();
                    }
                } else {
                    console.log('Terjadi kesalahan, coba lagi.');
                }
            },
            error: function(xhr, status, error) {
                console.log('Gagal menyimpan data.');
            }
        });
    });

    // delete penjulaan carat
    $(document).on('click', '.delete-btn', function () {
        const id = $(this).data('id');
        // AJAX request to delete the item
        $.ajax({
            url: `/kasir/delete-pemesanan-cart/${id}`, // Endpoint to delete the item
            method: 'DELETE',
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}',
            },
            success: function (response) {
                if (response.success) {
                    $(`#row-${id}`).remove();
                    loadCartData();
                }
            },
            error: function (xhr, status, error) {
                console.error('Error deleting item:', error);
            }
        });
    });

    $('#btnReset').click(function() {
        loadCartData();
        // Reset the form values
        $('#nama').val('');
        $('#alamat').val('');
        $('#id_user').val('');
        $('#phone_transaksi').val('');
        $('#diameter').val('');
        $('#warna').val('');
        $('#tanggal_transaksi').val('');
        $('#tanggal_selesai').val('');
        $('#tanggal_ambil').val('');
        $('#pembayaran').val('');
        $('#jenis_transaksi').val('');
        $('#total_beli').val('');
        $('#diskon').val('');
        $('#jumlah_bayar').val('');
        $('#sisa_bayar').val('');
        $('#id_gudang').val('');
    });

    $('#btnNewTransaksi').click(function() {
        window.location.reload();
    });

    // cek klik button simpan
    $('#btnProseTransaksi').on('click', function () {
        $('#btnPrintNota').prop('disabled', false);
    });

    $('#btnReset').on('click', function () {
        loadCartData();
        $('#btnPrintNota').prop('disabled', true);
    });

    $('#btnPrintNota').on('click', function () {
        const id = $(this).data('id');
        printNota(id)
    });

            // proses penjualan klik
    $('#btnProseTransaksi').on('click', function(e) {
        e.preventDefault(); // Prevent the default button action

        // Prepare the data you need to send (can be from a form, or other sources)
        var formData = {
            nomor_transaksi: $('#nomor_transaksi').val(),
            nama: $('#nama').val(),
            alamat: $('#alamat').val(),
            id_user: $('#id_user').val(),
            id_gudang: $('#id_gudang').val(),
            phone_transaksi: $('#phone_transaksi').val(),
            diameter: $('#diameter').val(),
            warna: $('#warna').val(),
            tanggal_transaksi: $('#tanggal_transaksi').val(),
            tanggal_selesai: $('#tanggal_selesai').val(),
            tanggal_ambil: $('#tanggal_ambil').val(),
            pembayaran: $('input[name="pembayaran"]:checked').val(),
            jenis_transaksi: $('input[name="jenis_transaksi"]:checked').val(),
            total_beli: $('#total_beli').val(),
            diskon: $('#diskon').val(),
            jumlah_bayar: $('#jumlah_bayar').val(),
            sisa_bayar: $('#sisa_bayar').val(),
            r_sph: $('#r_sph').val(),
            l_sph: $('#l_sph').val(),
            r_cyl: $('#r_cyl').val(),
            l_cyl: $('#l_cyl').val(),
            r_axs: $('#r_axs').val(),
            l_axs: $('#l_axs').val(),
            r_add: $('#r_add').val(),
            l_add: $('#l_add').val(),
            pd: $('#pd').val(),
            pd2: $('#pd2').val(),
        };

        let idNota = '<?= $nomor_transaksi ?>';

        // Perform the AJAX request
        $.ajax({
            url: '/kasir/simpan-pemesanan-final', // Your endpoint URL
            type: 'POST',
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}',
            },
            data: formData,
            dataType: 'json',
            success: function(response) {
                if (response.success) {
                    loadCartData();
                    $('#kode_produk').val('');
                    $('#nama_produk').val('');
                    $('#stock_barang').val('');
                    $('#id_gudang').val('');
                    $('#id_produk, #harga_barang').val(null).trigger('change');
                    Swal.fire({
                        title: 'Transaksi berhasil diproses!',
                        icon: 'success',
                        showCancelButton: true,
                        confirmButtonText: 'Tutup',
                        cancelButtonText: 'Print Nota',
                    }).then((result) => {
                        if (result.dismiss === Swal.DismissReason.cancel) {
                            // Jika tombol "Print Nota" diklik
                            printNota(idNota);
                        }
                    });

                } else {
                    Swal.fire({
                        title: 'Gagal memproses transaksi!',
                        icon: 'error',
                        confirmButtonText: 'Tutup'
                    });
                }
            },
            error: function (xhr, status, error) {
                console.error('Error fetching cart data:', error);
                let errorMessage = '<ul>';
                if (xhr.responseJSON && xhr.responseJSON.errors) {
                    Object.values(xhr.responseJSON.errors).forEach(err => {
                        errorMessage += `<li>${err}</li>`;
                    });
                } else if (xhr.responseText) {
                    errorMessage += `<li>${xhr.responseText}</li>`;
                } else {
                    errorMessage += `<li>Unexpected error occurred.</li>`;
                }
                errorMessage += '</ul>';
                Swal.fire({
                    title: 'Error',
                    html: errorMessage,
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
            }
        });
    });

    // menampilkan barang dan harga
    $('#id_gudang').on('change', function () {
        const gudangId = $(this).val();

        // Reset and disable subsequent selects
        $('#id_produk').empty().append('<option value="" disabled selected>PILIH BARANG</option>').prop('disabled', true);
        $('#harga_barang').empty().append('<option value="" disabled selected>PILIH HARGA</option>').prop('disabled', true);

        // Fetch Barang based on Gudang selection
        if (gudangId) {
            $.ajax({
                url: '/kasir/transaksi-pemesanan-data-barang', // Adjust URL to match your route
                type: 'GET',
                data: { id_gudang: gudangId },
                success: function (data) {
                    if (data.length > 0) {
                        $('#id_produk').prop('disabled', false);
                        data.forEach(item => {
                            $('#id_produk').append(
                                `<option value="${item.id_barang}"
                                        data-kode="${item.kode_produk}"
                                        data-nama="${item.nama_produk}"
                                        data-stock="${item.stock_akhir}"
                                        data-gudang="${item.gudang_name}"
                                        data-id_gudang="${item.gudang_id}">
                                    ${item.kode_produk} [${item.nama_produk}]
                                </option>`
                            );
                        });

                        // When a product is selected, update the fields
                        $('#id_produk').on('change', function () {
                            var selectedOption = $(this).find('option:selected');
                            var kode = selectedOption.data('kode');
                            var nama = selectedOption.data('nama');
                            var stock = selectedOption.data('stock');
                            var gudang = selectedOption.data('gudang');

                            $('#kode_produk').val(kode);
                            $('#nama_produk').val(nama);
                            $('#stock_barang').val(stock);
                            $('#gudang_barang').val(gudang);
                        });
                    }
                },
                error: function () {
                    Swal.fire({
                        title: 'Gagal memproses pengambilan daftar barang pada gudang, hubungi administrator gudang!',
                        icon: 'error',
                        confirmButtonText: 'Tutup'
                    });
                }
            });
        }
    });


    $('#id_produk').on('change', function () {
        const selectedOption = $(this).find('option:selected');
        const barangId = $(this).val();
        $('#harga_barang').empty().append('<option value="" disabled selected>PILIH HARGA</option>').prop('disabled', true);

        if (barangId) {
            $.ajax({
                url: '/kasir/transaksi-pemesanan-data-harga',
                type: 'GET',
                data: { id_barang: barangId },
                success: function (data) {
                    if (data.length > 0) {
                        $('#harga_barang').prop('disabled', false);
                        data.forEach(harga => {
                            $('#harga_barang').append(`<option value="${harga.price}">${harga.Ket} - Rp ${parseFloat(harga.price).toLocaleString('id-ID')}</option>`);
                        });
                    }
                },
                error: function () {
                    alert('Failed to fetch Harga');
                }
            });
        }
    });

</script>
@endsection
