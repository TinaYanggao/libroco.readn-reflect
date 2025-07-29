import 'package:flutter/material.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF947887),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Image (logo.png)
                SizedBox(
                  width: 450, // adjust for better fit (original size: 500)
                  height: 200, // keeps the 500x281 ratio (281 / 500 = ~0.56)
                  child: Image.asset(
                    'assets/images/pass.png', // make sure this matches your actual path
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 20),

                // Reset Password
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C090E),
                    letterSpacing: 2,
                  ),
                ),

                // Reset Password Line
                const SizedBox(height: 4),
                Container(
                  height: 10,
                  width: 295,
                  color: Color(0xFF3C090E),
                ),

                const SizedBox(height: 32),


                // Enter New Password
                const Text(
                  'Enter New Password',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C090E),
                    letterSpacing: 2,
                  ),
                ),


                const SizedBox(height: 24),

                // short message
                const Text(
                  'Your new password must be different from previously used password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),


                const SizedBox(height: 24),

                // Password Label
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password:',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3C090E),
                    ),
                  ),
                ),

                // 🔽 Password TextField (add this after Password label)
                TextField(
                  obscureText: false, // password is visible while typing
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your new password',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),


                const SizedBox(height: 24),

                // Confirm Password label
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirm Password:',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3C090E),
                    ),
                  ),
                ),

                // 🔽 Confirm Password TextField (add this after Confirm Password label)
                TextField(
                  obscureText: false, // password is visible while typing
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Re-enter your new password',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),




                const SizedBox(height: 40),


                // Continue Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3C090E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        color: Color(0xFF918D8C),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
