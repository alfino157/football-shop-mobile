# Tugas 7

## Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree dalam Flutter adalah susunan hierarki dari semua widget yang membentuk tampilan aplikasi. Setiap elemen di layar, seperti teks, tombol, gambar, atau tata letak, merupakan bagian dari widget tree. Hubungan antar widget ini bersifat seperti pohon keluarga, di mana ada parent dan child . Parent widget berperan untuk membungkus dan mengatur posisi, ukuran, serta perilaku anaknya, sedangkan child widget menjadi isi atau konten yang ditampilkan di dalam parent tersebut.

## Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

1. **MaterialApp**: Widget utama yang menjadi root aplikasi. Ia mengatur tema, judul, dan halaman awal (home).
2. **ThemeData**: Mengatur tampilan visual aplikasi (warna utama, gaya tombol, font, dll).
3. **ColorScheme**.fromSeed: Membuat palet warna otomatis berdasarkan warna dasar (seedColor).
4. **Scaffold**: Menyediakan struktur dasar layar (AppBar, body, dan area lain).
5. **AppBar**: Menampilkan bilah atas (judul “Football Shop”).
6. **Text**: Menampilkan teks seperti judul aplikasi dan label tombol.
7. **SafeArea**: Menjaga agar konten tidak tertimpa area sistem (notch, status bar, dll).
8. **Padding**: Memberi jarak di sekitar konten agar tampilan tidak menempel ke tepi layar.
9. **Column**: Menyusun widget secara vertikal dari atas ke bawah.
10. **Row**: Menyusun widget secara horizontal (tiga tombol sejajar).
11. **Expanded**: Membuat tombol-tombol di dalam Row memiliki lebar yang sama dan menyesuaikan ruang.
12. **SizedBox**: Mengatur ukuran tetap (misalnya tinggi tombol) dan memberi jarak antar elemen.
13. **ElevatedButton.icon**: Tombol dengan ikon dan teks.
14. **Icon**: Menampilkan ikon di dalam tombol.
15. **SnackBar**: Menampilkan pesan sementara di bagian bawah layar saat tombol ditekan.
16. **ScaffoldMessenger**: Mengatur dan menampilkan SnackBar di halaman aktif.
17. **StatelessWidget**: Kelas dasar untuk membuat widget yang tidak memiliki state (tidak berubah selama aplikasi berjalan).
18. **runApp()**: Fungsi utama Flutter untuk menjalankan aplikasi dengan widget root (FootballShopApp)

## Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Widget MaterialApp berfungsi sebagai kerangka utama aplikasi Flutter yang menggunakan Material Design. Ia mengatur tema, judul, navigasi, dan halaman awal aplikasi. Widget ini sering dijadikan widget root karena menjadi wadah yang membungkus seluruh tampilan dan menyediakan konteks bagi widget lain seperti Scaffold dan AppBar, sehingga semua elemen Material Design dapat berfungsi dengan benar dan konsisten.

## Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
StatelessWidget adalah widget yang tidak memiliki keadaan (state), artinya tampilannya tidak akan berubah selama aplikasi berjalan. Contohnya seperti teks statis, ikon, atau tombol yang tampilannya tidak bergantung pada interaksi pengguna. Di sisi lain, StatefulWidget adalah widget yang memiliki state dan dapat berubah saat aplikasi berjalan, misalnya ketika pengguna menekan tombol, mengetik teks, atau memicu animasi.

Kita perlu memilih StatelessWidget ketika tampilan bersifat tetap dan tidak membutuhkan pembaruan data, sedangkan StatefulWidget digunakan ketika tampilan perlu diperbarui secara dinamis berdasarkan interaksi pengguna atau perubahan data.

## Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang menyimpan informasi tentang posisi suatu widget di dalam widget tree dan menjadi perantara antara widget tersebut dengan struktur aplikasi Flutter secara keseluruhan. Dapat disimpulkan, BuildContext memberi tahu keberadaan suatu widget dan memungkinkan widget untuk mengakses data dari widget di atasnya, seperti tema, ukuran layar, atau navigasi.

Dalam metode build, BuildContext digunakan sebagai parameter yang memberi akses ke lokasi widget di dalam widget tree. Fungsinya adalah agar widget bisa berinteraksi dengan widget lain yang berada di atasnya (ancestor) dan mengambil data atau properti yang dibutuhkan untuk membangun tampilan.

## Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
_Hot reload_ adalah fitur di Flutter yang memungkinkan pengembang melihat perubahan kode secara langsung tanpa kehilangan state aplikasi. Ketika kita menyimpan perubahan, Flutter hanya memperbarui bagian kode yang berubah dan mempertahankan data serta posisi terakhir di aplikasi. Ini dapat membuat proses pengembangan lebih cepat dan efisien karena tidak perlu menjalankan ulang aplikasi dari awal.

Sementara itu, _hot restart_ akan memuat ulang seluruh aplikasi dari awal dan menghapus semua state yang tersimpan. Flutter akan membangun ulang seluruh widget tree seperti saat pertama kali dijalankan. _Hot restart_ biasanya digunakan jika perubahan kode terjadi di bagian inisialisasi variabel global, struktur state, atau hal-hal yang tidak bisa diperbarui dengan _hot reload_.

