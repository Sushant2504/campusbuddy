import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Create an Account", style: TextStyle(fontSize: width * 0.08, fontWeight: FontWeight.bold)),
            SizedBox(height: height * 0.02),
            // SizedBox(height: height * 0.02),

            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Name",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
                        SizedBox(height: height * 0.015),

            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Email",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: height * 0.015),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: height * 0.02),
    TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "PRN",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
                        SizedBox(height: height * 0.02),

            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Department",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
                        SizedBox(height: height * 0.02),

                TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Year of study",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
                        SizedBox(height: height * 0.02),
            
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3A77FA),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.3),
              ),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text("SIGN UP", style: TextStyle(fontSize: width * 0.045, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
              // Divid
              //er with "OR LOGIN WITH EMAIL"
              
                     SizedBox(height: height * 0.02),

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?", style: TextStyle(color: Colors.grey.shade600)),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text("SIGN IN", style: TextStyle(color: Color(0xFF3A77FA), fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
