import 'package:flutter/material.dart';
import 'cafes_screen.dart';
import 'canteen_screen.dart';
import 'parking_screen.dart';
import 'profile_screen.dart';
import 'explore_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Default selected index (Home)

  // List of pages (replace with actual screens)
  final List<Widget> _pages = [
    ExploreScreen(),
    CafesScreen(),
    CanteenScreen(),
    ParkingScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Color(0xFF3A77FA), // Selected icon color
            unselectedItemColor: Colors.purple.shade200, // Unselected icon color
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
              BottomNavigationBarItem(icon: Icon(Icons.local_cafe), label: 'Cafes'),
              BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: 'Canteen'),
              BottomNavigationBarItem(icon: Icon(Icons.local_parking), label: 'Parking'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
