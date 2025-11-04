import 'package:flutter/material.dart';
import 'package:football_shop/menu.dart'; // Mengimpor file menu.dart

void main() {
  runApp(const FootballShopApp());
}

class FootballShopApp extends StatelessWidget {
  const FootballShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Shop',
      theme: ThemeData(
        // Tema warna aplikasi diatur menggunakan ColorScheme
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blueAccent[400]),
      ),
      home: const MyHomePage(), // Halaman utama aplikasi
    );
  }
}
