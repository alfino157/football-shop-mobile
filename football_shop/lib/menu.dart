import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
    return Scaffold(
      // Bagian atas halaman (AppBar)
      appBar: AppBar(
        title: const Text(
          'Football Shop',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      // Bagian isi utama (body)
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Menampilkan 3 tombol secara horizontal dalam 1 baris (Row)
            Row(
              children: [
                // Tombol "All Products"
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // warna biru
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.list, color: Colors.white),
                      label: const Text('All Products',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Kamu telah menekan tombol All Products"),
                            ),
                          );
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Tombol "My Products"
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // warna hijau
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon:
                          const Icon(Icons.shopping_bag, color: Colors.white),
                      label: const Text('My Products',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Kamu telah menekan tombol My Products"),
                            ),
                          );
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Tombol "Create Product"
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // warna merah
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: const Text('Create Product',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Kamu telah menekan tombol Create Product"),
                            ),
                          );
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // welcoming text
            const Center(
              child: Text(
                'Selamat datang di Football Shop!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
