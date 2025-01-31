// import 'package:flutter/material.dart';

// class CanteenScreen extends StatefulWidget {
//   @override
//   _CanteenScreenState createState() => _CanteenScreenState();
// }

// class _CanteenScreenState extends State<CanteenScreen> {
//   String selectedCategory = "All";

//   final List<Map<String, dynamic>> canteens = [
//   {
//     "name": "Maheshwari Mess",
//     "rating": 3.3,
//     "type": "Pure Veg",
//     "time": "Today 01:24 am",
//     "items": "Bhindi, Rajma...",
//     "note": "Please notify before coming",
//     "lat": 18.516726,  // Example latitude
//     "lng": 73.856255,  // Example longitude
//   },
//   {
//     "name": "VCCAS Canteen",
//     "rating": 4.2,
//     "type": "Pure Veg",
//     "time": "Today 02:00 am",
//     "items": "Paneer, Dal Tadka...",
//     "note": "Limited availability",
//     "lat": 18.522400,
//     "lng": 73.855000,
//   },


//     {
//       "name": "Amantran Mess",
//       "rating": 4.9,
//       "type": "Pure Veg",
//       "time": "Today 02:00 am",
//       "items": "Paneer, Dal Tadka...",
//       "note": "Limited availability",
//     },
//     {
//       "name": "Kakuchi Mess",
//       "rating": 4.1,
//       "type": "Pure Veg",
//       "time": "Today 02:00 am",
//       "items": "Paneer, Dal Tadka...",
//       "note": "Limited availability",
//     },
//     {
//       "name": "BOYS Mess",
//       "rating": 5.0,
//       "type": "Veg/Non-Veg",
//       "time": "Today 02:00 am",
//       "items": "Paneer, Dal Tadka...",
//       "note": "Limited availability",
//     },
//   ];

//   List<Map<String, dynamic>> getFilteredCanteens() {
//     if (selectedCategory == "All") {
//       return canteens;
//     } else {
//       return canteens.where((canteen) => canteen["type"] == selectedCategory).toList();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Find your perfect meal in campus!",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//             ),
//             CircleAvatar(
//               backgroundColor: Colors.orange.shade100,
//               child: Icon(Icons.person, color: Color(0xFF283891)),
//             )
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Search Bar
//             TextField(
//               decoration: InputDecoration(
//                 hintText: "Dekhte, Aaj Mess mai Kya Hai?",
//                 prefixIcon: Icon(Icons.search, color: Color(0xFF283891)),
//                 filled: true,
//                 fillColor: Colors.grey.shade100,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//             SizedBox(height: 16),

//             // Category Filters
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildCategoryChip("All"),
//                 _buildCategoryChip("Pure Veg"),
//                 _buildCategoryChip("Veg/Non-Veg"),
//               ],
//             ),
//             SizedBox(height: 16),

//             // Canteen List
//             Expanded(
//               child: getFilteredCanteens().isEmpty
//                   ? Center(
//                       child: Text(
//                         "No Canteens Available",
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
//                       ),
//                     )
//                   : ListView.builder(
//                       itemCount: getFilteredCanteens().length,
//                       itemBuilder: (context, index) {
//                         return _buildCanteenCard(getFilteredCanteens()[index], width);
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCategoryChip(String category) {
//     return ChoiceChip(
//       label: Text(category, style: TextStyle(color: selectedCategory == category ? Colors.white : Colors.black)),
//       selected: selectedCategory == category,
//       selectedColor: Color(0xFF283891),
//       backgroundColor: Colors.grey.shade200,
//       onSelected: (bool selected) {
//         setState(() {
//           selectedCategory = category;
//         });
//       },
//     );
//   }

//   Widget _buildCanteenCard(Map<String, dynamic> canteen, double width) {
//     return Card(
//       margin: EdgeInsets.only(bottom: 12),
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Padding(
//         padding: EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header Row with Status and Location Icon
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Chip(
//                   label: Text("Open", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
//                   backgroundColor: Colors.green.shade100,
//                 ),
//                 Icon(Icons.location_on, color: Color(0xFF283891)),
//               ],
//             ),
//             SizedBox(height: 5),

//             // Canteen Name
//             Text(
//               canteen["name"],
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),

//             // Rating & Type
//             Row(
//               children: [
//                 Icon(Icons.star, color: Colors.amber, size: 18),
//                 Text(" ${canteen["rating"]}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//                 SizedBox(width: 10),
//                 Text(
//                   "${canteen["type"]} • ${canteen["time"]}",
//                   style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//             SizedBox(height: 5),

//             // Items Available
//             Text(
//               "Lunch: ${canteen["items"]}",
//               style: TextStyle(fontWeight: FontWeight.w500),
//             ),
//             SizedBox(height: 5),

//             // Additional Note
//             Row(
//               children: [
//                 Icon(Icons.info_outline, color: Colors.red, size: 16),
//                 SizedBox(width: 5),
//                 Expanded(
//                   child: Text(
//                     canteen["note"],
//                     style: TextStyle(fontSize: 12, color: Colors.red.shade700, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),

//             // Action Button
//             Align(
//               alignment: Alignment.centerRight,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF283891),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                 ),
//                 onPressed: () {},
//                 child: Text("View Details", style: TextStyle(color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/canteen_model.dart';
import '../services/location_service.dart';
import '../widgets/canteen_card.dart';
import '../widgets/category_chip.dart';

class CanteenScreen extends StatefulWidget {
  @override
  _CanteenScreenState createState() => _CanteenScreenState();
}

class _CanteenScreenState extends State<CanteenScreen> {
  String selectedCategory = "All";
  Position? _currentPosition;

  final List<Canteen> canteens = [
  Canteen(
    name: "Maheshwari Mess",
    rating: 3.3,
    type: "Pure Veg",
    time: "Today 01:24 am",
    items: "Bhindi, Rajma...",
    note: "Please notify before coming",
    lat: 18.516726,
    lng: 73.856255,
    imageUrl: "https://res.cloudinary.com/dtqrzxyef/image/upload/v1738296561/images_11_xuaoel.jpg",
  ),
  Canteen(
    name: "VCCAS Canteen",
    rating: 4.2,
    type: "Pure Veg",
    time: "Today 02:00 am",
    items: "Paneer, Dal Tadka...",
    note: "Limited availability",
    lat: 18.522400,
    lng: 73.855000,
    imageUrl: "https://res.cloudinary.com/dtqrzxyef/image/upload/v1738296560/images_9_rpoag1.jpg",
  ),
  Canteen(
    name: "Amantran Mess",
    rating: 4.9,
    type: "Pure Veg",
    time: "Today 02:00 am",
    items: "Paneer, Dal Tadka...",
    note: "Limited availability",
    lat: 18.5204,
    lng: 73.8567,
    imageUrl: "https://res.cloudinary.com/dtqrzxyef/image/upload/v1738296560/images_12_pjungp.jpg",
  ),
  Canteen(
    name: "BOYS Mess",
    rating: 5.0,
    type: "Veg/Non-Veg",
    time: "Today 02:00 am",
    items: "Paneer, Dal Tadka...",
    note: "Limited availability",
    lat: 18.5184,
    lng: 73.8590,
    imageUrl: "https://res.cloudinary.com/dtqrzxyef/image/upload/v1738296560/images_9_rpoag1.jpg",
  ),
];


  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    Position? position = await LocationService.getCurrentLocation();
    setState(() {
      _currentPosition = position;
    });
  }

  List<Canteen> getFilteredCanteens() {
    List<Canteen> filtered = canteens.where((canteen) => 
      selectedCategory == "All" || canteen.type == selectedCategory).toList();

    if (_currentPosition != null) {
      filtered.sort((a, b) {
        double distanceA = Geolocator.distanceBetween(
            _currentPosition!.latitude, _currentPosition!.longitude, a.lat, a.lng);
        double distanceB = Geolocator.distanceBetween(
            _currentPosition!.latitude, _currentPosition!.longitude, b.lat, b.lng);
        return distanceA.compareTo(distanceB);
      });
    }
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Find your perfect meal on campus!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.orange.shade100,
            child: Icon(Icons.person, color: Color(0xFF283891)),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Dekhte, Aaj Mess mai Kya Hai?",
                prefixIcon: Icon(Icons.search, color: Color(0xFF283891)),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),

            // 🔹 Category Filters
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryChip(
                    category: "All",
                    selectedCategory: selectedCategory,
                    onSelected: (val) => setState(() => selectedCategory = val)),
                CategoryChip(
                    category: "Pure Veg",
                    selectedCategory: selectedCategory,
                    onSelected: (val) => setState(() => selectedCategory = val)),
                CategoryChip(
                    category: "Veg/Non-Veg",
                    selectedCategory: selectedCategory,
                    onSelected: (val) => setState(() => selectedCategory = val)),
              ],
            ),
            SizedBox(height: 16),

            // 📌 Canteen List
            Expanded(
              child: getFilteredCanteens().isEmpty
                  ? Center(
                      child: Text(
                        "No Canteens Available",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: getFilteredCanteens().length,
                      itemBuilder: (context, index) {
                        return CanteenCard(
                          canteen: getFilteredCanteens()[index],
                          currentPosition: _currentPosition,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
