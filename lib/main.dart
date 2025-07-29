import 'package:flutter/material.dart';
import 'landing_screen.dart';
import 'signup_screen.dart';
import 'login_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ReadN'Reflect",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LandingScreen(),
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
