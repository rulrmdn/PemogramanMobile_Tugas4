import 'package:flutter/material.dart';
import 'package:latihan_android/layout/home/Newspage.dart';
import 'layout/home/homepagewithmenu.dart';

// Ini adalah Function untuk running aplikasi.
void main() {
  runApp(const MyApp());
}

// Class ini dipanggil oleh function runApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
        useMaterial3: true,
      ),
      home: Newspage(),
    );
  }
}
