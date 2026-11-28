/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.13-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: edulink
-- ------------------------------------------------------
-- Server version	11.4.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `akun_pengguna`
--

DROP TABLE IF EXISTS `akun_pengguna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `akun_pengguna` (
  `id_akun` varchar(10) NOT NULL,
  `peran` varchar(20) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 1,
  `dinonaktifkan_pada` datetime DEFAULT NULL,
  `alasan_nonaktif` varchar(255) DEFAULT NULL,
  `kontak` varchar(50) NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `persetujuan_pada` timestamp NULL DEFAULT NULL,
  `versi_kebijakan` varchar(10) DEFAULT NULL,
  `kredensial` varchar(255) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_akun`),
  UNIQUE KEY `akun_pengguna_kontak_unique` (`kontak`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dokumen_verifikasi`
--

DROP TABLE IF EXISTS `dokumen_verifikasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dokumen_verifikasi` (
  `id_dokumen` varchar(10) NOT NULL,
  `id_tutor` varchar(10) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `berkas` varchar(255) NOT NULL,
  `status_verifikasi` varchar(20) NOT NULL DEFAULT 'menunggu',
  `alasan_penolakan` varchar(255) DEFAULT NULL,
  `diperiksa_pada` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_dokumen`),
  KEY `dokumen_verifikasi_id_tutor_foreign` (`id_tutor`),
  KEY `dokumen_verifikasi_status_verifikasi_index` (`status_verifikasi`),
  CONSTRAINT `dokumen_verifikasi_id_tutor_foreign` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jadwal_ketersediaan`
--

DROP TABLE IF EXISTS `jadwal_ketersediaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jadwal_ketersediaan` (
  `id_jadwal` varchar(10) NOT NULL,
  `id_tutor` varchar(10) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `jam` time NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'tersedia',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_jadwal`),
  UNIQUE KEY `jadwal_ketersediaan_id_tutor_hari_jam_unique` (`id_tutor`,`hari`,`jam`),
  CONSTRAINT `jadwal_ketersediaan_id_tutor_foreign` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
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
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keluhan`
--

DROP TABLE IF EXISTS `keluhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `keluhan` (
  `id_keluhan` varchar(10) NOT NULL,
  `id_pesanan` varchar(15) NOT NULL,
  `id_sesi` varchar(10) DEFAULT NULL,
  `jenis` varchar(30) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'baru',
  `id_akun` varchar(10) NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggapan_admin` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_keluhan`),
  KEY `keluhan_id_pesanan_foreign` (`id_pesanan`),
  KEY `keluhan_id_akun_foreign` (`id_akun`),
  KEY `keluhan_status_index` (`status`),
  KEY `keluhan_id_sesi_foreign` (`id_sesi`),
  CONSTRAINT `keluhan_id_akun_foreign` FOREIGN KEY (`id_akun`) REFERENCES `akun_pengguna` (`id_akun`) ON UPDATE CASCADE,
  CONSTRAINT `keluhan_id_pesanan_foreign` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON UPDATE CASCADE,
  CONSTRAINT `keluhan_id_sesi_foreign` FOREIGN KEY (`id_sesi`) REFERENCES `sesi_pembelajaran` (`id_sesi`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `komisi_biaya_layanan`
--

DROP TABLE IF EXISTS `komisi_biaya_layanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `komisi_biaya_layanan` (
  `id_komisi` varchar(10) NOT NULL,
  `id_pesanan` varchar(15) NOT NULL,
  `persentase` decimal(5,2) NOT NULL,
  `nominal` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_komisi`),
  UNIQUE KEY `komisi_biaya_layanan_id_pesanan_unique` (`id_pesanan`),
  CONSTRAINT `komisi_biaya_layanan_id_pesanan_foreign` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mata_pelajaran`
--

DROP TABLE IF EXISTS `mata_pelajaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mata_pelajaran` (
  `kode_mapel` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenjang` varchar(3) NOT NULL,
  PRIMARY KEY (`kode_mapel`),
  UNIQUE KEY `mata_pelajaran_nama_jenjang_unique` (`nama`,`jenjang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` varchar(10) NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `kontak` varchar(50) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kontak`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pembayaran`
--

DROP TABLE IF EXISTS `pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pembayaran` (
  `id_pembayaran` varchar(10) NOT NULL,
  `id_pesanan` varchar(15) NOT NULL,
  `metode` varchar(20) NOT NULL,
  `jumlah` decimal(12,2) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `diproses_pada` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran`),
  KEY `pembayaran_id_pesanan_foreign` (`id_pesanan`),
  KEY `pembayaran_status_index` (`status`),
  KEY `pembayaran_diproses_pada_index` (`diproses_pada`),
  CONSTRAINT `pembayaran_id_pesanan_foreign` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pencairan_dana_tutor`
--

DROP TABLE IF EXISTS `pencairan_dana_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pencairan_dana_tutor` (
  `id_pencairan` varchar(10) NOT NULL,
  `id_tutor` varchar(10) NOT NULL,
  `periode` char(7) NOT NULL COMMENT 'YYYY-MM',
  `nominal` decimal(12,2) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'menunggu',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_pencairan`),
  KEY `pencairan_dana_tutor_id_tutor_foreign` (`id_tutor`),
  KEY `pencairan_dana_tutor_status_index` (`status`),
  CONSTRAINT `pencairan_dana_tutor_id_tutor_foreign` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pengaturan`
--

DROP TABLE IF EXISTS `pengaturan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengaturan` (
  `kunci` varchar(50) NOT NULL,
  `nilai` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kunci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pengembalian_dana`
--

DROP TABLE IF EXISTS `pengembalian_dana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengembalian_dana` (
  `id_pengembalian` varchar(10) NOT NULL,
  `id_pesanan` varchar(15) NOT NULL,
  `nominal` decimal(12,2) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'perlu_diproses',
  `catatan` varchar(255) DEFAULT NULL,
  `diproses_oleh` varchar(10) DEFAULT NULL,
  `diproses_pada` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_pengembalian`),
  KEY `pengembalian_dana_diproses_oleh_foreign` (`diproses_oleh`),
  KEY `pengembalian_dana_status_index` (`status`),
  KEY `pengembalian_dana_id_pesanan_foreign` (`id_pesanan`),
  CONSTRAINT `pengembalian_dana_diproses_oleh_foreign` FOREIGN KEY (`diproses_oleh`) REFERENCES `akun_pengguna` (`id_akun`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pengembalian_dana_id_pesanan_foreign` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permintaan_jadwal_ulang`
--

DROP TABLE IF EXISTS `permintaan_jadwal_ulang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permintaan_jadwal_ulang` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_sesi` varchar(10) NOT NULL,
  `id_akun` varchar(10) NOT NULL,
  `waktu_lama` datetime NOT NULL,
  `waktu_baru` datetime NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'menunggu',
  `dijawab_pada` datetime DEFAULT NULL,
  `alasan_penolakan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permintaan_jadwal_ulang_id_sesi_foreign` (`id_sesi`),
  KEY `permintaan_jadwal_ulang_id_akun_foreign` (`id_akun`),
  KEY `permintaan_jadwal_ulang_status_index` (`status`),
  CONSTRAINT `permintaan_jadwal_ulang_id_akun_foreign` FOREIGN KEY (`id_akun`) REFERENCES `akun_pengguna` (`id_akun`) ON UPDATE CASCADE,
  CONSTRAINT `permintaan_jadwal_ulang_id_sesi_foreign` FOREIGN KEY (`id_sesi`) REFERENCES `sesi_pembelajaran` (`id_sesi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pesanan`
--

DROP TABLE IF EXISTS `pesanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pesanan` (
  `id_pesanan` varchar(15) NOT NULL,
  `id_siswa` varchar(10) NOT NULL,
  `id_tutor` varchar(10) NOT NULL,
  `kode_mapel` varchar(10) NOT NULL,
  `id_jadwal` varchar(10) NOT NULL,
  `durasi` smallint(5) unsigned NOT NULL COMMENT 'menit',
  `mode` varchar(20) NOT NULL,
  `status` varchar(30) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `jumlah_pertemuan` tinyint(3) unsigned NOT NULL,
  `tarif_per_jam` decimal(12,2) NOT NULL,
  `total_biaya` decimal(12,2) NOT NULL,
  `ditahan_hingga` datetime DEFAULT NULL,
  `tautan_meeting` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_pesanan`),
  KEY `pesanan_id_siswa_foreign` (`id_siswa`),
  KEY `pesanan_id_tutor_foreign` (`id_tutor`),
  KEY `pesanan_kode_mapel_foreign` (`kode_mapel`),
  KEY `pesanan_id_jadwal_foreign` (`id_jadwal`),
  KEY `pesanan_status_index` (`status`),
  KEY `pesanan_ditahan_hingga_index` (`ditahan_hingga`),
  CONSTRAINT `pesanan_id_jadwal_foreign` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_ketersediaan` (`id_jadwal`) ON UPDATE CASCADE,
  CONSTRAINT `pesanan_id_siswa_foreign` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`) ON UPDATE CASCADE,
  CONSTRAINT `pesanan_id_tutor_foreign` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`) ON UPDATE CASCADE,
  CONSTRAINT `pesanan_kode_mapel_foreign` FOREIGN KEY (`kode_mapel`) REFERENCES `mata_pelajaran` (`kode_mapel`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profil_tutor`
--

DROP TABLE IF EXISTS `profil_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `profil_tutor` (
  `id_profil` varchar(10) NOT NULL,
  `id_tutor` varchar(10) NOT NULL,
  `riwayat_pendidikan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`riwayat_pendidikan`)),
  `kompetensi` text NOT NULL,
  `pengalaman` text NOT NULL,
  `tarif` decimal(12,2) DEFAULT NULL,
  `lokasi` varchar(50) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `melayani_online` tinyint(1) NOT NULL DEFAULT 1,
  `melayani_kunjungan` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_profil`),
  UNIQUE KEY `profil_tutor_id_tutor_unique` (`id_tutor`),
  KEY `profil_tutor_lokasi_index` (`lokasi`),
  CONSTRAINT `profil_tutor_id_tutor_foreign` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rating_ulasan`
--

DROP TABLE IF EXISTS `rating_ulasan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_ulasan` (
  `id_ulasan` varchar(10) NOT NULL,
  `id_pesanan` varchar(15) NOT NULL,
  `nilai` tinyint(3) unsigned NOT NULL,
  `komentar` text DEFAULT NULL,
  `ditampilkan` tinyint(1) NOT NULL DEFAULT 1,
  `alasan_moderasi` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_ulasan`),
  UNIQUE KEY `rating_ulasan_id_pesanan_unique` (`id_pesanan`),
  CONSTRAINT `rating_ulasan_id_pesanan_foreign` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `riwayat_status_akun`
--

DROP TABLE IF EXISTS `riwayat_status_akun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwayat_status_akun` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_akun` varchar(10) NOT NULL,
  `aktif` tinyint(1) NOT NULL,
  `alasan` varchar(255) NOT NULL,
  `oleh` varchar(10) DEFAULT NULL,
  `dicatat_pada` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `riwayat_status_akun_id_akun_foreign` (`id_akun`),
  KEY `riwayat_status_akun_oleh_foreign` (`oleh`),
  CONSTRAINT `riwayat_status_akun_id_akun_foreign` FOREIGN KEY (`id_akun`) REFERENCES `akun_pengguna` (`id_akun`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `riwayat_status_akun_oleh_foreign` FOREIGN KEY (`oleh`) REFERENCES `akun_pengguna` (`id_akun`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `riwayat_status_pesanan`
--

DROP TABLE IF EXISTS `riwayat_status_pesanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwayat_status_pesanan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_pesanan` varchar(15) NOT NULL,
  `status` varchar(30) NOT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `id_akun` varchar(10) DEFAULT NULL,
  `dicatat_pada` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `riwayat_status_pesanan_id_pesanan_foreign` (`id_pesanan`),
  KEY `riwayat_status_pesanan_id_akun_foreign` (`id_akun`),
  CONSTRAINT `riwayat_status_pesanan_id_akun_foreign` FOREIGN KEY (`id_akun`) REFERENCES `akun_pengguna` (`id_akun`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `riwayat_status_pesanan_id_pesanan_foreign` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `riwayat_verifikasi_tutor`
--

DROP TABLE IF EXISTS `riwayat_verifikasi_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `riwayat_verifikasi_tutor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_tutor` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `catatan` text DEFAULT NULL,
  `bagian` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`bagian`)),
  `id_akun` varchar(10) DEFAULT NULL,
  `dicatat_pada` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `riwayat_verifikasi_tutor_id_tutor_foreign` (`id_tutor`),
  KEY `riwayat_verifikasi_tutor_id_akun_foreign` (`id_akun`),
  CONSTRAINT `riwayat_verifikasi_tutor_id_akun_foreign` FOREIGN KEY (`id_akun`) REFERENCES `akun_pengguna` (`id_akun`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `riwayat_verifikasi_tutor_id_tutor_foreign` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sesi_pembelajaran`
--

DROP TABLE IF EXISTS `sesi_pembelajaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesi_pembelajaran` (
  `id_sesi` varchar(10) NOT NULL,
  `id_pesanan` varchar(15) NOT NULL,
  `waktu` datetime NOT NULL,
  `kehadiran` varchar(20) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `status_konfirmasi` varchar(30) DEFAULT NULL,
  `dicatat_pada` datetime DEFAULT NULL,
  `dikonfirmasi_pada` datetime DEFAULT NULL,
  `dikonfirmasi_oleh` varchar(10) DEFAULT NULL,
  `alasan_sanggahan` varchar(255) DEFAULT NULL,
  `keputusan_admin` text DEFAULT NULL,
  `id_pengembalian` varchar(10) DEFAULT NULL,
  `tautan_meeting` varchar(255) DEFAULT NULL,
  `pengingat_dikirim_pada` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_sesi`),
  KEY `sesi_pembelajaran_id_pesanan_foreign` (`id_pesanan`),
  KEY `sesi_pembelajaran_waktu_index` (`waktu`),
  KEY `sesi_pembelajaran_id_pengembalian_foreign` (`id_pengembalian`),
  KEY `sesi_pembelajaran_status_konfirmasi_index` (`status_konfirmasi`),
  CONSTRAINT `sesi_pembelajaran_id_pengembalian_foreign` FOREIGN KEY (`id_pengembalian`) REFERENCES `pengembalian_dana` (`id_pengembalian`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sesi_pembelajaran_id_pesanan_foreign` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(10) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `siswa`
--

DROP TABLE IF EXISTS `siswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `siswa` (
  `id_siswa` varchar(10) NOT NULL,
  `id_akun` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenjang` varchar(20) NOT NULL,
  `kontak_wali` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_siswa`),
  KEY `siswa_id_akun_foreign` (`id_akun`),
  CONSTRAINT `siswa_id_akun_foreign` FOREIGN KEY (`id_akun`) REFERENCES `akun_pengguna` (`id_akun`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutor` (
  `id_tutor` varchar(10) NOT NULL,
  `id_akun` varchar(10) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `status_verifikasi` varchar(20) NOT NULL DEFAULT 'draf',
  `catatan_verifikasi` text DEFAULT NULL,
  `bagian_perbaikan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`bagian_perbaikan`)),
  `diajukan_pada` datetime DEFAULT NULL,
  `rekening_bank` varchar(50) DEFAULT NULL,
  `rekening_nomor` text DEFAULT NULL,
  `rekening_atas_nama` varchar(100) DEFAULT NULL,
  `kontak` varchar(50) NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_tutor`),
  UNIQUE KEY `tutor_id_akun_unique` (`id_akun`),
  KEY `tutor_status_verifikasi_index` (`status_verifikasi`),
  CONSTRAINT `tutor_id_akun_foreign` FOREIGN KEY (`id_akun`) REFERENCES `akun_pengguna` (`id_akun`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tutor_mata_pelajaran`
--

DROP TABLE IF EXISTS `tutor_mata_pelajaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutor_mata_pelajaran` (
  `id_tutor` varchar(10) NOT NULL,
  `kode_mapel` varchar(10) NOT NULL,
  PRIMARY KEY (`id_tutor`,`kode_mapel`),
  KEY `tutor_mata_pelajaran_kode_mapel_foreign` (`kode_mapel`),
  CONSTRAINT `tutor_mata_pelajaran_id_tutor_foreign` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id_tutor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tutor_mata_pelajaran_kode_mapel_foreign` FOREIGN KEY (`kode_mapel`) REFERENCES `mata_pelajaran` (`kode_mapel`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-11-23 15:10:26
