import 'package:flutter/material.dart';
//bool _isPasswordHidden = true; // 👁️ Tracks if password is hidden
import 'home_screen.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF947887),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Image.asset('assets/images/logo.png', width: 450, height: 200),
                SizedBox(height: 10),

                // Title
                Text(
                  "READN'REFLECT",
                  style: TextStyle(fontSize: 20, color: Color(0xFF3C090E), fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),

                // Sign Up Header
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF3C090E)),
                ),
                SizedBox(height: 4),
                Container(height: 5, width: 120, color: Color(0xFF3C090E)),
                SizedBox(height: 20),


                // First Name and Last Name in one row
                Row(
                  children: [
                    Expanded(
                      child: buildTextField('First Name:', firstNameController),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: buildTextField('Last Name:', lastNameController),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Email
                buildTextField('Email:', emailController),
                SizedBox(height: 16),

                // Password
                buildTextField('Password:', passwordController, isObscure: true),
                SizedBox(height: 16),


                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BookHomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3C090E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18, color: Color(0xFFEBE6E5)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🔧 Helper for textfields with label
  Widget buildTextField(String label, TextEditingController controller, {bool isObscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF3C090E)),
            ),
          ),
        TextField(
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
