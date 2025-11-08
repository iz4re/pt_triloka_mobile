import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F4F7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Bio-data",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // ✅ Avatar
            const CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage('assets/images/profile.jpeg'),
            ),
            const SizedBox(height: 10),

            const Text(
              "Ujang Sarden",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),

            const Text(
              "ujangsarden@example.com",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),

            const SizedBox(height: 25),

            // ✅ Text Fields
            _inputField("What’s your first name?"),
            _inputField("And your last name?"),

            // ✅ Phone number row
            Row(
              children: [
                _countryBox(),
                const SizedBox(width: 12),
                Expanded(child: _inputField("Phone number")),
              ],
            ),

            // ✅ Gender dropdown
            _dropdownField("Select your gender"),

            // ✅ Date field
            _dateField(),

            const SizedBox(height: 30),

            // ✅ Button Update Profile
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF54A7C8),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Update Profile",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ✅ INPUT FIELD
  Widget _inputField(String hint) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // ✅ COUNTRY FLAG BOX
  Widget _countryBox() {
    return Container(
      width: 60,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: const Text("🇳🇬", style: TextStyle(fontSize: 24)),
    );
  }

  // ✅ DROPDOWN FIELD
  Widget _dropdownField(String hint) {
    return Container(
      height: 56,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hint, style: const TextStyle(color: Colors.grey)),
          const Icon(Icons.arrow_drop_down, color: Colors.grey),
        ],
      ),
    );
  }

  // ✅ DATE FIELD
  Widget _dateField() {
    return Container(
      height: 56,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: const [
          Expanded(
            child: Text(
              "What is your date of birth?",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Icon(Icons.calendar_today, size: 20, color: Colors.grey),
        ],
      ),
    );
  }
}
