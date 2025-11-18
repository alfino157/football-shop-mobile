
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

<details>
<summary> Tugas 8 </summary>

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Pada Flutter, perbedaan utama antara Navigator.push() dan Navigator.pushReplacement() terletak pada cara keduanya menambahkan halaman ke dalam tumpukan navigasi. Navigator.push() akan menambahkan halaman baru di atas halaman yang sedang aktif, sehingga pengguna masih dapat kembali ke halaman sebelumnya dengan tombol “back”. Sementara itu, Navigator.pushReplacement() menggantikan halaman saat ini dengan halaman baru dan menghapus halaman lama dari tumpukan, jadi pengguna tidak bisa kembali ke halaman sebelumnya. Dalam aplikasi Football Shop saya, Navigator.push() lebih cocok digunakan saat membuka halaman tambah produk dari halaman utama, karena pengguna mungkin ingin kembali untuk melihat daftar produk. Sebaliknya, Navigator.pushReplacement() lebih cocok dipakai dari drawer ketika ingin berpindah antar halaman utama, misalnya dari “Add Product” ke “Homepage”, agar navigasi terasa lebih bersih tanpa menumpuk banyak halaman.

## Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Struktur aplikasi Football Shop memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk menciptakan tampilan halaman yang seragam dan mudah dipahami. Scaffold berfungsi sebagai kerangka dasar yang menyediakan struktur umum seperti area konten, app bar, dan drawer. AppBar digunakan untuk menampilkan judul aplikasi dan memperkuat identitas tiap halaman, sedangkan Drawer mempermudah navigasi antar halaman dengan tampilan menu yang konsisten di semua bagian aplikasi. Dengan kombinasi ketiganya, setiap halaman di Football Shop saya memiliki tata letak yang rapi dan pengalaman pengguna yang konsisten tanpa harus menulis ulang struktur dasar di setiap file.

## Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Penggunaan layout widget seperti Padding, SingleChildScrollView, dan ListView membantu mengatur tata letak agar elemen-elemen form tampil lebih rapi, proporsional, dan mudah diakses. Padding digunakan untuk memberi jarak antar elemen agar tampilan tidak terlalu rapat dan nyaman dilihat. SingleChildScrollView memungkinkan halaman digulir saat konten form lebih panjang dari layar, sehingga semua input tetap dapat diisi dengan mudah di berbagai ukuran perangkat. Sementara ListView berguna ketika menampilkan daftar elemen yang banyak dan dinamis. Dalam implementasi aplikasi Football Shop, saya menggunakan widget Padding  di setiap TextFormField agar setiap kolom input memiliki ruang yang cukup dan SingleChildScrollView untuk membungkus seluruh form tambah produk agar pengguna bisa menggulir ke bawah tanpa memotong bagian form yang panjang.

## Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Untuk saat ini, saya baru menggantikan beberapa background colour menjadi warna ungu agar selaras dengan design utama pada website.
</details>

# Tugas 9

## Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
Membuat model Dart saat bekerja dengan data JSON itu penting karena model berfungsi sebagai kontrak tipe data antara Flutter dan backend. Dengan model, setiap field punya tipe yang jelas (misalnya String name, double price, int stock) dan kita bisa memanfaatkan null-safety Dart, sehingga banyak bug bisa ketahuan saat kita compile. Kalau kita hanya pakai Map<String, dynamic> tanpa model, kita cenderung mengakses data dengan map["name"] atau map["price"] secara bebas, yang rawan typo key, salah tipe, dan nilai null yang tidak terkontrol. Dalam jangka panjang, kode seperti itu lebih sulit dirapikan, lebih susah direfactor, dan validasi jadi menyebar ke mana-mana, bukan terpusat di satu tempat (model). Jadi, penggunaan model membuat kode lebih rapi, mudah dibaca, dan maintainable, apalagi kalau struktur JSON sering berubah atau dipakai di banyak bagian aplikasi.

## Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
Dalam tugas ini, package http dan CookieRequest sama-sama dipakai untuk komunikasi antara Flutter dan Django, tetapi perannya berbeda. Package http menyediakan fungsi dasar untuk melakukan request seperti GET dan POST ke endpoint Django tanpa manajemen sesi yang rumit, sehingga cocok untuk request yang tidak butuh login atau cookie khusus. Sementara itu, CookieRequest (dari package pbp_django_auth) didesain khusus untuk berinteraksi dengan Django yang memakai session dan CSRF, karena dia otomatis menyimpan cookie, mengirimnya kembali di request berikutnya, dan mengurus header yang dibutuhkan untuk autentikasi. 

## Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Instance CookieRequest perlu dibagikan ke semua komponen aplikasi supaya seluruh halaman Flutter memakai sesi yang sama ketika berkomunikasi dengan Django. Biasanya ini dilakukan lewat Provider atau InheritedWidget, sehingga CookieRequest yang diinject di level atas bisa diakses oleh semua widget di bawahnya. Kalau tiap halaman atau widget membuat instance CookieRequest sendiri-sendiri, maka cookie dan status login tidak akan konsisten: bisa terjadi kasus di mana halaman A merasa sudah login sementara halaman B belum, karena mereka memegang “kantong cookie” yang berbeda. Dengan satu instance yang dibagikan, status autentikasi, cookie session, dan CSRF token akan sinkron di seluruh aplikasi sehingga pengalaman pengguna lebih mulus dan tidak membingungkan.

## Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
Agar Flutter bisa berkomunikasi dengan Django, ada beberapa konfigurasi konektivitas yang harus disetel di sisi backend dan Android. Alamat 10.0.2.2 perlu ditambahkan ke ALLOWED_HOSTS Django karena di Android emulator, 10.0.2.2 adalah nama untuk localhost dan tanpa ini Django akan menolak request karena dianggap datang dari host yang tidak diizinkan. Selain itu, kita perlu mengaktifkan CORS dengan django-cors-headers dan mengatur SameSite/cookie supaya cookie sesi dan CSRF dapat dikirim dengan benar dari Flutter ke Django. Di sisi Android, kita juga harus menambahkan izin akses internet di AndroidManifest.xml, kalau tidak, aplikasi tidak bisa melakukan request ke jaringan sama sekali. Jika konfigurasi ini salah, konsekuensinya bisa mulai dari error koneksi (tidak bisa terhubung), respons 400/403 dari Django (CSRF gagal atau host tidak diizinkan), sampai cookie yang tidak pernah tersimpan sehingga login selalu gagal.

## Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Mekanisme pengiriman data dari input sampai kembali tampil di Flutter umumnya mengikuti alur berikut:
pengguna mengisi form di Flutter (misalnya form tambah produk), lalu saat tombol “Save” ditekan, data dari TextFormField dan input lain dikumpulkan, divalidasi di sisi Flutter, kemudian dikirim ke Django lewat request POST menggunakan http atau CookieRequest. Di sisi Django, data ini diterima di view, divalidasi lagi (misalnya lewat form atau serializer), lalu disimpan ke database sebagai objek model. Setelah proses penyimpanan berhasil, Django mengembalikan respons (bisa berupa status sukses atau JSON berisi data produk baru). Flutter kemudian membaca respons ini, misalnya dengan jsonDecode, dan menampilkan hasilnya ke pengguna, entah dalam bentuk dialog, snackbar, atau dengan memperbarui tampilan list produk di halaman tertentu.

## Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Mekanisme autentikasi dari login, register, hingga logout melibatkan komunikasi dua arah antara Flutter dan Django dengan bantuan cookie sesi. Saat login, pengguna mengisi username dan password di Flutter, lalu data itu dikirim ke endpoint login Django menggunakan CookieRequest. Django memeriksa kredensial melalui sistem auth, dan jika benar, Django membuat session dan mengembalikan cookie session (dan biasanya CSRF) yang disimpan oleh CookieRequest. Setelah itu, setiap request berikutnya dari Flutter yang memakai instance CookieRequest yang sama akan otomatis membawa cookie tersebut sehingga Django mengenali pengguna sebagai sudah login dan mengizinkan akses ke endpoint tertentu. Di sisi lain, proses register hampir sama dengan login, hanya saja Django membuat akun baru lebih dulu, lalu bisa langsung mengautentikasi pengguna. Saat logout, Flutter memanggil endpoint logout Django, yang akan menghapus session di server, dan CookieRequest juga menghapus cookie di sisi Flutter. Setelah logout berhasil, Flutter biasanya mengarahkan pengguna kembali ke halaman login atau layar awal dengan Navigator.pushReplacement, sehingga menu yang membutuhkan autentikasi tidak lagi bisa diakses.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
1. membuat django app baru bernama authentication dan menambahkannya pada INSTALLED_APPS di settings.py main directory project
2. menginstall pip install-django-cors-header dan menambahkan 'corsheader' ke INSTALLED_APPS
3. menambahkan corsheaders.middleware.CorsMiddleware ke MIDDLEWARE settings.py
4. Menambahkan "10.0.2.2" pada ALLOWED_HOST
5. membuat function login, register, dan logout pada views.py di app authentication
6. menambahkan semua function views tersebut pada path url di urls.py
7. menghubungkan path authentication pada ursl.py di directory project onif_sportswear
8. menginstall package provide dan pbp_django_auth pada directory project flutter
9. menambahkan cookieRequest pada main.dart
10. membuat login.dart pada directory screens dan mengimplementasikan fungsi login
11. mengubah home pada main.dart menjadi home:const LoginPage() agar user harus login dulu
12. membuat register.dart pada directory screens dan mengimplementasikan register user
13. memodifikasi bagian login.dart agar ketika menekan tombol register dapat ngeredirect ke fungsi register.dart
14. membuat model baru di flutter dari enpoint json website menggunakan quicktype
15. membuat directory models dan file product_entry.dart dan memasukkan kode dart dari quicktyle untuk model product
16. menambahkan package http ke dart dan memodifikasi AndoridManifest.xml agar memperbolehkan akses internet
17. membuat fungsi proxy_image pada views.py directory main django dan menghubungkan url pathnya pada urls.py
18. membuat file baru bernama product_entry_card.dart dan mengimplementasi design card product pada flutter
19. membuat file product_entry_list.dart untuk mengambil semua product pada website ke mobile flutter melalui json
20. memodifikasi left_drawer.dart agar ketika memecet tombol product list dia akan route ke product list page
21. memodifikasi menu.dart agar ketika memecet tombol all product dia akan route juga ke product list page (navigator.push)
22. membuat file news_detail.dart untuk design detail product ketika memencet suatu card product
23. memodifikasi product_entry_list.dart agar ketika memencet card dia akan route ke product detail page (navigator.push)
24. membuat fungsi create_product_flutter pada django views.py main agar dapat otomatis membuat product baru juga ketika user add product di mobile flutter, lalu menambahkan path url pada urls.py
25. memodifikasi productlist_form.dart agar dapat menggunakan cookieRequest dan mendistribute product baru dengan json
26. menambahkan fungsi logout pada views.py authentication django dan menambhakn path url pada urls.py
27. memodifikasi dan mengimplementasikan cookieRequest dan logout pada menu.dart
28. membuat fungsi show_json_my_products pada directory main django untuk memfilter product berdasarkan user yang sedang login dan mengubahnya menjadi json untuk diimplemntasikan di flutter
29. memodifikasi product_entry_list.dart agar dapat implement filter my product
30. memodifikasi menu.dart agar ketika memencet tombol my products dia akan route ke product_entry_list dengan navigator.push dan const ProductEntryListPage(isMyProducts: true)
