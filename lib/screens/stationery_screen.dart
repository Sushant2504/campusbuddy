import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/stationery_store_model.dart';
import '../widgets/stationery_card.dart';
import '../screens/cart_screen.dart';
import '../provider/cart_provider.dart';

class StationeryScreen extends StatelessWidget {
  final List<StationeryStore> stores = [
    StationeryStore(
      name: "Campus Stationery",
      rating: 4.8,
      location: "Near Library",
      imageUrl: "https://res.cloudinary.com/dtqrzxyef/image/upload/v1738303336/images_14_e5nlgz.jpg",
      topSellingItems: [
        Product(name: "A4 Pages (100)", price: 50, imageUrl: "https://res.cloudinary.com/dtqrzxyef/image/upload/v1738303058/images_13_ldocvl.jpg"),
        Product(name: "Files", price: 30, imageUrl: "https://res.cloudinary.com/dtqrzxyef/image/upload/v1738303144/images_5_um7hug.png"),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Campus Stationery Stores"),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, size: 28),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen())),
              ),
              if (cart.cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(cart.cartItems.length.toString(), style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: stores.length,
        itemBuilder: (context, index) {
          return StationeryCard(store: stores[index]);
        },
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import '../models/stationery_store_model.dart';
// import '../widgets/stationery_card.dart';

// class StationeryScreen extends StatelessWidget {
//   final List<StationeryStore> stores = [
//     StationeryStore(
//       name: "Campus Stationery",
//       rating: 4.8,
//       location: "Near Library",
//       imageUrl: "https://source.unsplash.com/200x200/?stationery,store",
//       email: "campusstore@email.com",
//       whatsappNumber: "+911234567890",
//       priceListUrl: "https://example.com/rates.pdf",
//       topSellingItems: [
//         Product(name: "A4 Pages (100)", price: 50, imageUrl: "https://source.unsplash.com/200x200/?paper"),
//         Product(name: "Files", price: 30, imageUrl: "https://source.unsplash.com/200x200/?file"),
//       ],
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Campus Stationery Stores")),
//       body: ListView.builder(
//         padding: EdgeInsets.all(16),
//         itemCount: stores.length,
//         itemBuilder: (context, index) {
//           return StationeryCard(store: stores[index]);
//         },
//       ),
//     );
//   }
// }

