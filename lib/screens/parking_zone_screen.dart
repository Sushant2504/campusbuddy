import 'package:flutter/material.dart';

class ParkingZoneScreen extends StatefulWidget {
  @override
  _ParkingZoneScreenState createState() => _ParkingZoneScreenState();
}

class _ParkingZoneScreenState extends State<ParkingZoneScreen> {
  String selectedZone = "Zone A";

  // Parking Data (Can be Fetched from API or Database)
  Map<String, List<Map<String, dynamic>>> parkingZones = {
    "Zone A": [
      {"label": "A1", "status": "Available"},
      
    ],
    "Zone B": [
      {"label": "B1", "status": "Available"},
      {"label": "B2", "status": "Reserved"},
      {"label": "B3", "status": "Occupied"},
      {"label": "B4", "status": "Available"},
      {"label": "B5", "status": "Available"},
    ],
    "Zone C": [
      {"label": "C1", "status": "Available"},
      {"label": "C2", "status": "Occupied"},
      {"label": "C3", "status": "Reserved"},
      // {"label": "C4", "status": "Available"},
    ],
    "Zone D": [
      {"label": "E1", "status": "Available"},
      {"label": "E2", "status": "Occupied"},
      {"label": "E3", "status": "Reserved"},
      {"label": "E3", "status": "Reserved"},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Parking Zones", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Zone Selection Buttons
            Text("Select Parking Zone", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ["Zone A", "Zone B", "Zone C", "Zone D"].map((zone) => _buildZoneButton(zone)).toList(),
            ),
            SizedBox(height: 15),

            // Parking Slots Grid
            Expanded(child: _buildParkingGrid(selectedZone)),

            // Parking Legend
            SizedBox(height: 20),
            _buildLegend(),
          ],
        ),
      ),
    );
  }

  // Widget: Zone Selection Button
  Widget _buildZoneButton(String zone) {
    bool isSelected = selectedZone == zone;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedZone = zone;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          border: isSelected ? Border.all(color: Colors.blue.shade700, width: 2) : null,
        ),
        child: Text(
          zone,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Widget: Parking Grid
  Widget _buildParkingGrid(String zone) {
    List<Map<String, dynamic>> slots = parkingZones[zone] ?? [];

    return slots.isEmpty
        ? Center(
            child: Text(
              "No Parking Slots Available",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey.shade600),
            ),
          )
        : GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.2,
            ),
            itemCount: slots.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> slot = slots[index];
              Color borderColor = _getStatusColor(slot["status"]);
              Color bgColor = borderColor.withOpacity(0.1);

              return GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Parking Slot ${slot["label"]} is ${slot["status"]}."),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: borderColor, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      slot["label"],
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: borderColor),
                    ),
                  ),
                ),
              );
            },
          );
  }

  // Widget: Parking Legend
  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem("Available", Colors.green),
        SizedBox(width: 20),
        _buildLegendItem("Occupied", Colors.red),
        SizedBox(width: 20),
        _buildLegendItem("Reserved", Colors.blue),
      ],
    );
  }

  // Widget: Individual Legend Item
  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            border: Border.all(color: color, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(width: 5),
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)),
      ],
    );
  }

  // Function: Get Color Based on Status
  Color _getStatusColor(String status) {
    switch (status) {
      case "Available":
        return Colors.green;
      case "Occupied":
        return Colors.red;
      case "Reserved":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
