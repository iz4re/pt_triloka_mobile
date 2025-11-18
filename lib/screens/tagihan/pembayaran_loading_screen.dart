import 'package:flutter/material.dart';
import 'pembayaran_berhasil_screen.dart';

class PembayaranLoadingScreen extends StatefulWidget {
  const PembayaranLoadingScreen({super.key});

  @override
  State<PembayaranLoadingScreen> createState() =>
      _PembayaranLoadingScreenState();
}

class _PembayaranLoadingScreenState extends State<PembayaranLoadingScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const PembayaranBerhasilScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text("Proses Anda sedang dilakukan. Mohon tunggu"),
          ],
        ),
      ),
    );
  }
}
