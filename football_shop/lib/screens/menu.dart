import 'package:flutter/material.dart';
import 'package:football_shop/screens/product_entry_list.dart';
import 'package:football_shop/screens/productlist_form.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
    final request = context.watch<CookieRequest>();
    return Scaffold(
      // Bagian atas halaman (AppBar)
      appBar: AppBar(
        title: const Text(
          'Onif Sportswear',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () async {
              // URL backend sesuai platform
              final response = await request.logout(
                  "http://localhost:8000/auth/logout/");

              if (!context.mounted) return;

              String message = response["message"];

              if (response['status'] == true) {
                String uname = response["username"];

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$message See you again, $uname.")),
                );

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              }
            },
          ),
        ],
      ),
      drawer: LeftDrawer(),

      // Bagian isi utama (body)
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // welcoming text
            const Center(
              child: Text(
                'Welcome to Onif Sportswear!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Menampilkan 3 tombol secara horizontal dalam 1 baris (Row)
            Row(
              children: [
                // Tombol "All Products"
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow, // warna biru
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
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProductEntryListPage()
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductEntryListPage(isMyProducts: true)
                          ),
                        );
                      }
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductFormPage()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

          ],
        ),
      ),
    );
  }
}
