import 'package:flutter/material.dart';
import 'login_screen.dart'; // Navigate to login screen instead of home screen

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      "image": "assets/landing1.png",
      "text": "Welcome to MessApp! Find the best meals near you.",
    },
    {
      "image": "assets/landing2.png",
      "text": "Order and book meals easily with just a few taps.",
    },
    {
      "image": "assets/landing3.png",
      "text": "Enjoy delicious food anytime, anywhere.",
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      // Navigate to LoginScreen instead of HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: onboardingData.length,
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  onboardingData[index]["image"] ?? 'assets/default.png',
                  width: width * 0.8,
                  height: height * 0.5,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: height * 0.03),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  child: Text(
                    onboardingData[index]["text"] ?? "Default Text",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: height * 0.05,
            left: width * 0.1,
            right: width * 0.1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3A77FA),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
              ),
              onPressed: _nextPage,
              child: Text(
                _currentPage == onboardingData.length - 1 ? "Get Started" : "Next",
                style: TextStyle(
                  fontSize: width * 0.045,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
