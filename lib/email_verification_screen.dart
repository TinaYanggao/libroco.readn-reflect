import 'package:flutter/material.dart';
import 'reset_password_screen.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

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
                const SizedBox(height: 60),

                // logo.png Icon
                SizedBox(
                  width: 220,
                  height: 220,
                  child: Image.asset(
                    'assets/images/pass.png',
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Email Verification',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C090E),
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 6),

                Container(
                  height: 5,
                  width: 280,
                  color: Color(0xFF3C090E),
                ),

                const SizedBox(height: 24),

                const Text(
                  'Please enter the 4 digit code that send to your email address.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFF3C090E), width: 2),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color(0xFF3C090E),
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        decoration: const InputDecoration(
                          counterText: '', // Hide character counter
                          border: InputBorder.none,
                        ),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 25),

                // Underline
                Container(
                  height: 2,
                  width: 500,
                  color: Color(0xFF3C090E),
                ),

                const SizedBox(height: 40),

                const Text(
                  'If you don’t receive code! RESEND.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 20),

                // Confirm Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3C090E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Verify',
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
