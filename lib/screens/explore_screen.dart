import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String selectedQuickAction = "";
  String selectedZone = "Zone A";

  Map<String, List<Map<String, dynamic>>> parkingZones = {
    "Zone A": [
      {"label": "A1", "status": "Available"},
      {"label": "A2", "status": "Occupied"},
      {"label": "A3", "status": "Available"},
      {"label": "A4", "status": "Occupied"},
      {"label": "B1", "status": "Available"},
      {"label": "B2", "status": "Reserved"},
      {"label": "B3", "status": "Occupied"},
      {"label": "B4", "status": "Available"},
    ],
    "Zone B": [],
    "Zone C": [],
    "Zone D": [],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Explore",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search services...",
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 20),

            // Quick Actions
            Text("Quick Actions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildQuickAction(
                    "Mess Menu", Icons.shopping_cart, Colors.blue),
                _buildQuickAction("Parking", Icons.local_parking, Colors.green),
                _buildQuickAction("Print", Icons.print, Colors.purple),
              ],
            ),
            SizedBox(height: 20),

            // Nearby Messes
            Text("Nearby Messes",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildNearbyMess("Amantran", "0.2 km away • Open now", 4.5),
            _buildNearbyMess(
                "Cafeteria", "0.5 km away • Open now", 4.2),

            SizedBox(height: 20),

            // Parking Availability
            Text("Parking Availability",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildParkingAvailability(12, 45, 3),

            // Parking Zones
            SizedBox(height: 20),
            Text("Select Parking Zone",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ["Zone A", "Zone B", "Zone C", "Zone D"]
                  .map((zone) => _buildZoneButton(zone))
                  .toList(),
            ),
            SizedBox(height: 10),

            // Parking Slots Grid
            Expanded(child: _buildParkingGrid(selectedZone)),
          ],
        ),
      ),
    );
  }

  Widget _buildParkingAvailability(int available, int occupied, int reserved) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildParkingItem("Available", available, Colors.green),
          _buildParkingItem("Occupied", occupied, Colors.red),
          _buildParkingItem("Reserved", reserved, Colors.blue),
        ],
      ),
    );
  }

  Widget _buildParkingItem(String label, int count, Color color) {
    return Column(
      children: [
        Text(count.toString(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: color)),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.black54)),
      ],
    );
  }

  Widget _buildQuickAction(String title, IconData icon, Color color) {
    bool isSelected = selectedQuickAction == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedQuickAction = title;
        });
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.3) : color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: isSelected ? Border.all(color: color, width: 2) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 5),
            Text(title,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _buildNearbyMess(String name, String details, double rating) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(details,
                  style: TextStyle(fontSize: 14, color: Colors.black54)),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text("$rating",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
                Icon(Icons.star, size: 16, color: Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildZoneButton(String zone) {
  //   bool isSelected = selectedZone == zone;
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         selectedZone = zone;
  //       });
  //     },
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //       decoration: BoxDecoration(
  //         color: isSelected ? Colors.blue : Colors.grey.shade200,
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Text(zone,
  //           style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
  //     ),
  //   );
  // }

  // Widget _buildParkingGrid(String zone) {
  //   List<Map<String, dynamic>> slots = parkingZones[zone] ?? [];
  //   return GridView.builder(
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 4,
  //       childAspectRatio: 1.2,
  //     ),
  //     itemCount: slots.length,
  //     itemBuilder: (context, index) {
  //       Map<String, dynamic> slot = slots[index];
  //       return Container();
  //     },
  //   );
    
    
  // }
  Widget _buildZoneButton(String zone) {
    bool isSelected = selectedZone == zone;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedZone = zone;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(zone,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
      ),
    );
  }

  Widget _buildParkingGrid(String zone) {
    List<Map<String, dynamic>> slots = parkingZones[zone] ?? [];
    return slots.isEmpty
        ? Center(
            child: Text(
              "No Parking Slots Available",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        : GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.2,
            ),
            itemCount: slots.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> slot = slots[index];
              Color borderColor = _getStatusColor(slot["status"]);
              Color bgColor = borderColor.withOpacity(0.1);

              return Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor, width: 2),
                ),
                child: Center(
                  child: Text(
                    slot["label"],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: borderColor),
                  ),
                ),
              );
            },
          );
  }

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
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }

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
