import 'package:flutter/material.dart';
import 'tagihan/tagihan_screen.dart';
import 'tagihan/transfer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WalletScreen(),
    );
  }
}

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              /// HEADER LOGO
              Row(
                children: [
                  Image.asset('assets/images/logo.jpg', width: 38),
                  const SizedBox(width: 12),
                  const Text(
                    'CV.TRILOKA SEJAHTERA',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              /// MENU (TRANSFER, TAGIHAN, MORE)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /// ===============================
                    ///         TRANSFER ON TAP
                    /// ===============================
                    MenuButton(
                      icon: Icons.sync_alt,
                      label: 'Transfer',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TransferScreen(),
                          ),
                        );
                      },
                    ),

                    MenuButton(
                      icon: Icons.receipt_long,
                      label: 'Tagihan',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const TagihanScreen(),
                          ),
                        );
                      },
                    ),

                    MenuButton(
                      icon: Icons.more_horiz,
                      label: 'More',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// PAYMENT OVERVIEW
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Payment Overview',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        _squareIcon(Icons.search),
                        const SizedBox(width: 10),
                        _squareIcon(Icons.tune),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// HISTORY ITEMS
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 6),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const PaymentItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _squareIcon(IconData icon) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Icon(icon, size: 22),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const MenuButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF3FD),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.blue, size: 26),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF3FD),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.sync_alt, color: Colors.blue, size: 22),
              ),
              const SizedBox(width: 14),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Transfer',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Yesterday · 19:12',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),

          const Text(
            '-Rp 600.000',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
