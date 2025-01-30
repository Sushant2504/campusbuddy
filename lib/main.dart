import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Now starts with SplashScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Starts with SplashScreen
    );
  }
}
