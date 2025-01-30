import 'package:flutter/material.dart';

class ParkingScreen extends StatefulWidget {
  @override
  _ParkingScreenState createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {
  String selectedVehicle = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        elevation: 0,
        title: Text("Parking", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, find the best parking spots", style: TextStyle(fontSize: 16, color: Colors.black54)),
            SizedBox(height: 10),
            
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: "search...",
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              ),
            ),
            
            SizedBox(height: 16),
            
            // Parking Map Preview with Zoom
            Expanded(
              child: InteractiveViewer(
                panEnabled: true,
                boundaryMargin: EdgeInsets.all(20),
                minScale: 1,
                maxScale: 4,
                child: Image.asset(
                  "assets/parking_map.png", // Replace with your image asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            SizedBox(height: 20),
            
            // Buttons Below Map
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBuildingButton(context, "C"),
                _buildBuildingButton(context, "B"),
                _buildBuildingButton(context, "D"),
                _buildBuildingButton(context, "E"),
                _buildBuildingButton(context, "A"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBuildingButton(BuildContext context, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade800,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BuildingScreen(buildingName: label)),
        );
      },
      child: Text(label, style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}

// Screen to display when navigating from buttons
class BuildingScreen extends StatelessWidget {
  final String buildingName;
  
  const BuildingScreen({Key? key, required this.buildingName}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Building $buildingName"),
      ),
      body: Center(
        child: Text("You have navigated to Building $buildingName!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

