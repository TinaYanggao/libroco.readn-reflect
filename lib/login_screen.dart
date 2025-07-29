import 'package:flutter/material.dart';
import 'forgot_password_screen.dart';
import 'home_screen.dart';


class LoginScreen extends StatelessWidget {
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
                SizedBox(
                  width: 500,
                  height: 281,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(height: 20),
                Text(
                  "READN'REFLECT",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    color: Color(0xFF3C090E),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'LOG IN',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C090E),
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 4),
                Container(height: 10, width: 141, color: Color(0xFF3C090E)),
                SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Email:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFF3C090E))),
                ),

                // 🆕 START: Email TextField
                TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 6),
                // 🆕 END: Email TextField

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Password:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFF3C090E))),
                ),

                // 🆕 START: Password TextField
                TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 6),
                // 🆕 END: Password TextField

                SizedBox(height: 4),
                Container(height: 2, width: 500, color: Color(0xFF3C090E)),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen())),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF3C090E),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
                      backgroundColor: Color(0xFF3C090E),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    ),
                    child: Text(
                      'LOG IN',
                      style: TextStyle(fontSize: 20, color: Color(0xFF918D8C)),
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
}
