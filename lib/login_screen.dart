import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hanya "Welcome!" yang rata kiri
              const Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2C3E50),
                ),
              ),

              const SizedBox(height: 120),

              // Mulai konten di tengah
              Center(
                child: Column(
                  children: [
                    // Tab Switch Login / SignUp
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => isLogin = true),
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: isLogin
                                      ? const Color(0xFF2C3E50)
                                      : Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              if (isLogin)
                                Container(
                                  height: 2,
                                  width: 60,
                                  color: const Color(0xFF2C3E50),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        GestureDetector(
                          onTap: () => setState(() => isLogin = false),
                          child: Column(
                            children: [
                              Text(
                                "SignUp",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: !isLogin
                                      ? const Color(0xFF2C3E50)
                                      : Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              if (!isLogin)
                                Container(
                                  height: 2,
                                  width: 70,
                                  color: const Color(0xFF2C3E50),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // Input Fields
                    if (!isLogin) _buildTextField("First Name", false),
                    _buildTextField("Enter Your Email", false),
                    _buildTextField("Enter Your Password", true),

                    const SizedBox(height: 30),

                    // Tombol utama
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF5DA8A7),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          isLogin ? "Login" : "Create Account",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text("Or"),

                    const SizedBox(height: 25),

                    // Social login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/google.png', width: 40),
                        const SizedBox(width: 25),
                        Image.asset('assets/images/facebook.png', width: 40),
                      ],
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

  Widget _buildTextField(String hint, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextField(
        obscureText: isPassword && !showPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () => setState(() => showPassword = !showPassword),
                )
              : null,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2C3E50)),
          ),
        ),
      ),
    );
  }
}
