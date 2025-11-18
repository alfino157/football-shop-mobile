import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart'; // Mengimpor file menu.dart
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:football_shop/screens/login.dart';

void main() {
  runApp(const FootballShopApp());
}

class FootballShopApp extends StatelessWidget {
  const FootballShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
      title: 'Football Shop',
      theme: ThemeData(
        // Tema warna aplikasi diatur menggunakan ColorScheme
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: const Color.fromARGB(255, 229, 31, 222)),
        ),
      home: const LoginPage(), // Halaman utama aplikasi
      )
    );
  }
}
