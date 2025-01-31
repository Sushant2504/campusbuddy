// import 'package:flutter/material.dart';

// class ParkingScreen extends StatefulWidget {
//   @override
//   _ParkingScreenState createState() => _ParkingScreenState();
// }

// class _ParkingScreenState extends State<ParkingScreen> {
//   String selectedVehicle = "";
//   bool isDarkMode = false;

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
    
//     Color backgroundColor = isDarkMode ? Colors.black : Colors.blue.shade50;
//     Color textColor = isDarkMode ? Colors.white : Colors.black;
//     Color cardColor = isDarkMode ? Colors.grey[900]! : Colors.white;

//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: backgroundColor,
//         elevation: 0,
//         title: Text("Parking", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor)),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.menu, color: textColor),
//           onPressed: () {},
//         ),
//         actions: [
//           Switch(
//             value: isDarkMode,
//             activeColor: Colors.white,
//             onChanged: (value) {
//               setState(() {
//                 isDarkMode = value;
//               });
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Hi, find the best parking spots", style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.7))),
//             SizedBox(height: 10),

//             // Search bar
//             TextField(
//               decoration: InputDecoration(
//                 hintText: "Search parking slots...",
//                 prefixIcon: Icon(Icons.search, color: Colors.grey),
//                 filled: true,
//                 fillColor: cardColor,
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
//               ),
//             ),
            
//             SizedBox(height: 16),

//             // Parking Map Preview with Zoom
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade300,
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: InteractiveViewer(
//                     panEnabled: true,
//                     boundaryMargin: EdgeInsets.all(20),
//                     minScale: 1,
//                     maxScale: 4,
//                     child: Image.asset(
//                       "assets/parking_map.png", // Replace with your actual asset
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
            
//             SizedBox(height: 20),

//             // Parking Slot Availability
//             _buildParkingAvailability(),

//             SizedBox(height: 20),

//             // Building Selection Buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: ["C", "B", "D", "E", "A"].map((label) => _buildBuildingButton(context, label)).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildParkingAvailability() {
//     return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _buildParkingItem("Available", 12, Colors.green),
//           _buildParkingItem("Occupied", 45, Colors.red),
//           _buildParkingItem("Reserved", 3, Colors.blue),
//         ],
//       ),
//     );
//   }

//   Widget _buildParkingItem(String label, int count, Color color) {
//     return Column(
//       children: [
//         Text(count.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
//         SizedBox(height: 5),
//         Text(label, style: TextStyle(fontSize: 14, color: Colors.black54)),
//       ],
//     );
//   }

//   Widget _buildBuildingButton(BuildContext context, String label) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           PageRouteBuilder(
//             transitionDuration: Duration(milliseconds: 500),
//             pageBuilder: (_, __, ___) => BuildingScreen(buildingName: label),
//             transitionsBuilder: (_, animation, __, child) {
//               return SlideTransition(
//                 position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(animation),
//                 child: child,
//               );
//             },
//           ),
//         );
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         decoration: BoxDecoration(
//           color: Colors.blue.shade800,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
//         ),
//         child: Text(label, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }

// // Screen to display when navigating from buttons
// class BuildingScreen extends StatelessWidget {
//   final String buildingName;
  
//   const BuildingScreen({Key? key, required this.buildingName}) : super(key: key);
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade800,
//         title: Text("Building $buildingName", style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.local_parking, size: 100, color: Colors.blue.shade800),
//             SizedBox(height: 20),
//             Text(
//               "You have navigated to Building $buildingName!",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "View the available parking spots.",
//               style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue.shade800,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text("Go Back", style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'parking_zone_screen.dart'; // Import the Parking Zone Screen

class ParkingScreen extends StatefulWidget {
  @override
  _ParkingScreenState createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        elevation: 0,
        title: Text("Parking", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, find the best parking spots", style: TextStyle(fontSize: 16, color: Colors.black54)),
            SizedBox(height: 10),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search parking slots...",
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              ),
            ),

            SizedBox(height: 16),

            // Parking Map Image (Dummy)
            Expanded(
              child: InteractiveViewer(
                panEnabled: true,
                boundaryMargin: EdgeInsets.all(20),
                minScale: 1,
                maxScale: 4,
                child: Image.asset(
                  "assets/parking_map.png", // Replace with your asset
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 20),

            // Buttons to Direct to Parking Zone Screen
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildParkingZoneButton(context, "C"),
                _buildParkingZoneButton(context, "B"),
                _buildParkingZoneButton(context, "D"),
                _buildParkingZoneButton(context, "E"),
                // _buildParkingZoneButton(context, "A"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget: Navigate to ParkingZoneScreen
  Widget _buildParkingZoneButton(BuildContext context, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ParkingZoneScreen()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.blue.shade800,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
        ),
        child: Text(
          "Zone $label",
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
