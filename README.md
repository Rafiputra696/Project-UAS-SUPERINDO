# Project UAS  Sistem Basis Data SUPERINDO

## SISTEM DATA PENJUALAN DAN INVENTORI BARANG PADA SUPERINDO
Mata kuliah : Sistem Basis Data
Dosen Pengampu : Ridwan Dwi Irawan S.kom, M.Kom.

## Anggota Kelompok
1.Muhammad Ramadhan Fajri      (NIM:250119018)
2.Rafi Athallah Handokoputra	  (NIM:250119020)

## Deskripsi Proyek
Project ini merupakan Project UAS mata kuliah Pemrograman Basis Data.
Proyek ini berfokus pada pembuatan dan pengelolaan database menggunakan
query SQL pada MySQL.

Seluruh proses perancangan database dilakukan dengan menuliskan
perintah SQL secara langsung dan dijalankan menggunakan MySQL yang
tersedia pada XAMPP. Proyek ini tidak menggunakan aplikasi atau
antarmuka web, melainkan berfokus pada logika dan struktur basis data.

## Latar Belakang Masalah
Pada kegiatan operasional Superindo, pengelolaan data barang, stok, supplier, dan transaksi penjualan harus dilakukan secara akurat. Pencatatan data yang masih dilakukan secara manual atau terpisah berpotensi menimbulkan kesalahan stok, ketidaksesuaian data transaksi, serta kesulitan dalam rekap penjualan. Oleh karena itu, diperlukan sistem basis data yang terstruktur dan terintegrasi untuk mendukung pengelolaan data secara efektif.

## Tujuan
Tujuan dari pembuatan sistem basis data superindo ini adalah untuk mengelola data barang dan stok secara terpusat, mengelola data kasir dan supplier, mencatata data transaksi penjualan secara detail dan terstruktur, menjaga konsistensi data melalui penerapan sistem transaksi database

## Tools yang Digunakan
1. MySQL
2. XAMPP
3. phpMyAdmin
4. GitHub

## Struktur Database
Database ini terdiri dari beberapa tabel utama
1. Supplier
2. Kasir
3. Barang
4. Transaksi
5. Detail Transaksi

## Struktur Repository
1. SQL
  Berisi file script SQL (`database.sql`) yang digunakan untuk
  pembuatan tabel, relasi, dan pengolahan data.
2. dokumen  
  Berisi laporan dan poster Project UAS.
## Cara Menjalankan Database
1. Jalankan aplikasi XAMPP
2. Aktifkan service MySQL
3. Buka browser dan akses:
http://localhost/phpmyadmin
4. Buat database baru sesuai kebutuhan proyek
5. Import file `SQL/database.sql`
6. Database siap digunakan dan query dapat dijalankan

## Query yang digunakan di database
1. DDL (Data Definition Language)
Digunakan untuk membuat dan mengatur struktur databse, tabel, primary key, foreign key, serta constraint.
2. DML (Data Manipulation Language)
Digunakan untuk melakukan insert, update, dan delete data pada tabel.
3. JOIN (INNER JOIN, LEFT JOIN, RIGHT JOIN)
Digunakan untuk menampilkan data transaksi secara lengkap dengan menggabungkan beberapa tabel yang saling berelasi
4. LIKE
Digunakan untuk menampilkan data berdasarkan pola tertentu, seperti mencari nama customer atau produk dengan kata tertentu.
5. DISTINCT
Digunakan untuk menampilkan data yang unik tanpa duplikasi, misalnya menampilkan daftar produk tanpa data yang sama.
6. BETWEEN
Digunakan untuk menampilkan data dalam rentang nilai tertentu, seperti transaksi pada rentang tanggal tertentu.
7. GRUB BY DAN HAVING.
Digunakan untuk melakukan pengelompokan dan penyaringan data berdasarkan hasil agregasi
8. RANGE (Operator Perbandingan)
Digunakan untuk menampilkan data dalam rentang nilai tertentu, misalnya produk dengan harga minimum dan maksimum tertentu.

## Catatan
Project ini dibuat sebagai bukti pemahaman mahasiswa terhadap konsep
Pemrograman Basis Data melalui penggunaan query SQL pada MySQL.
Repository GitHub digunakan sebagai media dokumentasi dan penyimpanan
artefak proyek.
