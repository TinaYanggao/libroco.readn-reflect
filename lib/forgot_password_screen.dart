import 'package:flutter/material.dart';
import 'email_verification_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF947887),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                SizedBox(height: 20),
                Image.asset('assets/images/pass.png', width: 450, height: 200),
                SizedBox(height: 20),
                Text('Forgot Password', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF3C090E))),
                SizedBox(height: 4),
                Container(height: 6, width: 250, color: Color(0xFF3C090E)),
                SizedBox(height: 24),
                Text('Enter the email address associated\nwith your account.', textAlign: TextAlign.center),
                SizedBox(height: 24),
                Align(alignment: Alignment.centerLeft, child: Text('Email:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFF3C090E)))),
                SizedBox(height: 4),

                // 🆕 START: Email TextField
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter your email',
                  ),
                ),
                SizedBox(height: 6),
                // 🆕 END: Email TextField

                Container(height: 2, width: 500, color: Color(0xFF3C090E)),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const EmailVerificationScreen()));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF3C090E), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
                    child: Text('Recover Password', style: TextStyle(fontSize: 20, color: Color(0xFF918D8C))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
