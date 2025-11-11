
<details>
  <summary> Tugas 7 </summary>

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
</details>

# Tugas 8

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Pada Flutter, perbedaan utama antara Navigator.push() dan Navigator.pushReplacement() terletak pada cara keduanya menambahkan halaman ke dalam tumpukan navigasi. Navigator.push() akan menambahkan halaman baru di atas halaman yang sedang aktif, sehingga pengguna masih dapat kembali ke halaman sebelumnya dengan tombol “back”. Sementara itu, Navigator.pushReplacement() menggantikan halaman saat ini dengan halaman baru dan menghapus halaman lama dari tumpukan, jadi pengguna tidak bisa kembali ke halaman sebelumnya. Dalam aplikasi Football Shop saya, Navigator.push() lebih cocok digunakan saat membuka halaman tambah produk dari halaman utama, karena pengguna mungkin ingin kembali untuk melihat daftar produk. Sebaliknya, Navigator.pushReplacement() lebih cocok dipakai dari drawer ketika ingin berpindah antar halaman utama, misalnya dari “Add Product” ke “Homepage”, agar navigasi terasa lebih bersih tanpa menumpuk banyak halaman.

## Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Struktur aplikasi Football Shop memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk menciptakan tampilan halaman yang seragam dan mudah dipahami. Scaffold berfungsi sebagai kerangka dasar yang menyediakan struktur umum seperti area konten, app bar, dan drawer. AppBar digunakan untuk menampilkan judul aplikasi dan memperkuat identitas tiap halaman, sedangkan Drawer mempermudah navigasi antar halaman dengan tampilan menu yang konsisten di semua bagian aplikasi. Dengan kombinasi ketiganya, setiap halaman di Football Shop saya memiliki tata letak yang rapi dan pengalaman pengguna yang konsisten tanpa harus menulis ulang struktur dasar di setiap file.

## Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Penggunaan layout widget seperti Padding, SingleChildScrollView, dan ListView membantu mengatur tata letak agar elemen-elemen form tampil lebih rapi, proporsional, dan mudah diakses. Padding digunakan untuk memberi jarak antar elemen agar tampilan tidak terlalu rapat dan nyaman dilihat. SingleChildScrollView memungkinkan halaman digulir saat konten form lebih panjang dari layar, sehingga semua input tetap dapat diisi dengan mudah di berbagai ukuran perangkat. Sementara ListView berguna ketika menampilkan daftar elemen yang banyak dan dinamis. Dalam implementasi aplikasi Football Shop, saya menggunakan widget Padding  di setiap TextFormField agar setiap kolom input memiliki ruang yang cukup dan SingleChildScrollView untuk membungkus seluruh form tambah produk agar pengguna bisa menggulir ke bawah tanpa memotong bagian form yang panjang.

## Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Untuk saat ini, saya baru menggantikan beberapa background colour menjadi warna ungu agar selaras dengan design utama pada website.


