# 02_Data

Folder ini berisi arsitektur data **EduLink Tutor** (fase **Data Architecture, Phase C TOGAF**): ERD, kamus data, normalisasi, skrip SQL, dan daftar migrasi basis data.

> **Penanggung jawab:** Programmer + Database (Muhamad Maulana Riski) &nbsp;|&nbsp; **Basis data:** MySQL 8 / MariaDB (diuji di MariaDB 11.4) &nbsp;|&nbsp; **Keputusan terkait:** [ADR-002 Aturan Data di Basis Data](../06_Governance/ADR-002_Aturan_Data_di_Basis_Data.md)

| No | Dokumen | Isi singkat |
|:-:|---|---|
| 1 | [ERD](ERD.png) | Entity Relationship Diagram EduLink Tutor |
| 2 | [Kamus data](daftar-tabel.md) | Seluruh tabel hasil implementasi beserta kolom, tipe data, kunci, check constraint, dan view laporan |
| 3 | [Skrip SQL (DDL)](schema.sql) | Struktur basis data hasil `mysqldump --no-data`, tanpa isi data |
| 4 | Normalisasi | Bagian [Normalisasi sampai 3NF](#normalisasi-sampai-3nf) di bawah |
| 5 | Migrasi | Bagian [Daftar migrasi](#daftar-migrasi) di bawah |

## Ringkasan basis data

| Ukuran | Jumlah |
|---|---|
| Tabel | 30 (15 dari ERD laporan, 9 tambahan aplikasi, 6 bawaan Laravel) |
| View laporan | 3 (`v_laporan_transaksi_harian`, `v_rating_tutor`, `v_tingkat_keberhasilan_pembayaran`) |
| Check constraint | 8 |
| Migration | 27 |

Kamus data pada notulensi P13 memuat 12 tabel rancangan MVP. Selama implementasi, tabel berkembang untuk kebutuhan seperti riwayat status pesanan, sesi pembelajaran, jadwal ulang, pengembalian dana, dan pencairan dana. Setiap kolom pada [kamus data](daftar-tabel.md) diberi tanda **ERD** (berasal dari ERD laporan) atau **tambahan** (ditambahkan untuk kebutuhan aplikasi) beserta alasannya.

## Normalisasi sampai 3NF

Contoh normalisasi memakai data pesanan, yang awalnya digabung dalam satu tabel.

| Tahap | Masalah yang ditemukan | Perbaikan | Hasil |
|---|---|---|---|
| Awal (belum normal) | Satu tabel memuat id_pesanan, nama siswa, nama tutor, kontak tutor, daftar mata pelajaran dalam satu sel, nama mata pelajaran, tarif, dan status | - | Data berulang dan satu sel berisi banyak nilai |
| 1NF | Satu sel berisi lebih dari satu mata pelajaran | Setiap sel hanya berisi satu nilai; mata pelajaran dipisah menjadi baris tersendiri | Semua sel bernilai tunggal |
| 2NF | Nama dan kontak tutor hanya bergantung pada id_tutor, bukan pada seluruh kunci pesanan | Data tutor dipindah ke tabel `tutor`; hubungan banyak ke banyak diselesaikan dengan `tutor_mata_pelajaran` | Tabel `tutor`, `siswa`, `mata_pelajaran`, dan `tutor_mata_pelajaran` terbentuk |
| 3NF | Nama mata pelajaran bergantung pada kode_mapel, dan tarif bergantung pada tutor, bukan pada id_pesanan | Nama mata pelajaran dipindah ke `mata_pelajaran` dan tarif ke `profil_tutor` | `pesanan` hanya menyimpan kunci penghubung dan data khas pesanan |

Catatan: `pesanan.tarif_per_jam` dan `pesanan.total_biaya` sengaja disimpan sebagai salinan nilai saat pesanan dibuat (snapshot), agar perubahan tarif tutor di kemudian hari tidak mengubah tagihan pesanan lama. Ini bukan pelanggaran 3NF, karena nilainya bergantung pada pesanan pada saat transaksi terjadi.

## Daftar migrasi

Migrasi dijalankan dengan `php artisan migrate`. Kode lengkapnya ada di folder [`database/migrations`](https://github.com/MelloWCat-Meow/EduLink/tree/main/database/migrations) repositori aplikasi, dan data tiruan di [`database/seeders`](https://github.com/MelloWCat-Meow/EduLink/tree/main/database/seeders).

| No | Migration | Isi |
|:-:|---|---|
| 1–3 | `0001_01_01_000000` sampai `000002` | Tabel bawaan Laravel: users, cache, jobs |
| 4 | `2026_11_20_122056_create_akun_pengguna_table` | Akun pengguna dan peran |
| 5 | `2026_11_20_122057_create_siswa_table` | Siswa (anak) milik akun orang tua |
| 6 | `2026_11_20_122058_move_sessions_to_akun_pengguna_and_drop_users_table` | Session diarahkan ke akun_pengguna |
| 7 | `2026_11_20_130001_create_tutor_table` | Tutor internal dan eksternal |
| 8 | `2026_11_20_130002_create_mata_pelajaran_table` | Mata pelajaran dan tabel penghubung tutor_mata_pelajaran |
| 9 | `2026_11_20_130003_create_profil_tutor_table` | Profil tutor (relasi 1:1) |
| 10 | `2026_11_20_130004_create_dokumen_verifikasi_table` | Dokumen verifikasi tutor |
| 11 | `2026_11_20_130005_create_jadwal_ketersediaan_table` | Slot jadwal mingguan |
| 12 | `2026_11_20_130006_create_pesanan_table` | Pesanan dan riwayat status pesanan |
| 13 | `2026_11_20_130007_create_sesi_pembelajaran_table` | Sesi pembelajaran per pesanan |
| 14 | `2026_11_20_130008_create_pembayaran_and_komisi_tables` | Pembayaran, komisi, dan pengaturan |
| 15 | `2026_11_20_130009_create_rating_ulasan_and_keluhan_tables` | Rating, ulasan, dan keluhan |
| 16 | `2026_11_20_130010_create_pencairan_dana_tutor_table` | Pencairan dana tutor |
| 17 | `2026_11_20_140001_add_pendaftaran_to_tutor_tables` | Alur pendaftaran tutor dan riwayat verifikasi |
| 18 | `2026_11_20_160001_add_kontak_rekening_dan_notifikasi` | Kontak, rekening terenkripsi, dan notifikasi |
| 19 | `2026_11_21_090001_create_password_reset_tokens_table` | Token reset kata sandi |
| 20 | `2026_11_21_090002_add_persetujuan_to_akun_pengguna` | Bukti persetujuan kebijakan privasi |
| 21 | `2026_11_21_090003_create_permintaan_jadwal_ulang_table` | Jadwal ulang sesi |
| 22 | `2026_11_21_090004_create_pengembalian_dana_table` | Pengembalian dana |
| 23 | `2026_11_21_090005_add_status_aktif_to_akun_pengguna` | Nonaktif akun dan riwayat status akun |
| 24 | `2026_11_22_090001_add_tautan_meeting_to_pesanan` | Tautan meeting sesi online |
| 25 | `2026_11_22_090002_add_konfirmasi_sesi` | Konfirmasi sesi oleh orang tua |
| 26 | `2026_11_28_222542_add_check_constraints` | 8 check constraint (MySQL/MariaDB) |
| 27 | `2026_11_28_222543_create_report_views` | 3 view laporan |

## Cara membangun ulang basis data

```bash
php artisan migrate:fresh --seed --drop-views
```

Opsi `--drop-views` diperlukan karena `migrate:fresh` tidak menghapus view secara bawaan.
