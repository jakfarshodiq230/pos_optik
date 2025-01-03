-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 28 Des 2024 pada 21.58
-- Versi server: 10.6.20-MariaDB-cll-lve-log
-- Versi PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shom5685_optik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(27, '0001_01_01_000000_create_users_table', 1),
(28, '0001_01_01_000001_create_cache_table', 1),
(29, '0001_01_01_000002_create_jobs_table', 1),
(30, '2024_11_30_102325_create_op_jenis_table', 1),
(31, '2024_11_30_120825_create_op_kategori_table', 1),
(32, '2024_11_30_231604_create_op_seting_lensa_table', 1),
(33, '2024_12_01_071326_create_op_barang_table', 1),
(34, '2024_12_01_162622_create_op_gudang_table', 1),
(35, '2024_12_01_173911_create_op_suplaier_table', 1),
(36, '2024_12_01_184159_create_op_barang_detail_table', 1),
(37, '2024_12_01_184656_create_op_type_table', 1),
(38, '2024_12_02_053542_create_op_toko_table', 1),
(39, '2024_12_02_053904_create_op_toko_cabang_table', 1),
(40, '2024_12_02_074856_create_personal_access_tokens_table', 2),
(41, '2024_12_03_053352_create_op_barang_gudang_stock_table', 3),
(42, '2024_12_06_085022_create_op_pemesanan_table', 4),
(43, '2024_12_06_085047_create_op_pemesanan_detail_table', 5),
(44, '2024_12_06_085037_create_op_pemesanan_cart_table', 6),
(45, '2024_12_06_191948_create_op_pemesanan_log_table', 7),
(46, '2024_12_07_091403_create_op_kas_table', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_barang`
--

CREATE TABLE `op_barang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_produk` char(50) NOT NULL,
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `id_gudang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `keterangan_produk` text NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_barang`
--

INSERT INTO `op_barang` (`id`, `kode_produk`, `id_kategori`, `id_gudang`, `id_user`, `nama_produk`, `keterangan_produk`, `barcode`, `created_at`, `updated_at`) VALUES
(29, 'BRG20240001', 3, 7, 3, 'Lensa SV.CR PL', 'Lensa SV.CR PL', 'barcode_barang/BRG20240001.png', '2024-12-13 17:55:30', '2024-12-13 17:55:30'),
(30, 'BRG20240002', 3, 7, 3, 'Lensa SV.CR s–1.00', 'aa', 'barcode_barang/BRG20240002.png', '2024-12-13 17:58:56', '2024-12-13 17:58:56'),
(31, 'BRG20240003', 3, 7, 3, 'Lensa SV.CR s+1.00', 'ff', 'barcode_barang/BRG20240003.png', '2024-12-13 18:00:03', '2024-12-13 18:00:03'),
(32, 'BRG20240004', 3, 7, 3, 'Lensa SV.CR s-1.00 c-0.25', 'Lensa SV.CR s-1.00 c-0.25', 'barcode_barang/BRG20240004.png', '2024-12-13 18:01:16', '2024-12-13 18:01:16'),
(33, 'BRG20240005', 3, 7, 3, 'Lensa KR.CR PL a+1.00', 'Lensa KR.CR PL a+1.00', 'barcode_barang/BRG20240005.png', '2024-12-13 18:02:19', '2024-12-13 18:02:19'),
(34, 'BRG20240006', 3, 7, 3, 'Lensa Order', 'Lensa Order', 'barcode_barang/BRG20240006.png', '2024-12-13 18:02:55', '2024-12-13 18:02:55'),
(35, 'BRG20240007', 3, 7, 3, 'Frame Nike Premium', 'Frame Nike Premium', 'barcode_barang/BRG20240007.png', '2024-12-13 18:06:52', '2024-12-13 18:06:52'),
(36, 'BRG20240008', 4, 7, 3, 'Frame Promo', 'Frame', 'barcode_barang/BRG20240008.png', '2024-12-13 18:08:14', '2024-12-13 18:08:14'),
(37, 'BRG20240009', 3, 7, 3, 'KMB +1.00', 'KMB', 'barcode_barang/BRG20240009.png', '2024-12-13 18:09:20', '2024-12-13 18:09:20'),
(38, 'BRG20240010', 5, 7, 3, 'Matake Brown -2.00', 'ff', 'barcode_barang/BRG20240010.png', '2024-12-14 06:25:57', '2024-12-14 06:25:57'),
(39, 'BRG20240011', 3, 7, 3, 'SV.CR -0.25', 'SV.cr -0.25', 'barcode_barang/BRG20240011.png', '2024-12-14 10:33:42', '2024-12-14 10:33:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_barang_cabang_stock`
--

CREATE TABLE `op_barang_cabang_stock` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_barang` bigint(20) UNSIGNED NOT NULL,
  `id_suplaier` bigint(20) UNSIGNED DEFAULT NULL,
  `id_gudang` int(10) UNSIGNED NOT NULL,
  `id_toko` int(11) NOT NULL,
  `id_cabang` int(11) NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `stock_masuk` int(11) DEFAULT 0,
  `stock_keluar` int(11) DEFAULT 0,
  `stock_akhir` int(11) DEFAULT 0,
  `jenis_transaksi_stock` varchar(255) DEFAULT NULL,
  `keterangan_stock_cabang` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_barang_cabang_stock`
--

INSERT INTO `op_barang_cabang_stock` (`id`, `id_barang`, `id_suplaier`, `id_gudang`, `id_toko`, `id_cabang`, `id_user`, `stock_masuk`, `stock_keluar`, `stock_akhir`, `jenis_transaksi_stock`, `keterangan_stock_cabang`, `created_at`, `updated_at`) VALUES
(1, 29, 2, 7, 1, 1, 6, 200, 0, 200, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-14 05:31:51', '2024-12-26 14:27:10'),
(2, 30, 2, 7, 1, 1, 6, 200, 0, 200, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-14 05:32:16', '2024-12-26 14:29:37'),
(3, 31, 2, 7, 1, 1, 6, 100, 0, 100, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-14 05:32:35', '2024-12-14 05:32:35'),
(4, 32, 2, 7, 1, 1, 6, 100, 0, 100, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-14 05:32:54', '2024-12-14 05:32:54'),
(5, 33, 2, 7, 1, 1, 6, 100, 0, 100, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-14 05:33:14', '2024-12-14 05:33:14'),
(6, 34, 2, 7, 1, 1, 6, 100, 0, 100, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-14 05:33:35', '2024-12-14 05:33:35'),
(7, 35, 2, 7, 1, 1, 6, 100, 2, 98, 'Penjualan', 'Penjualan barang dengan nomor transaksi 20242612-1-0002', '2024-12-14 05:33:54', '2024-12-26 14:38:37'),
(8, 36, 2, 7, 1, 1, 6, 100, 3, 97, 'Penjualan', 'Penjualan barang dengan nomor transaksi 20241412-1-0003', '2024-12-14 05:34:11', '2024-12-14 11:05:27'),
(9, 38, 2, 7, 1, 1, 6, 5, 3, 2, 'Penjualan', 'Penjualan barang dengan nomor transaksi 20241412-1-0005', '2024-12-14 06:28:50', '2024-12-14 11:45:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_barang_cabang_stock_log`
--

CREATE TABLE `op_barang_cabang_stock_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_barang` bigint(20) UNSIGNED NOT NULL,
  `id_suplaier` bigint(20) UNSIGNED DEFAULT NULL,
  `id_gudang` int(10) UNSIGNED NOT NULL,
  `id_toko` int(11) NOT NULL,
  `id_cabang` int(11) NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `stock_masuk` int(11) NOT NULL DEFAULT 0,
  `stock_keluar` int(11) NOT NULL DEFAULT 0,
  `stock_akhir` int(11) NOT NULL DEFAULT 0,
  `jenis_transaksi_stock` varchar(255) DEFAULT NULL,
  `keterangan_stock_cabang` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_barang_cabang_stock_log`
--

INSERT INTO `op_barang_cabang_stock_log` (`id`, `id_barang`, `id_suplaier`, `id_gudang`, `id_toko`, `id_cabang`, `id_user`, `stock_masuk`, `stock_keluar`, `stock_akhir`, `jenis_transaksi_stock`, `keterangan_stock_cabang`, `created_at`, `updated_at`) VALUES
(1, 29, 2, 7, 1, 1, 6, 100, 0, 100, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-14 05:31:51', '2024-12-14 05:31:51'),
(2, 30, 2, 7, 1, 1, 6, 100, 0, 100, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-14 05:32:16', '2024-12-14 05:32:16'),
(3, 31, 2, 7, 1, 1, 6, 100, 0, 100, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-14 05:32:35', '2024-12-14 05:32:35'),
(4, 32, 2, 7, 1, 1, 6, 100, 0, 100, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-14 05:32:54', '2024-12-14 05:32:54'),
(5, 33, 2, 7, 1, 1, 6, 100, 0, 100, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-14 05:33:14', '2024-12-14 05:33:14'),
(6, 34, 2, 7, 1, 1, 6, 100, 0, 100, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-14 05:33:35', '2024-12-14 05:33:35'),
(7, 35, 2, 7, 1, 1, 6, 100, 0, 100, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-14 05:33:54', '2024-12-14 05:33:54'),
(8, 36, 2, 7, 1, 1, 6, 100, 0, 100, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-14 05:34:11', '2024-12-14 05:34:11'),
(9, 38, 2, 7, 1, 1, 6, 5, 0, 5, 'masuk', 'Masuk stock barang masuk: 5', '2024-12-14 06:28:50', '2024-12-14 06:28:50'),
(10, 38, 2, 7, 1, 1, 5, 5, 1, 4, 'Penjualan', 'Penjualan barang dengan nomor transaksi 20241412-1-0001', '2024-12-14 06:59:44', '2024-12-14 06:59:44'),
(11, 36, 2, 7, 1, 1, 5, 100, 1, 99, 'Penjualan', 'Penjualan barang dengan nomor transaksi 20241412-1-0002', '2024-12-14 09:44:30', '2024-12-14 09:44:30'),
(12, 36, 2, 7, 1, 1, 5, 99, 1, 98, 'Penjualan', 'Penjualan barang dengan nomor transaksi 20241412-1-0002', '2024-12-14 09:44:30', '2024-12-14 09:44:30'),
(13, 36, 2, 7, 1, 1, 5, 98, 1, 97, 'Penjualan', 'Penjualan barang dengan nomor transaksi 20241412-1-0003', '2024-12-14 11:05:27', '2024-12-14 11:05:27'),
(14, 38, 2, 7, 1, 1, 5, 4, 1, 3, 'Penjualan', 'Penjualan barang dengan nomor transaksi 20241412-1-0004', '2024-12-14 11:40:21', '2024-12-14 11:40:21'),
(15, 38, 2, 7, 1, 1, 5, 3, 1, 2, 'Penjualan', 'Penjualan barang dengan nomor transaksi 20241412-1-0005', '2024-12-14 11:45:03', '2024-12-14 11:45:03'),
(16, 29, 2, 7, 1, 1, 6, 100, 0, 200, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-26 14:27:10', '2024-12-26 14:27:10'),
(17, 30, 2, 7, 1, 1, 6, 100, 0, 200, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-26 14:29:37', '2024-12-26 14:29:37'),
(18, 35, 2, 7, 1, 1, 5, 100, 1, 99, 'Penjualan', 'Penjualan barang dengan nomor transaksi 20242612-1-0001', '2024-12-26 14:36:14', '2024-12-26 14:36:14'),
(19, 35, 2, 7, 1, 1, 5, 99, 1, 98, 'Penjualan', 'Penjualan barang dengan nomor transaksi 20242612-1-0002', '2024-12-26 14:38:37', '2024-12-26 14:38:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_barang_detail`
--

CREATE TABLE `op_barang_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_barang` bigint(20) UNSIGNED NOT NULL,
  `id_jenis` bigint(20) UNSIGNED NOT NULL,
  `id_type` bigint(20) UNSIGNED NOT NULL,
  `R_SPH` varchar(8) DEFAULT NULL,
  `L_SPH` varchar(8) DEFAULT NULL,
  `R_CYL` varchar(8) DEFAULT NULL,
  `L_CYL` varchar(8) DEFAULT NULL,
  `R_AXS` varchar(8) DEFAULT NULL,
  `L_AXS` varchar(8) DEFAULT NULL,
  `R_ADD` varchar(8) DEFAULT NULL,
  `L_ADD` varchar(8) DEFAULT NULL,
  `PD` varchar(8) DEFAULT NULL,
  `PD2` varchar(8) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_barang_detail`
--

INSERT INTO `op_barang_detail` (`id`, `id_barang`, `id_jenis`, `id_type`, `R_SPH`, `L_SPH`, `R_CYL`, `L_CYL`, `R_AXS`, `L_AXS`, `R_ADD`, `L_ADD`, `PD`, `PD2`, `created_at`, `updated_at`) VALUES
(26, 29, 4, 2, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 17:55:30', '2024-12-13 17:55:30'),
(27, 30, 4, 2, '-1.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 17:58:56', '2024-12-13 17:58:56'),
(28, 31, 5, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 18:00:03', '2024-12-14 06:24:21'),
(29, 32, 4, 2, '-1.00', NULL, '-0.25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 18:01:16', '2024-12-13 18:01:16'),
(30, 33, 4, 2, '0', NULL, '+1.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 18:02:19', '2024-12-13 18:02:19'),
(31, 34, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 18:02:55', '2024-12-13 18:02:55'),
(32, 35, 8, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 18:06:52', '2024-12-13 18:06:52'),
(33, 36, 9, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 18:08:14', '2024-12-13 18:08:14'),
(34, 37, 7, 2, '+1.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-13 18:09:20', '2024-12-13 18:09:20'),
(35, 38, 5, 2, '-2.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-14 06:25:57', '2024-12-14 06:25:57'),
(36, 39, 5, 2, '-0.25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-14 10:33:42', '2024-12-14 10:33:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_barang_gudang_stock`
--

CREATE TABLE `op_barang_gudang_stock` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_barang` bigint(20) UNSIGNED NOT NULL,
  `id_suplaier` bigint(20) UNSIGNED DEFAULT NULL,
  `id_gudang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `stock_masuk` int(11) NOT NULL DEFAULT 0,
  `stock_keluar` int(11) NOT NULL DEFAULT 0,
  `stock_akhir` int(11) NOT NULL DEFAULT 0,
  `jenis_transaksi_stock` varchar(255) DEFAULT NULL,
  `keterangan_stock_gudang` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_barang_gudang_stock`
--

INSERT INTO `op_barang_gudang_stock` (`id`, `id_barang`, `id_suplaier`, `id_gudang`, `id_user`, `stock_masuk`, `stock_keluar`, `stock_akhir`, `jenis_transaksi_stock`, `keterangan_stock_gudang`, `created_at`, `updated_at`) VALUES
(6, 29, 2, 7, 3, 100, 0, 100, 'pesanan', 'Data telah diperbarui setelah penghapusan log.', '2024-12-13 18:10:30', '2024-12-26 14:19:38'),
(7, 30, 2, 7, 3, 100, 2, 98, 'pesanan', 'Stock keluar untuk pesanan 20241412-1-0002', '2024-12-13 18:10:51', '2024-12-14 09:46:45'),
(8, 31, 2, 7, 3, 200, 0, 200, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-13 18:11:15', '2024-12-13 18:11:41'),
(9, 38, 2, 7, 3, 50, 0, 50, 'masuk', 'Masuk stock barang masuk: 50', '2024-12-14 06:27:34', '2024-12-14 06:27:34'),
(10, 36, 2, 7, 3, 100, 2, 98, 'pesanan', 'Stock keluar untuk pesanan 20241412-1-0002', '2024-12-14 09:34:06', '2024-12-14 09:46:45'),
(11, 39, 2, 7, 3, 12, 0, 12, 'masuk', 'Masuk stock barang masuk: 12', '2024-12-14 10:35:49', '2024-12-14 10:35:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_barang_gudang_stock_log`
--

CREATE TABLE `op_barang_gudang_stock_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_barang` bigint(20) UNSIGNED NOT NULL,
  `id_suplaier` bigint(20) UNSIGNED DEFAULT NULL,
  `id_gudang` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `stock_masuk` int(11) NOT NULL DEFAULT 0,
  `stock_keluar` int(11) NOT NULL DEFAULT 0,
  `stock_akhir` int(11) NOT NULL DEFAULT 0,
  `jenis_transaksi_stock` varchar(255) DEFAULT NULL,
  `keterangan_stock_gudang` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_barang_gudang_stock_log`
--

INSERT INTO `op_barang_gudang_stock_log` (`id`, `id_barang`, `id_suplaier`, `id_gudang`, `id_user`, `stock_masuk`, `stock_keluar`, `stock_akhir`, `jenis_transaksi_stock`, `keterangan_stock_gudang`, `created_at`, `updated_at`) VALUES
(41, 29, 2, 7, 3, 100, 0, 100, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-13 18:10:30', '2024-12-13 18:10:30'),
(42, 30, 2, 7, 3, 100, 0, 100, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-13 18:10:51', '2024-12-13 18:10:51'),
(43, 31, 2, 7, 3, 100, 0, 100, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-13 18:11:15', '2024-12-13 18:11:15'),
(44, 31, 2, 7, 3, 100, 0, 200, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-13 18:11:41', '2024-12-13 18:11:41'),
(45, 38, 2, 7, 3, 50, 0, 50, 'masuk', 'Masuk stock barang masuk: 50', '2024-12-14 06:27:34', '2024-12-14 06:27:34'),
(46, 36, 2, 7, 3, 100, 0, 100, 'masuk', 'Masuk stock barang masuk: 100', '2024-12-14 09:34:06', '2024-12-14 09:34:06'),
(47, 36, 2, 7, 3, 0, 1, 99, 'pesanan', 'Stock keluar untuk pesanan 20241412-1-0001', '2024-12-14 09:45:25', '2024-12-14 09:45:25'),
(48, 29, 2, 7, 3, 0, 2, 100, 'pesanan', 'Stock keluar untuk pesanan 20241412-1-0001', '2024-12-14 09:45:25', '2024-12-26 14:14:03'),
(49, 36, 2, 7, 3, 0, 1, 98, 'pesanan', 'Stock keluar untuk pesanan 20241412-1-0002', '2024-12-14 09:46:45', '2024-12-14 09:46:45'),
(50, 30, 2, 7, 3, 0, 2, 98, 'pesanan', 'Stock keluar untuk pesanan 20241412-1-0002', '2024-12-14 09:46:45', '2024-12-14 09:46:45'),
(51, 39, 2, 7, 3, 12, 0, 12, 'masuk', 'Masuk stock barang masuk: 12', '2024-12-14 10:35:49', '2024-12-14 10:35:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_barang_harga`
--

CREATE TABLE `op_barang_harga` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_barang` bigint(20) UNSIGNED NOT NULL,
  `harga_modal` decimal(10,0) NOT NULL,
  `harga_jual` decimal(10,0) NOT NULL,
  `harga_grosir_1` decimal(10,0) NOT NULL,
  `harga_grosir_2` decimal(10,0) NOT NULL,
  `harga_grosir_3` decimal(10,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_barang_harga`
--

INSERT INTO `op_barang_harga` (`id`, `id_barang`, `harga_modal`, `harga_jual`, `harga_grosir_1`, `harga_grosir_2`, `harga_grosir_3`, `created_at`, `updated_at`) VALUES
(29, 29, 150000, 30000, 150000, 150000, 150000, '2024-12-13 17:55:30', '2024-12-13 17:55:30'),
(30, 30, 150000, 30000, 150000, 150000, 150000, '2024-12-13 17:58:56', '2024-12-13 17:58:56'),
(31, 31, 150000, 30000, 150000, 150000, 150000, '2024-12-13 18:00:03', '2024-12-14 06:24:21'),
(32, 32, 30000, 150000, 150000, 150000, 150000, '2024-12-13 18:01:16', '2024-12-13 18:01:16'),
(33, 33, 40000, 200000, 200000, 200000, 200000, '2024-12-13 18:02:19', '2024-12-13 18:02:19'),
(34, 34, 0, 0, 0, 0, 0, '2024-12-13 18:02:55', '2024-12-13 18:02:55'),
(35, 35, 1150000, 1150000, 1150000, 1150000, 1150000, '2024-12-13 18:06:52', '2024-12-13 18:06:52'),
(36, 36, 0, 0, 0, 0, 0, '2024-12-13 18:08:14', '2024-12-13 18:08:14'),
(37, 37, 80000, 80000, 80000, 80000, 80000, '2024-12-13 18:09:20', '2024-12-13 18:09:20'),
(38, 38, 30000, 80000, 80000, 80000, 80000, '2024-12-14 06:25:57', '2024-12-14 06:25:57'),
(39, 39, 15000, 75000, 75000, 75000, 75000, '2024-12-14 10:33:42', '2024-12-14 10:33:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_gudang`
--

CREATE TABLE `op_gudang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_gudang` varchar(100) NOT NULL,
  `lokasi_gudang` varchar(255) NOT NULL,
  `deskripsi_gudang` text DEFAULT NULL,
  `status_gudang` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_gudang`
--

INSERT INTO `op_gudang` (`id`, `nama_gudang`, `lokasi_gudang`, `deskripsi_gudang`, `status_gudang`, `created_at`, `updated_at`) VALUES
(7, 'Gudang Utama', 'pekan', 'aa', '1', '2024-12-10 12:08:05', '2024-12-10 12:08:05'),
(8, 'Gudang Pusat', 'Optik Mandiri 1', 'Paset dan stock', '1', '2024-12-12 06:42:27', '2024-12-12 06:42:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_jenis`
--

CREATE TABLE `op_jenis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `status_jenis` enum('1','0') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_jenis`
--

INSERT INTO `op_jenis` (`id`, `jenis`, `status_jenis`, `created_at`, `updated_at`) VALUES
(4, 'Progressive', '1', '2024-12-11 01:48:46', '2024-12-11 01:48:46'),
(5, 'Single Vision', '1', '2024-12-11 01:49:21', '2024-12-11 01:49:21'),
(6, 'Lensa Pesan', '1', '2024-12-11 01:49:30', '2024-12-11 01:49:30'),
(7, 'Kriptok', '1', '2024-12-12 06:44:14', '2024-12-12 06:44:14'),
(8, 'Nike', '1', '2024-12-13 18:05:25', '2024-12-13 18:05:25'),
(9, 'Promo', '1', '2024-12-13 18:07:27', '2024-12-13 18:07:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_kas`
--

CREATE TABLE `op_kas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_cabang` int(11) NOT NULL,
  `kode_transaksi` varchar(255) NOT NULL,
  `tanggal` datetime NOT NULL,
  `keterangan` text NOT NULL,
  `debit` decimal(15,0) NOT NULL DEFAULT 0,
  `kredit` decimal(15,0) NOT NULL DEFAULT 0,
  `saldo` decimal(15,0) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_kas`
--

INSERT INTO `op_kas` (`id`, `id_user`, `id_cabang`, `kode_transaksi`, `tanggal`, `keterangan`, `debit`, `kredit`, `saldo`, `created_at`, `updated_at`) VALUES
(27, 5, 1, '20241412-1-0001', '2024-12-14 13:59:44', 'Saldo tambahan dari transaksi penjualan tunai dengan nomor transaksi 20241412-1-0001', 80000, 0, 80000, '2024-12-14 06:59:44', '2024-12-14 06:59:44'),
(28, 5, 1, '20241412-1-0002', '2024-12-14 16:44:30', 'Saldo tambahan dari transaksi penjualan tunai dengan nomor transaksi 20241412-1-0002', 250000, 0, 330000, '2024-12-14 09:44:30', '2024-12-14 09:44:30'),
(29, 6, 1, '2024-12-13-1-28719', '2024-12-14 17:54:38', 'Galon', 0, 35000, 295000, '2024-12-14 10:54:38', '2024-12-14 10:54:38'),
(30, 5, 1, '20241412-1-0004', '2024-12-14 18:41:17', 'Saldo tambahan dari transaksi pelunasan hutang total80000 dengan nomor transaksi 20241412-1-0004', 80000, 0, 375000, '2024-12-14 11:41:17', '2024-12-14 22:28:01'),
(31, 6, 1, '2024-12-25-1-84956', '2024-12-26 21:30:57', 'tes', 10000, 0, 385000, '2024-12-26 14:30:57', '2024-12-26 14:30:57'),
(32, 5, 1, '20242612-1-0001', '2024-12-26 21:36:14', 'Saldo tambahan dari transaksi penjualan tunai dengan nomor transaksi 20242612-1-0001', 1150000, 0, 1525000, '2024-12-26 14:36:14', '2024-12-26 14:36:14'),
(33, 5, 1, '20242612-1-0002', '2024-12-26 21:38:37', 'Saldo tambahan dari transaksi penjualan tunai dengan nomor transaksi 20242612-1-0002', 1150000, 0, 2675000, '2024-12-26 14:38:37', '2024-12-26 14:38:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_kategori`
--

CREATE TABLE `op_kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(100) NOT NULL,
  `status` enum('1','0') NOT NULL,
  `pesanan` enum('Ya','Tidak') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_kategori`
--

INSERT INTO `op_kategori` (`id`, `nama_kategori`, `status`, `pesanan`, `created_at`, `updated_at`) VALUES
(3, 'Lensa', '1', 'Ya', '2024-12-10 12:02:10', '2024-12-10 12:02:10'),
(4, 'Frame', '1', 'Ya', '2024-12-10 12:02:22', '2024-12-10 12:02:22'),
(5, 'Softlens', '1', 'Ya', '2024-12-11 01:46:35', '2024-12-12 06:43:41'),
(6, 'Air Soflent', '1', 'Ya', '2024-12-11 01:46:48', '2024-12-12 06:43:26'),
(10, 'Soflent', '1', 'Ya', '2024-12-26 13:56:26', '2024-12-26 13:56:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_pemesanan`
--

CREATE TABLE `op_pemesanan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomor_transaksi` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_cabang` bigint(20) UNSIGNED NOT NULL,
  `id_gudang` int(11) NOT NULL,
  `phone_transaksi` varchar(255) NOT NULL,
  `diameter` varchar(255) DEFAULT NULL,
  `warna` varchar(255) DEFAULT NULL,
  `tanggal_transaksi` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `tanggal_ambil` date NOT NULL,
  `pembayaran` varchar(255) NOT NULL,
  `jenis_transaksi` varchar(255) NOT NULL,
  `total_beli` decimal(15,0) NOT NULL,
  `diskon` decimal(15,0) NOT NULL,
  `jumlah_bayar` decimal(15,0) NOT NULL,
  `sisa_bayar` decimal(15,0) NOT NULL,
  `jumlah_bayar_dp` decimal(15,0) DEFAULT NULL,
  `jumlah_sisa_dp` decimal(15,0) DEFAULT NULL,
  `jumlah_lunas_dp` decimal(15,0) DEFAULT NULL,
  `R_SPH` varchar(8) DEFAULT NULL,
  `L_SPH` varchar(8) DEFAULT NULL,
  `R_CYL` varchar(8) DEFAULT NULL,
  `L_CYL` varchar(8) DEFAULT NULL,
  `R_AXS` varchar(8) DEFAULT NULL,
  `L_AXS` varchar(8) DEFAULT NULL,
  `R_ADD` varchar(8) DEFAULT NULL,
  `L_ADD` varchar(8) DEFAULT NULL,
  `PD` varchar(8) DEFAULT NULL,
  `PD2` varchar(8) DEFAULT NULL,
  `status_pemesanan` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_pemesanan`
--

INSERT INTO `op_pemesanan` (`id`, `nomor_transaksi`, `nama`, `alamat`, `id_user`, `id_cabang`, `id_gudang`, `phone_transaksi`, `diameter`, `warna`, `tanggal_transaksi`, `tanggal_selesai`, `tanggal_ambil`, `pembayaran`, `jenis_transaksi`, `total_beli`, `diskon`, `jumlah_bayar`, `sisa_bayar`, `jumlah_bayar_dp`, `jumlah_sisa_dp`, `jumlah_lunas_dp`, `R_SPH`, `L_SPH`, `R_CYL`, `L_CYL`, `R_AXS`, `L_AXS`, `R_ADD`, `L_ADD`, `PD`, `PD2`, `status_pemesanan`, `created_at`, `updated_at`) VALUES
(1, '20241412-1-0001', 'Ari', '-', 5, 1, 7, '081210635630', NULL, NULL, '2024-12-14', '2024-12-14', '2024-12-14', 'tunai', 'non_hutang', 150000, 0, 150000, 0, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'kirim', '2024-12-14 09:38:31', '2024-12-14 09:45:25'),
(2, '20241412-1-0002', 'Ali', 'x', 5, 1, 7, '081210635630', NULL, NULL, '2024-12-14', '2024-12-14', '2024-12-15', 'tunai', 'non_hutang', 400000, 0, 400000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'kirim', '2024-12-14 09:41:47', '2024-12-14 09:46:45'),
(3, '20241412-1-0003', 'Susan', 'X', 5, 1, 7, '0836646578', NULL, NULL, '2024-12-14', '2024-12-15', '2024-12-15', 'transfer', 'non_hutang', 150000, 0, 150000, 0, NULL, NULL, NULL, '-0.25', '-0.25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pesan', '2024-12-14 11:16:26', '2024-12-14 11:16:26'),
(4, '20242612-1-0001', 'Tes', 'tes', 5, 1, 7, '085697455157', NULL, NULL, '2024-12-26', '2024-12-29', '2024-12-30', 'tunai', 'non_hutang', 150000, 0, 150000, 0, NULL, NULL, NULL, '+3.00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pesan', '2024-12-26 14:40:50', '2024-12-26 14:40:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_pemesanan_cart`
--

CREATE TABLE `op_pemesanan_cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_barang` bigint(20) UNSIGNED NOT NULL,
  `id_cabang` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `kode_produk` varchar(255) NOT NULL,
  `harga` decimal(15,0) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `sub_total` decimal(15,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_pemesanan_detail`
--

CREATE TABLE `op_pemesanan_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomor_transaksi` varchar(255) NOT NULL,
  `id_barang` bigint(20) UNSIGNED NOT NULL,
  `id_cabang` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `kode_produk` varchar(255) NOT NULL,
  `harga_barang` decimal(15,0) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `sub_total_transaksi` decimal(15,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_pemesanan_detail`
--

INSERT INTO `op_pemesanan_detail` (`id`, `nomor_transaksi`, `id_barang`, `id_cabang`, `id_user`, `kode_produk`, `harga_barang`, `jumlah_barang`, `sub_total_transaksi`, `created_at`, `updated_at`) VALUES
(1, '20241412-1-0001', 36, 1, 5, 'BRG20240008', 0, 1, 0, '2024-12-14 09:38:31', '2024-12-14 09:38:31'),
(2, '20241412-1-0001', 29, 1, 5, 'BRG20240001', 75000, 2, 150000, '2024-12-14 09:38:31', '2024-12-14 09:38:31'),
(3, '20241412-1-0002', 36, 1, 5, 'BRG20240008', 250000, 1, 250000, '2024-12-14 09:41:47', '2024-12-14 09:41:47'),
(4, '20241412-1-0002', 30, 1, 5, 'BRG20240002', 75000, 2, 150000, '2024-12-14 09:41:47', '2024-12-14 09:41:47'),
(5, '20241412-1-0003', 39, 1, 5, 'BRG20240011', 75000, 2, 150000, '2024-12-14 11:16:26', '2024-12-14 11:16:26'),
(6, '20241412-1-0003', 36, 1, 5, 'BRG20240008', 0, 1, 0, '2024-12-14 11:16:26', '2024-12-14 11:16:26'),
(7, '20242612-1-0001', 29, 1, 5, 'BRG20240001', 150000, 1, 150000, '2024-12-26 14:40:50', '2024-12-26 14:40:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_pemesanan_log`
--

CREATE TABLE `op_pemesanan_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomor_transaksi` varchar(255) NOT NULL,
  `status_log` varchar(255) DEFAULT NULL,
  `keterangan_log` text DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_pemesanan_log`
--

INSERT INTO `op_pemesanan_log` (`id`, `nomor_transaksi`, `status_log`, `keterangan_log`, `id_user`, `created_at`, `updated_at`) VALUES
(1, '20241412-1-0001', 'pesan', 'pemesanan berhasil', 5, '2024-12-14 09:38:31', '2024-12-14 09:38:31'),
(2, '20241412-1-0002', 'pesan', 'pemesanan berhasil', 5, '2024-12-14 09:41:47', '2024-12-14 09:41:47'),
(3, '20241412-1-0001', 'kirim', 'selesai', 3, '2024-12-14 09:45:25', '2024-12-14 09:45:25'),
(4, '20241412-1-0002', 'kirim', 'selesai', 3, '2024-12-14 09:46:45', '2024-12-14 09:46:45'),
(5, '20241412-1-0003', 'pesan', 'pemesanan berhasil', 5, '2024-12-14 11:16:26', '2024-12-14 11:16:26'),
(6, '20242612-1-0001', 'pesan', 'pemesanan berhasil', 5, '2024-12-26 14:40:50', '2024-12-26 14:40:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_penjualan`
--

CREATE TABLE `op_penjualan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomor_transaksi` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_cabang` int(11) NOT NULL,
  `phone_transaksi` varchar(255) DEFAULT NULL,
  `diameter` int(11) DEFAULT NULL,
  `warna` varchar(255) DEFAULT NULL,
  `tanggal_transaksi` date NOT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `tanggal_ambil` date DEFAULT NULL,
  `pembayaran` varchar(255) NOT NULL,
  `jenis_transaksi` varchar(255) NOT NULL,
  `total_beli` decimal(15,0) NOT NULL,
  `diskon` decimal(15,0) DEFAULT NULL,
  `jumlah_bayar` decimal(15,0) DEFAULT NULL,
  `sisa_bayar` decimal(15,0) DEFAULT NULL,
  `jumlah_bayar_dp` decimal(15,0) DEFAULT NULL,
  `jumlah_sisa_dp` decimal(15,0) DEFAULT NULL,
  `jumlah_lunas_dp` decimal(15,0) DEFAULT NULL,
  `status_penjualan` enum('lunas','belum_lunas') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_penjualan`
--

INSERT INTO `op_penjualan` (`id`, `nomor_transaksi`, `nama`, `alamat`, `id_user`, `id_cabang`, `phone_transaksi`, `diameter`, `warna`, `tanggal_transaksi`, `tanggal_selesai`, `tanggal_ambil`, `pembayaran`, `jenis_transaksi`, `total_beli`, `diskon`, `jumlah_bayar`, `sisa_bayar`, `jumlah_bayar_dp`, `jumlah_sisa_dp`, `jumlah_lunas_dp`, `status_penjualan`, `created_at`, `updated_at`) VALUES
(47, '20241412-1-0001', 'x', '-', 5, 1, '084657864464', NULL, NULL, '2024-12-14', '2024-12-14', '2024-12-14', 'tunai', 'non_hutang', 80000, 0, 80000, 0, NULL, NULL, NULL, 'lunas', '2024-12-14 06:59:44', '2024-12-14 06:59:44'),
(48, '20241412-1-0002', '-', '-', 5, 1, '-', NULL, NULL, '2024-12-14', '2024-12-14', '2024-12-14', 'tunai', 'non_hutang', 250000, 0, 250000, 0, NULL, NULL, NULL, 'lunas', '2024-12-14 09:44:30', '2024-12-14 09:44:30'),
(49, '20241412-1-0003', 'X', 'X', 5, 1, '000000000000', NULL, NULL, '2024-12-14', '2024-12-14', '2024-12-14', 'transfer', 'non_hutang', 150000, 0, 150000, 0, NULL, NULL, NULL, 'lunas', '2024-12-14 11:05:27', '2024-12-14 11:05:27'),
(50, '20241412-1-0004', 'X', 'X', 5, 1, '00000000', NULL, NULL, '2024-12-14', '2024-12-14', '2024-12-14', 'tunai', 'hutang', 80000, 0, NULL, NULL, 40000, 40000, 40000, 'lunas', '2024-12-14 11:40:21', '2024-12-14 11:41:17'),
(51, '20241412-1-0005', 'X', 'X', 5, 1, '00000000000', NULL, NULL, '2024-12-14', '2024-12-14', '2024-12-18', 'tunai', 'hutang', 80000, 0, NULL, NULL, 30000, 50000, 0, 'belum_lunas', '2024-12-14 11:45:03', '2024-12-14 11:45:03'),
(52, '20242612-1-0001', 'Tes', 'tes', 5, 1, '085697455157', NULL, NULL, '2024-12-26', '2024-12-26', '2024-12-26', 'tunai', 'non_hutang', 1150000, 0, 1150000, 0, NULL, NULL, NULL, 'lunas', '2024-12-26 14:36:14', '2024-12-26 14:36:14'),
(53, '20242612-1-0002', 'tes', 'tes', 5, 1, '085697455157', NULL, NULL, '2024-12-26', '2024-12-26', '2024-12-26', 'tunai', 'non_hutang', 1150000, 0, 1150000, 0, NULL, NULL, NULL, 'lunas', '2024-12-26 14:38:37', '2024-12-26 14:38:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_penjualan_cart`
--

CREATE TABLE `op_penjualan_cart` (
  `id` int(11) NOT NULL,
  `id_barang` varchar(255) NOT NULL,
  `id_cabang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `kode_produk` varchar(255) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `sub_total` decimal(10,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_penjualan_detail`
--

CREATE TABLE `op_penjualan_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomor_transaksi` varchar(255) NOT NULL,
  `id_barang` bigint(20) UNSIGNED NOT NULL,
  `id_cabang` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `kode_produk` char(50) NOT NULL,
  `harga_barang` decimal(15,0) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `sub_total_transaksi` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_penjualan_detail`
--

INSERT INTO `op_penjualan_detail` (`id`, `nomor_transaksi`, `id_barang`, `id_cabang`, `id_user`, `kode_produk`, `harga_barang`, `jumlah_barang`, `sub_total_transaksi`, `created_at`, `updated_at`) VALUES
(45, '20241412-1-0001', 38, 1, 5, 'BRG20240010', 80000, 1, 80000.00, '2024-12-14 06:59:44', '2024-12-14 06:59:44'),
(46, '20241412-1-0002', 36, 1, 5, 'BRG20240008', 0, 1, 0.00, '2024-12-14 09:44:30', '2024-12-14 09:44:30'),
(47, '20241412-1-0002', 36, 1, 5, 'BRG20240008', 250000, 1, 250000.00, '2024-12-14 09:44:30', '2024-12-14 09:44:30'),
(48, '20241412-1-0003', 36, 1, 5, 'BRG20240008', 150000, 1, 150000.00, '2024-12-14 11:05:27', '2024-12-14 11:05:27'),
(49, '20241412-1-0004', 38, 1, 5, 'BRG20240010', 80000, 1, 80000.00, '2024-12-14 11:40:21', '2024-12-14 11:40:21'),
(50, '20241412-1-0005', 38, 1, 5, 'BRG20240010', 80000, 1, 80000.00, '2024-12-14 11:45:03', '2024-12-14 11:45:03'),
(51, '20242612-1-0001', 35, 1, 5, 'BRG20240007', 1150000, 1, 1150000.00, '2024-12-26 14:36:14', '2024-12-26 14:36:14'),
(52, '20242612-1-0002', 35, 1, 5, 'BRG20240007', 1150000, 1, 1150000.00, '2024-12-26 14:38:37', '2024-12-26 14:38:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_seting_lensa`
--

CREATE TABLE `op_seting_lensa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sph_dari` varchar(10) NOT NULL,
  `sph_sampai` varchar(10) NOT NULL,
  `cyl_dari` varchar(10) NOT NULL,
  `cyl_sampai` varchar(10) NOT NULL,
  `axs_dari` varchar(10) NOT NULL,
  `axs_sampai` varchar(10) NOT NULL,
  `add_dari` varchar(10) NOT NULL,
  `add_sampai` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_seting_lensa`
--

INSERT INTO `op_seting_lensa` (`id`, `sph_dari`, `sph_sampai`, `cyl_dari`, `cyl_sampai`, `axs_dari`, `axs_sampai`, `add_dari`, `add_sampai`, `created_at`, `updated_at`) VALUES
(1, '-8.00', '8.00', '-8.00', '8.00', '0', '359', '0.25', '3.00', '2024-12-01 23:54:37', '2024-12-26 14:02:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_suplaier`
--

CREATE TABLE `op_suplaier` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_suplaier` varchar(100) NOT NULL,
  `nama_instansi_suplaier` varchar(100) NOT NULL,
  `kontak_suplaier` varchar(50) DEFAULT NULL,
  `alamat_suplaier` varchar(255) DEFAULT NULL,
  `keterangan_suplaier` text DEFAULT NULL,
  `status_suplaier` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_suplaier`
--

INSERT INTO `op_suplaier` (`id`, `nama_suplaier`, `nama_instansi_suplaier`, `kontak_suplaier`, `alamat_suplaier`, `keterangan_suplaier`, `status_suplaier`, `created_at`, `updated_at`) VALUES
(2, 'CV. Domba MAS', 'CV. Domba MAS', '121212121212', 'Pekanbaru', 'testes', '1', '2024-12-11 05:38:24', '2024-12-11 05:38:24'),
(3, 'tes', 'tes', '1', 'tes', 'tes', '1', '2024-12-26 13:43:47', '2024-12-26 13:43:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_toko`
--

CREATE TABLE `op_toko` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_toko` varchar(100) NOT NULL,
  `nama_pemilik` varchar(100) NOT NULL,
  `phone_toko` varchar(15) DEFAULT NULL,
  `email_toko` varchar(100) NOT NULL,
  `alamat_toko` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_toko`
--

INSERT INTO `op_toko` (`id`, `nama_toko`, `nama_pemilik`, `phone_toko`, `email_toko`, `alamat_toko`, `created_at`, `updated_at`) VALUES
(1, 'GoldVisioning POS', 'Jhon Yahya', '08222123123123', 'jhonyahya1969@gmail.com', 'Pekanbaru', '2024-12-01 23:54:37', '2024-12-26 03:31:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_toko_cabang`
--

CREATE TABLE `op_toko_cabang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_toko_cabang` varchar(100) NOT NULL,
  `alamat_cabang` text NOT NULL,
  `phone_cabang` varchar(15) DEFAULT NULL,
  `email_cabang` varchar(100) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `id_toko` bigint(20) UNSIGNED NOT NULL,
  `status_cabang` enum('1','0') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_toko_cabang`
--

INSERT INTO `op_toko_cabang` (`id`, `nama_toko_cabang`, `alamat_cabang`, `phone_cabang`, `email_cabang`, `latitude`, `longitude`, `id_toko`, `status_cabang`, `created_at`, `updated_at`) VALUES
(1, 'Irene Optik', 'Jl. Hr. Subrantas No.40, Panam, Pekanbaru', '082108222208', 'mainbranch@example.com', '0.526246', '101.451573', 1, '1', '2024-12-01 23:54:37', '2024-12-10 17:14:20'),
(7, 'Optik Mandiri', 'Jl. Subrantas', '08125624156156', 'optikmandiripku@gmail.com', '0.984944', '101.337891', 1, '1', '2024-12-12 06:48:14', '2024-12-12 06:48:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `op_type`
--

CREATE TABLE `op_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `status_type` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `op_type`
--

INSERT INTO `op_type` (`id`, `type`, `status_type`, `created_at`, `updated_at`) VALUES
(2, 'CR', '1', '2024-12-10 06:20:32', '2024-12-10 06:20:32'),
(3, 'Blueray', '1', '2024-12-10 06:20:40', '2024-12-10 06:20:40'),
(4, 'Photochromic', '1', '2024-12-11 01:50:16', '2024-12-12 06:44:29'),
(5, 'Drive', '1', '2024-12-11 01:50:28', '2024-12-11 01:50:28'),
(6, 'Blue Chromic', '1', '2024-12-11 01:50:40', '2024-12-11 01:50:40'),
(13, 'Premium', '1', '2024-12-13 18:04:41', '2024-12-13 18:05:16'),
(14, 'Promo', '1', '2024-12-13 18:07:34', '2024-12-13 18:07:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('shodiqsolution@gmail.com', '$2y$12$LRYxnZKU9QtnrfOvypZdbOTilRnbpkR5zxS7qKUnlSVfawf5E47oS', '2024-12-08 23:08:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2BtMGzPn8VkFZsMaHwZndYHYWuKPoAljhOdeB3Me', NULL, '209.38.121.128', 'Mozilla/5.0 (compatible)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSW1uWlFSQnl2TzhSanc5Y0dvWWRoSmpaTkw3Z0swYmVQSDlHTFZPciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vd3d3LmRldi5vcHRpay5zaG9kaXFzb2x1dGlvbi5zaXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1735294451),
('34edSGvNO1IWo4jStl6OsblM80VDPJBgXMy92oLH', NULL, '207.241.225.134', 'Go-http-client/1.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialVvTzNKR1RNZURQYlZMNGJaOE5tM2JEaVRWRUJRQ3BZNE9IY2JDUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vd3d3LmRldi5wb3N0aWsuc2hvZGlxc29sdXRpb24uc2l0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1735397840),
('3Hwp2dWq4DPt2S3n09O57eczQgVMxRrBqnoMuohL', NULL, '209.38.121.128', 'Mozilla/5.0 (compatible)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDJhQTJ1bTV5bTljTzFZbHkzR293Nk5Ic2lZN2hNZ2xNMDBucnV2VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly93d3cuZGV2Lm9wdGlrLnNob2RpcXNvbHV0aW9uLnNpdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1735294449),
('4BRuGnEfSXtkXLdQLN7xYvWSbHcKjD3hHk4p71Ma', NULL, '167.94.146.62', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTERWZjJJRFRaWnlKd0Z5U3lvMDY0dmtpdVpjc1VBRVl1cVdNVllDQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vd3d3LmRldi5vcHRpay5zaG9kaXFzb2x1dGlvbi5zaXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1735301495),
('5gvUVoSnBxDmovFZowLJZBmAi67jctrOjvieGo4V', NULL, '194.126.177.39', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjB4Z2NaQkxNaFIzeXRBUGlBc1NveXJEb0JVaG9KR3VjT285NXpXZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vd3d3LmRldi5wb3N0aWsuc2hvZGlxc29sdXRpb24uc2l0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1735397929),
('8EtTXLy2TUOhUt1iSYqBihZS9jGzu4oxQbYleBPl', NULL, '179.43.152.66', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFZTQ082YXNzRjA5VGJnaUFQTFo0aEJ6OXdaS0lzZ2hMRHpUd2hQWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vd3d3LmRldi5vcHRpay5zaG9kaXFzb2x1dGlvbi5zaXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1735236072),
('CQGxYbWxNdFUMpuBRIMUVfjKBNq4NPM8kvc5XzW3', NULL, '202.67.45.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEpVWDVYTmNHaTJzTDI3OHF3VE1LWUFvajVQM0hqeUxGb0Y2YzNpdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9kZXYub3B0aWsuc2hvZGlxc29sdXRpb24uc2l0ZS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1735385062),
('D81XILr89gZhQttAJhHTITyVHsSA70GIZt4LYmit', NULL, '167.94.138.125', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2cxblpkMFlMMUx5NUFmYTdITXp1T1hEb3FDVVV4Q25jc2lNcGxGQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly93d3cuZGV2Lm9wdGlrLnNob2RpcXNvbHV0aW9uLnNpdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1735295609),
('d90PPSxzAJxdlGmalauD905K2z0iE8o8BXO8PA4X', NULL, '179.43.152.66', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnlsRUdRYnkyQmlaM1NGclBqTUJodEttTmxOaHFNQ2VuaUI4SFFGaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vd3d3LmRldi5vcHRpay5zaG9kaXFzb2x1dGlvbi5zaXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1735236074),
('Hoc24Jx5njXm3F99hTt6vVaSpb6QGvRV0LKfNFmw', NULL, '140.213.159.93', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNzJaUG1Ta0dMZVNHaHBWSUdFMFZLRU95Zm5uVjZpY0NUOGRuYVlndCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1735373770),
('j5aAU4Y9mwcdBgDBMRykvlJzb34LNSZ0EWeLYxg6', NULL, '147.45.185.25', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G9650 Build/R16NW; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/63.0.3239.83 Mobile Safari/537.36 T7/10.13 baiduboxapp/10.13.0.11 (Baidu; P1 8.0.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicU5uam8zc2xTM05EMkZ4bXdROGh5WkNweGhacUNIak1ZZ0o5Q2x5TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHBzOi8vZGV2LnBvc3Rpay5zaG9kaXFzb2x1dGlvbi5zaXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1735397936),
('MGV2yWOO30nUVE4lMQl4AMFsrIyMuyXlFc7vSuCy', NULL, '179.43.152.66', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUpUVDJVazNzR044U0JRTVdONHhNNFlBamFsUTQ3YVREYmltQ0l0dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHBzOi8vd3d3LmRldi5vcHRpay5zaG9kaXFzb2x1dGlvbi5zaXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1735236071),
('p1Sblqu5ACohkjcBgoSsp0Aa9hnP2hnCbQdCJ0h7', NULL, '146.70.239.18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUURueFpkNno4ZldFSWZIU2xjTmhXY0FoSHpwdE1RNElwVUt2cEhvcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vd3d3LmRldi5wb3N0aWsuc2hvZGlxc29sdXRpb24uc2l0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1735397890),
('T3TDli9wXVRRZGyF7FY2tLnIVGWkFvYksGPZfFxr', NULL, '147.45.185.25', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G9650 Build/R16NW; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/63.0.3239.83 Mobile Safari/537.36 T7/10.13 baiduboxapp/10.13.0.11 (Baidu; P1 8.0.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3VSOTc1VncxSGgzc0t3UmZnSGIyWDNKbm52Y2wwcFppRGpDTGlQUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9kZXYucG9zdGlrLnNob2RpcXNvbHV0aW9uLnNpdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1735397936),
('TlNBml8WZ9WFOXr0aWYk7olKGLIrVAKkDRTBSZer', NULL, '88.198.8.23', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEFKVW5UNzRxSHFaTnZzQWY5R2hkSTZ3VjAzZzJIdTdoUE1kcE81NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vd3d3LmRldi5wb3N0aWsuc2hvZGlxc29sdXRpb24uc2l0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1735397925),
('UPhT8bVv8BQwP6rnZ08ETYuGjAU4pRuOu8uiFGEg', 10, '202.67.45.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiZlh0VVhJanlYemdFNTdkQXJ3b0NEOTlSMUVsa0lTSUJEdDJhNXhhMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHBzOi8vZGV2Lm9wdGlrLnNob2RpcXNvbHV0aW9uLnNpdGUva2F0ZWdvcmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxMDtzOjc6InRva29faWQiO2k6MTtzOjk6InRva29fbmFtYSI7czoxNzoiR29sZFZpc2lvbmluZyBQT1MiO30=', 1735220814),
('vuu5NVqxRAHCsODCev1ICG90laJ348uVvnh2ncAQ', NULL, '207.241.225.134', 'Go-http-client/1.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFkzd1oydnY4YXBNY2xUdWR1WHNRZFU5b2VQbnhraGJtRTI2aUYzMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly93d3cuZGV2LnBvc3Rpay5zaG9kaXFzb2x1dGlvbi5zaXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1735397840),
('vzcRnWWi7uuzXJEB0vkGrnAA7yuMnyYwfpjOY5DB', 5, '202.67.45.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiVXVZWWs0QjRNek1ZN2h3RUNmQ3A1Y21yZU55a25hbGhzTzFBT293TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly9kZXYub3B0aWsuc2hvZGlxc29sdXRpb24uc2l0ZS9rYXNpci90cmFuc2Frc2ktbGFuZ3N1bmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo1O3M6OToiY2FiYW5nX2lkIjtpOjE7czoxMToiY2FiYW5nX25hbWEiO3M6MTE6IklyZW5lIE9wdGlrIjtzOjc6InRva29faWQiO2k6MTtzOjk6InRva29fbmFtYSI7czoxNzoiR29sZFZpc2lvbmluZyBQT1MiO30=', 1735385099),
('yubg7GQRAU2JOx15xvDmvfxmDkadHVkn5t2rCFSJ', NULL, '202.67.45.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoickFmemQwVDkzMjFpVFVDV09ZeGp6SEtpd09CMkxTOUFEa1BoZ25xSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vZGV2Lm9wdGlrLnNob2RpcXNvbHV0aW9uLnNpdGUvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1735224123),
('yWJpIGpKmewrYIAXmkpol60fWqIy8hwdcdo4xYum', NULL, '202.67.45.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVXdHcVRwNWQzdWVWT2NOVlRsdDJxYnl5Q2RXNk9yOFEzRmxjcndVYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1735385072),
('ziSsEabUSiURsn1Ix3cb5A0zZe9Ze7mNrVrneVZh', NULL, '202.67.45.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYzE5WGJIdnFjc21PSW9BRWd1OVZDWVNvU3BLWnlrVmNRUW5hQ1BqcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1735385068);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_toko` int(11) DEFAULT NULL,
  `id_cabang` int(11) DEFAULT NULL,
  `id_gudang` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `level_user` enum('owner','admin','kasir','gudang') NOT NULL,
  `status_user` enum('1','0') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `id_toko`, `id_cabang`, `id_gudang`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `level_user`, `status_user`, `created_at`, `updated_at`) VALUES
(2, 1, NULL, NULL, 'Jakfar', 'jakfarshodiq1496@gmail.com', '2024-12-02 08:09:57', '$2y$12$iAAs2SOzxlhGY6OgfhWQsO0.D5IQ.rjncBRCNVkeLktK31Q0loLb2', NULL, 'owner', '1', '2024-12-02 05:54:25', '2024-12-02 05:54:25'),
(3, 1, 1, 7, 'Gudang', 'gudang@gmail.com', '2024-12-02 13:53:01', '$2y$12$4rDl4E1GjdWTX9uls4vY9Ot94IoxCiOQU.VYU7zeXn5oFzkjOTDiq', NULL, 'gudang', '1', '2024-12-02 13:32:23', '2024-12-13 10:39:07'),
(5, 1, 1, NULL, 'Kasir', 'kasir@gmail.com', '2024-12-01 17:00:00', '$2y$12$rjZ/roXirYlOs7dHNwNjiOQ0Z7y3cPTFfAgOiLXSOjtw1LVbyNxUe', NULL, 'kasir', '1', '2024-12-02 13:52:02', '2024-12-11 05:32:14'),
(6, 1, 1, 1, 'admin', 'admin@gmail.com', '2024-12-02 13:53:43', '$2y$12$0KRQAX4ImxGIckXRET4jVeyA4b53/LPOc2kFUcV4zWHdFvsdcW8v2', NULL, 'admin', '1', '2024-12-02 13:52:18', '2024-12-09 14:21:18'),
(10, 1, NULL, NULL, 'irene optik', 'ireneoptikpku@gmail.com', '2024-12-09 11:45:58', '$2y$12$iAAs2SOzxlhGY6OgfhWQsO0.D5IQ.rjncBRCNVkeLktK31Q0loLb2', NULL, 'owner', '1', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `op_barang`
--
ALTER TABLE `op_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `op_barang_id_kategori_foreign` (`id_kategori`);

--
-- Indeks untuk tabel `op_barang_cabang_stock`
--
ALTER TABLE `op_barang_cabang_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `op_barang_cabang_stock_log`
--
ALTER TABLE `op_barang_cabang_stock_log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `op_barang_detail`
--
ALTER TABLE `op_barang_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `op_barang_gudang_stock`
--
ALTER TABLE `op_barang_gudang_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `op_barang_gudang_stock_id_barang_foreign` (`id_barang`),
  ADD KEY `op_barang_gudang_stock_id_suplaier_foreign` (`id_suplaier`);

--
-- Indeks untuk tabel `op_barang_gudang_stock_log`
--
ALTER TABLE `op_barang_gudang_stock_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `op_barang_gudang_stock_log_id_barang_foreign` (`id_barang`),
  ADD KEY `op_barang_gudang_stock_log_id_suplaier_foreign` (`id_suplaier`);

--
-- Indeks untuk tabel `op_barang_harga`
--
ALTER TABLE `op_barang_harga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `op_gudang`
--
ALTER TABLE `op_gudang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `op_jenis`
--
ALTER TABLE `op_jenis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `op_kas`
--
ALTER TABLE `op_kas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `op_kas_kode_transaksi_unique` (`kode_transaksi`);

--
-- Indeks untuk tabel `op_kategori`
--
ALTER TABLE `op_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `op_pemesanan`
--
ALTER TABLE `op_pemesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `op_pemesanan_cart`
--
ALTER TABLE `op_pemesanan_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `op_pemesanan_detail`
--
ALTER TABLE `op_pemesanan_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `op_pemesanan_log`
--
ALTER TABLE `op_pemesanan_log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `op_penjualan`
--
ALTER TABLE `op_penjualan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor_transaksi` (`nomor_transaksi`);

--
-- Indeks untuk tabel `op_penjualan_cart`
--
ALTER TABLE `op_penjualan_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `op_penjualan_detail`
--
ALTER TABLE `op_penjualan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nomor_transaksi` (`nomor_transaksi`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `op_seting_lensa`
--
ALTER TABLE `op_seting_lensa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `op_suplaier`
--
ALTER TABLE `op_suplaier`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `op_toko`
--
ALTER TABLE `op_toko`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `op_toko_email_toko_unique` (`email_toko`);

--
-- Indeks untuk tabel `op_toko_cabang`
--
ALTER TABLE `op_toko_cabang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `op_toko_cabang_id_toko_foreign` (`id_toko`);

--
-- Indeks untuk tabel `op_type`
--
ALTER TABLE `op_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `op_barang`
--
ALTER TABLE `op_barang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `op_barang_cabang_stock`
--
ALTER TABLE `op_barang_cabang_stock`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `op_barang_cabang_stock_log`
--
ALTER TABLE `op_barang_cabang_stock_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `op_barang_detail`
--
ALTER TABLE `op_barang_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `op_barang_gudang_stock`
--
ALTER TABLE `op_barang_gudang_stock`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `op_barang_gudang_stock_log`
--
ALTER TABLE `op_barang_gudang_stock_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT untuk tabel `op_barang_harga`
--
ALTER TABLE `op_barang_harga`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `op_gudang`
--
ALTER TABLE `op_gudang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `op_jenis`
--
ALTER TABLE `op_jenis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `op_kas`
--
ALTER TABLE `op_kas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `op_kategori`
--
ALTER TABLE `op_kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `op_pemesanan`
--
ALTER TABLE `op_pemesanan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `op_pemesanan_cart`
--
ALTER TABLE `op_pemesanan_cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `op_pemesanan_detail`
--
ALTER TABLE `op_pemesanan_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `op_pemesanan_log`
--
ALTER TABLE `op_pemesanan_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `op_penjualan`
--
ALTER TABLE `op_penjualan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT untuk tabel `op_penjualan_cart`
--
ALTER TABLE `op_penjualan_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT untuk tabel `op_penjualan_detail`
--
ALTER TABLE `op_penjualan_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `op_seting_lensa`
--
ALTER TABLE `op_seting_lensa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `op_suplaier`
--
ALTER TABLE `op_suplaier`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `op_toko`
--
ALTER TABLE `op_toko`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `op_toko_cabang`
--
ALTER TABLE `op_toko_cabang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `op_type`
--
ALTER TABLE `op_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `op_barang`
--
ALTER TABLE `op_barang`
  ADD CONSTRAINT `op_barang_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `op_kategori` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `op_barang_gudang_stock`
--
ALTER TABLE `op_barang_gudang_stock`
  ADD CONSTRAINT `op_barang_gudang_stock_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `op_barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `op_barang_gudang_stock_id_suplaier_foreign` FOREIGN KEY (`id_suplaier`) REFERENCES `op_suplaier` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `op_barang_gudang_stock_log`
--
ALTER TABLE `op_barang_gudang_stock_log`
  ADD CONSTRAINT `op_barang_gudang_stock_log_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `op_barang` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `op_barang_gudang_stock_log_id_suplaier_foreign` FOREIGN KEY (`id_suplaier`) REFERENCES `op_suplaier` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `op_barang_harga`
--
ALTER TABLE `op_barang_harga`
  ADD CONSTRAINT `op_barang_harga_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `op_barang` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `op_penjualan_detail`
--
ALTER TABLE `op_penjualan_detail`
  ADD CONSTRAINT `op_penjualan_detail_ibfk_1` FOREIGN KEY (`nomor_transaksi`) REFERENCES `op_penjualan` (`nomor_transaksi`) ON DELETE CASCADE,
  ADD CONSTRAINT `op_penjualan_detail_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `op_barang` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `op_toko_cabang`
--
ALTER TABLE `op_toko_cabang`
  ADD CONSTRAINT `op_toko_cabang_id_toko_foreign` FOREIGN KEY (`id_toko`) REFERENCES `op_toko` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
