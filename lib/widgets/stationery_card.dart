import 'package:flutter/material.dart';
import '../models/stationery_store_model.dart';
import '../widgets/product_card.dart';

class StationeryCard extends StatelessWidget {
  final StationeryStore store;

  StationeryCard({required this.store});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Better spacing
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      shadowColor: Colors.grey.withOpacity(0.2), // Subtle shadow
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 📌 Store Image with Gradient Overlay
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                child: Image.network(
                  store.imageUrl,
                  width: double.infinity,
                  height: 170, // Larger Image
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 170, // Same height as image
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(0.6)],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 16,
                child: Text(
                  store.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 3, color: Colors.black54)],
                  ),
                ),
              ),
            ],
          ),

          // 📌 Store Info
          Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  store.location,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    Text(" ${store.rating}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 14),

                // 🔹 Top Selling Items Section
                Text("Top Selling Items", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                SizedBox(
                  height: 170, // Larger for better UI
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: store.topSellingItems.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: store.topSellingItems[index]);
                    },
                  ),
                ),

                SizedBox(height: 12), // Extra spacing
                // 🔹 Visit Store Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3A77FA),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    elevation: 4,
                  ),
                  child: Center(
                    child: Text(
                      "Visit Store",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
