import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart'; // Mengimpor file menu.dart

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
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: const Color.fromARGB(255, 229, 31, 222)),
      ),
      home: const MyHomePage(), // Halaman utama aplikasi
    );
  }
}
