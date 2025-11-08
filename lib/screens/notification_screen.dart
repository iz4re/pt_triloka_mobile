import 'package:flutter/material.dart';
import 'notification_detail_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/logo.jpg', width: 35, height: 35),
                  const SizedBox(width: 8),
                  const Text(
                    "CV. TRILOKA SEJAHTERA",
                    style: TextStyle(
                      color: Color(0xFFF0AD00),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 14,
                      backgroundImage: AssetImage('assets/images/profile.jpeg'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Semua Dokumen",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4EAAA8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "2 new",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 4),
              const Text(
                "Message",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: [
                    _notifTile(
                      context,
                      img: "assets/images/profile.jpeg",
                      title: "Important Files!",
                      subtitle: "Make sure you receive these.",
                      time: "11:27 pm",
                    ),
                    _notifTile(
                      context,
                      img: "assets/images/profile.jpeg",
                      title: "Timesheet nextweek?",
                      subtitle: "Make sure you receive these.",
                      time: "May 6",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _notifTile(
    BuildContext context, {
    required String img,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => NotificationDetailScreen(
              title: title,
              subtitle: subtitle,
              date: time,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(radius: 24, backgroundImage: AssetImage(img)),
            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(time, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 6),
                const Icon(
                  Icons.star_border,
                  color: Color(0xFFF1C232),
                  size: 22,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
