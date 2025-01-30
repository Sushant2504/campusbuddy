import 'dart:async';
import 'package:flutter/material.dart';
import 'landing_screen.dart'; // Updated to go to LandingScreen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LandingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF3A77FA),
      body: Center(
        child: Image.asset(
          'assets/splash_image.png',
          width: width * 0.8,
          height: height * 0.5,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
