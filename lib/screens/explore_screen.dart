import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        elevation: 0,
        title: Text("Explore", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("August 8, 2023", style: TextStyle(color: Colors.white, fontSize: 14)),
                      SizedBox(height: 5),
                      Text("Good Morning/Evening!", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("Student Name", style: TextStyle(color: Colors.white70, fontSize: 14)),
                    ],
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.blue.shade300),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            
            // Explore Title
            Center(
              child: Column(
                children: [
                  Text("Explore", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Text("Campus with Buddy", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.blue.shade600)),
                ],
              ),
            ),
            SizedBox(height: 20),
            
            // Feature Grid
            _buildFeatureGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureGrid() {
    return Column(
      children: [
        _buildFeatureRow([
          _buildFeatureTile("Canteen", "assets/canteen.png"),
          _buildFeatureTile("Printing", "assets/printing.png"),
          _buildFeatureTile("Locais", "assets/location.png"),
        ]),
        SizedBox(height: 10),
        _buildFeatureRow([
          _buildFeatureTile("Mess", "assets/canteen.png"),
          _buildFeatureTile("Stationary", "assets/printing.png"),
          _buildFeatureTile("Locais", "assets/location.png"),
        ]),
      ],
    );
  }

  Widget _buildFeatureRow(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  Widget _buildFeatureTile(String label, String assetPath) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(assetPath, width: 40, height: 40),
          SizedBox(height: 5),
          Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}