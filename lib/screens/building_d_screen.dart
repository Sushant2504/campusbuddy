import 'package:flutter/material.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have navigated to Building $buildingName!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (buildingName == "D") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BuildingDScreen()),
                  );
                } else {
                  // Handle other buildings here if needed
                }
              },
              child: Text("Go to $buildingName Parking Slots"),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildingDScreen extends StatefulWidget {
  @override
  _BuildingDScreenState createState() => _BuildingDScreenState();
}

class _BuildingDScreenState extends State<BuildingDScreen> {
  Set<String> selectedSeats = {};
  List<String> reservedSeats = ["30A", "30B", "30C"];
  List<String> seatLayout = [
    "A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8",
    "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8",
    "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8",
    "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8",
    "E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        elevation: 0,
        title: Text("D Building", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: InteractiveViewer(
                panEnabled: true,
                boundaryMargin: EdgeInsets.all(20),
                minScale: 1,
                maxScale: 4,
                child: Column(
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: seatLayout.map((seat) => _buildSeat(seat)).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                  )
                ],
              ),
              child: Column(
                children: [
                  Text(selectedSeats.isEmpty ? "Select a slot" : selectedSeats.join(", "),
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    onPressed: selectedSeats.isNotEmpty ? () {} : null,
                    child: Text("Select Parking Slot", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeat(String seat) {
    bool isSelected = selectedSeats.contains(seat);
    bool isReserved = reservedSeats.contains(seat);
    return GestureDetector(
      onTap: () {
        if (!isReserved) {
          setState(() {
            if (isSelected) {
              selectedSeats.remove(seat);
            } else {
              selectedSeats.add(seat);
            }
          });
        }
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: isReserved ? Colors.grey : (isSelected ? Colors.green : Colors.black),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
