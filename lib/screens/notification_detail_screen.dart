import 'package:flutter/material.dart';

class NotificationDetailScreen extends StatefulWidget {
  final String title;
  final String subtitle;
  final String date;

  const NotificationDetailScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
  });

  @override
  State<NotificationDetailScreen> createState() =>
      _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Colors.black, size: 26),
        ),

        // ✅ Ikon archive + delete + more (sesuai figma gmail)
        actions: const [
          Icon(Icons.archive_outlined, color: Colors.black),
          SizedBox(width: 18),
          Icon(Icons.delete_outline, color: Colors.black),
          SizedBox(width: 18),
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Title + star
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                ),
                const Icon(
                  Icons.star_border,
                  color: Color.fromARGB(255, 8, 8, 8),
                  size: 28,
                ),
              ],
            ),

            const SizedBox(height: 70),

            // ✅ Sender row (rapi seperti gmail)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // FOTO
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage('assets/images/profile.jpeg'),
                ),
                const SizedBox(width: 12),

                // ✅ Nama + "to me ▼"
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "CV Triloka Sejahtera",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() => showDetails = !showDetails);
                        },
                        child: Row(
                          children: [
                            const Text(
                              "to me",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                            Icon(
                              showDetails
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // ✅ JAM + ICON REPLY + ICON ⋮ → dalam 1 Row, sejajar
                Row(
                  children: [
                    Text(
                      widget.date,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(width: 12),

                    const Icon(
                      Icons.reply_outlined,
                      size: 22,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 14),

                    const Icon(Icons.more_vert, size: 22, color: Colors.black),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ✅ Dropdown area — hanya muncul saat diklik
            if (showDetails)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(120),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Place AD\nMockup\nHere",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
              ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
