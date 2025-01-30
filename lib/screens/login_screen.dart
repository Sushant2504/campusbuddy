import 'package:flutter/material.dart';
import 'home_screen.dart'; // Replace with your home screen
import 'signup_screen.dart'; // Replace with your signup screen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08), // 8% horizontal padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome back!",
              style: TextStyle(fontSize: width * 0.08, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * 0.03),

            // Google Sign-In Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.grey.shade300),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: height * 0.015, horizontal: width * 0.1),
              ),
              onPressed: () {
                // Implement Google Sign-In Logic Here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/google_icon.png', height: height * 0.025), // Add Google icon in assets
                  SizedBox(width: 10),
                  Text(
                    "Continue with Google",
                    style: TextStyle(fontSize: width * 0.045, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),

            // Divider with "OR LOGIN WITH EMAIL"
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey.shade400, thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "OR LOGIN WITH EMAIL",
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(child: Divider(color: Colors.grey.shade400, thickness: 1)),
              ],
            ),
            SizedBox(height: height * 0.02),

            // Email Input
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Email",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: height * 0.015),

            // Password Input
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: "Password",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: height * 0.02),

            // Sign-In Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3A77FA),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.3),
              ),
              onPressed: () {
                // Implement Sign-In Logic Here
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Text(
                "SIGN IN",
                style: TextStyle(fontSize: width * 0.045, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: height * 0.015),

            // Forgot Password
            GestureDetector(
              onTap: () {
                // Implement Forgot Password Logic
              },
              child: Text(
                "Forgot password?",
                style: TextStyle(color: Color(0xFF3A77FA), fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: height * 0.02),

            // Sign Up Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don’t have an account?", style: TextStyle(color: Colors.grey.shade600)),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(color: Color(0xFF3A77FA), fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
