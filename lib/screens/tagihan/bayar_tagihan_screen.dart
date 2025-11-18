import 'package:flutter/material.dart';
import 'kode_pembayaran_screen.dart';

class BayarTagihanScreen extends StatelessWidget {
  const BayarTagihanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Bayar Tagihan",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.help_outline, color: Colors.black),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Jumlah tagihan
            const Text(
              "Jumlah tagihan",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Tanggal 2 Juni 2025",
                  style: TextStyle(color: Colors.grey),
                ),
                Text("Rp 0", style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 20),

            // Jumlah
            const Text(
              "Jumlah",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Rp1.500.000",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Jumlah pembayaran
            const Text(
              "Jumlah pembayaran tagihan",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text.rich(
                    TextSpan(
                      text: "Rp ",
                      style: TextStyle(fontSize: 14),
                      children: [
                        TextSpan(
                          text: "500.000",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.close, size: 20),
                ],
              ),
            ),

            const Text(
              "Jumlah minimum pembayaran tagihan adalah Rp500.000",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),

            const Spacer(),

            // BUTTON LANJUT
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5AA6D8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => _showBankSheet(context),
                child: const Text("Lanjut", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBankSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (_) => const _BankListSheet(),
    );
  }
}

class _BankListSheet extends StatelessWidget {
  const _BankListSheet({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> bankList = [
      {"name": "Bank Central Asia (BCA)", "va": "8277 0001 3888 0651"},
      {"name": "Bank Negara Indonesia (BNI)", "va": "9881 4422 3331"},
      {"name": "Bank Rakyat Indonesia (BRI)", "va": "0021 8899 5521"},
      {"name": "Bank CIMB Niaga", "va": "3771 6644 2211"},
    ];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            "Pilih metode pembayaran",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          ...bankList.map(
            (bank) => InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => KodePembayaranScreen(
                      bankName: bank["name"]!,
                      nomorVA: bank["va"]!,
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(bank["name"]!, style: const TextStyle(fontSize: 16)),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
