import 'package:flutter/material.dart';
import '../models/canteen_model.dart';
import 'package:geolocator/geolocator.dart';

class CanteenCard extends StatelessWidget {
  final Canteen canteen;
  final Position? currentPosition;

  CanteenCard({required this.canteen, required this.currentPosition});

  @override
  Widget build(BuildContext context) {
    double distanceInKm = currentPosition == null
        ? 0
        : Geolocator.distanceBetween(
            currentPosition!.latitude,
            currentPosition!.longitude,
            canteen.lat,
            canteen.lng,
          ) / 1000; // Convert meters to km

    // ✅ Use default image if `imageUrl` is null or empty
    String imageUrl = (canteen.imageUrl.isNotEmpty)
        ? canteen.imageUrl
        : "https://res.cloudinary.com/dtqrzxyef/image/upload/v1738296561/images_11_xuaoel.jpg"; // Default placeholder image

    return Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // ✅ Adds horizontal spacing
          elevation: 5, // ✅ Increased shadow for better depth
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 📌 Full-Width Image at the Top
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                child: Image.network(
                  imageUrl,
                  width: double.infinity, // ✅ Full width
                  height: 160, // ✅ Increased height for better visuals
                  fit: BoxFit.cover, // ✅ Ensures proper image fitting
                ),
              ),

              Padding(
                padding: EdgeInsets.all(14), // ✅ Increased padding for better spacing
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 Status & Distance
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Chip(
                          label: Text(
                            "Open",
                            style: TextStyle(
                                color: Colors.green, fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.green.shade100,
                        ),
                        Text(
                          "${distanceInKm.toStringAsFixed(1)} km away",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 8), // ✅ Increased spacing for better separation

                    // 🔹 Canteen Name
                    Text(
                      canteen.name,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold), // ✅ Larger font
                    ),
                    SizedBox(height: 4),

                    // 🔹 Rating & Type
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Text(" ${canteen.rating}",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Text(
                          "${canteen.type} • ${canteen.time}",
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),

                    // 🔹 Items Available
                    Text(
                      "Lunch: ${canteen.items}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black87),
                    ),
                    SizedBox(height: 12), // ✅ More spacing for better alignment

                    // 🔹 View Details Button (Centered)
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF283891),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {},
                        child: Text("View Details",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12), // ✅ Increased space between cards for better UI
      ],
    );
  }
}
