// pt_triloka_mobile/lib/screens/home_screen.dart (Koreksi Indeks)

import 'package:flutter/material.dart';
import 'package:pt_triloka_mobile/screens/dashboard_screen.dart';
import 'package:pt_triloka_mobile/screens/wallet_screen.dart';
import 'package:pt_triloka_mobile/screens/document_screen.dart';
import 'package:pt_triloka_mobile/screens/notification_screen.dart'; // Mengganti Profile dengan Notification

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // === PERBAIKAN: URUTAN HALAMAN HARUS SESUAI IKON NAV BAR ===
  final List<Widget> _pages = const [
    DashboardScreen(), // Index 0: Home (Asumsi Dashboard)
    DocumentScreen(), // Index 1: Document
    WalletScreen(), // Index 2: Wallet
    NotificationScreen(), // Index 3: Notifikasi
  ];
  // ==========================================================

  final List<Map<String, dynamic>> _navItems = [
    {'label': 'Home', 'icon': Icons.home},
    {'label': 'Document', 'icon': Icons.file_copy},
    {'label': 'Wallet', 'icon': Icons.account_balance_wallet},
    {'label': 'Notifikasi', 'icon': Icons.notifications},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue.shade800,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: _navItems.map((item) {
          return BottomNavigationBarItem(
            icon: Icon(item['icon']),
            label: item['label'],
          );
        }).toList(),
      ),
    );
  }
}
