import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7B5B68),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
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
                      color: Color(0xFF3C090E),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3C090E),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  "Log In",
                  style: TextStyle(color: Color(0xFF918D8C)),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3C090E),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Color(0xFF918D8C)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
