import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV. Triloka Sejahtera',
      theme: ThemeData(fontFamily: 'Poppins', useMaterial3: true),

      // ✅ App dimulai dari Splash Screen
      home: const SplashScreen(),
    );
  }
}
