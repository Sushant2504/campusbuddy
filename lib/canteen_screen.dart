// import 'package:flutter/material.dart';

// class CanteenScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Canteen")),
//       body: Center(
//         child: Text("Canteen Section", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CanteenScreen extends StatefulWidget {
  @override
  _CanteenScreenState createState() => _CanteenScreenState();
}

class _CanteenScreenState extends State<CanteenScreen> {
  String selectedCategory = "All";
  
  final List<Map<String, dynamic>> canteens = [
    {
      "name": " Maheshwari Mess",
      "rating": 3.3,
      "type": "Pure Veg",
      "time": "Today 01:24 am",
      "items": "Bhindi, Rajma...",
      "note": "Please notify before coming",
    },
    {
      "name": " VCCAS Canteen",
      "rating": 4.2,
      "type": "Pure Veg",
      "time": "Today 02:00 am",
      "items": "Paneer, Dal Tadka...",
      "note": "Limited availability",
    },
     {
      "name": " Amantran Mess",
      "rating": 4.9,
      "type": "Pure Veg",
      "time": "Today 02:00 am",
      "items": "Paneer, Dal Tadka...",
      "note": "Limited availability",
    },
      {
      "name": " Kakuchi Mess",
      "rating": 4.1,
      "type": "Pure Veg",
      "time": "Today 02:00 am",
      "items": "Paneer, Dal Tadka...",
      "note": "Limited availability",
    },
     {
      "name": " BOYS Mess",
      "rating": 5.0 ,
      "type": "Veg/non-veg",
      "time": "Today 02:00 am",
      "items": "Paneer, Dal Tadka...",
      "note": "Limited availability",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Find your perfect meal in campus!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            CircleAvatar(
              backgroundColor: Colors.orange.shade100,
              child: Icon(Icons.person, color: Color(0xFF283891)),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Dekhte, Aaj Mess mai Kya Hai?",
                prefixIcon: Icon(Icons.search, color: Color(0xFF283891)),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 16),
            // Category Filters
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryChip("All"),
                _buildCategoryChip("Pure Veg"),
                _buildCategoryChip("Non Veg"),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: canteens.length,
                itemBuilder: (context, index) {
                  return _buildCanteenCard(canteens[index], width);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    return ChoiceChip(
      label: Text(category),
      selected: selectedCategory == category,
      selectedColor: Color(0xFF283891),
      onSelected: (bool selected) {
        setState(() {
          selectedCategory = category;
        });
      },
    );
  }

  Widget _buildCanteenCard(Map<String, dynamic> canteen, double width) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(label: Text("Open", style: TextStyle(color: Colors.green))),
                Icon(Icons.location_pin, color: Color(0xFF283891)),
              ],
            ),
            SizedBox(height: 5),
            Text(
              canteen["name"],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Color(0xFF283891), size: 18),
                Text(" ${canteen["rating"]}", style: TextStyle(fontSize: 14)),
                SizedBox(width: 10),
                Text("${canteen["type"]} • ${canteen["time"]}", style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
            SizedBox(height: 5),
            Text("Lunch: ${canteen["items"]}", style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 5),
            Text("Note: ${canteen["note"]}", style: TextStyle(fontSize: 12, color: Colors.grey)),
            // SizedBox(height: 10),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF283891)),
            //     onPressed: () {},
            //     child: Text("Update Menu", style: TextStyle(color: Colors.white)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}