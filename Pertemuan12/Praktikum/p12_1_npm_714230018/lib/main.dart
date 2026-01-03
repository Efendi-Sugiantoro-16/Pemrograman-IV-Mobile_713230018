// main.dart
// Entry point aplikasi Flutter.
// Pastikan nama package di pubspec.yaml adalah: p12_1_npm_714230014

import 'package:flutter/material.dart';
import 'package:p12_1_npm_714230018/view/screen/home_page.dart';

void main() {
  // Memulai aplikasi
  runApp(const P12App());
}

class P12App extends StatelessWidget {
  const P12App({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp dasar, theme sederhana
    return MaterialApp(
      title: 'Praktikum Pemrograman Mobile - P12',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Home page utama aplikasi
      home: const HomePage(),
    );
  }
}
