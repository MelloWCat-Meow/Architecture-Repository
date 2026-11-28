# 08_Source

Folder ini berisi rujukan kode sumber **EduLink Tutor** beserta dokumentasi teknis aplikasi.

> **Penanggung jawab:** Programmer + Database (Muhamad Maulana Riski) &nbsp;|&nbsp; **Repositori aplikasi:** [github.com/MelloWCat-Meow/EduLink](https://github.com/MelloWCat-Meow/EduLink)

## Repositori aplikasi

| Keterangan | Isi |
|---|---|
| Alamat | https://github.com/MelloWCat-Meow/EduLink |
| Tech stack | Laravel 13 (PHP 8.4), Blade, Tailwind CSS 4, Vite, MySQL 8 / MariaDB (lihat [ADR-001](../06_Governance/ADR-001_Tech_Stack.md)) |
| Aturan cabang | `main` (versi stabil), `dev` (fitur yang siap diuji bersama), `feature/*` (satu cabang per fitur) |
| Penggabungan kode | Melalui pull request ke `dev` yang ditinjau minimal satu anggota lain |
| Cara menjalankan | Lihat [README repositori aplikasi](https://github.com/MelloWCat-Meow/EduLink#readme) |
| Versi saat ini | v0.9 Beta; tag `v1.0` dan changelog dibuat setelah perbaikan hasil UAT P15 |

## Dokumentasi teknis

| No | Dokumen | Isi singkat |
|:-:|---|---|
| 1 | [Arsitektur aplikasi](arsitektur.md) | Struktur data, alur status, komponen, dan perbedaannya dengan arsitektur target |
| 2 | [Daftar layar](daftar-layar.md) | Seluruh layar aplikasi per peran dan kaitannya dengan prototipe Figma |
| 3 | [Status proyek](status-proyek.md) | Pemetaan modul ke rancangan sistem, hasil pengujian, dan keterbatasan Beta |

Dokumen di atas adalah salinan dari folder `docs` repositori aplikasi. Versi terbaru selalu ada di repositori aplikasi. Kamus data ada di folder [`02_Data`](../02_Data/daftar-tabel.md).

## Akan ditambahkan

| Dokumen | Waktu |
|---|---|
| Dokumentasi route/endpoint | Sebelum P15 |
| Changelog dan tag `v1.0` | Setelah perbaikan hasil UAT P15 |
| Manual pengguna per peran (orang tua, tutor, admin) | Sebelum P16 |
