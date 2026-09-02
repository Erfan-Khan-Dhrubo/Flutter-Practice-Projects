import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const VangtiChaiApp());
}

class VangtiChaiApp extends StatelessWidget {
  const VangtiChaiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VangtiChai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal.shade800,
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        useMaterial3: false,
      ),
      home: const HomeScreen(),
    );
  }
}
