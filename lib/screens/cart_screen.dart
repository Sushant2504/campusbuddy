import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import 'payment_screen.dart';  // ✅ Import PaymentScreen

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Cart",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3A77FA), Color(0xFF0052D4)], // Blue Gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: cart.cartItems.isEmpty
          ? Center(
              child: Text(
                "Your cart is empty",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                var item = cart.cartItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(item.imageUrl, width: 60, height: 60, fit: BoxFit.cover),
                    ),
                    title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    subtitle: Text(
                      "₹${item.price.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red, size: 28),
                      onPressed: () => cart.removeFromCart(item),
                    ),
                  ),
                );
              },
            ),

      // 🔹 Bottom Navigation Bar - Redirect to PaymentScreen
      bottomNavigationBar: cart.cartItems.isNotEmpty
          ? Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()), // ✅ Navigate to PaymentScreen
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3A77FA), // Match AppBar Blue
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  elevation: 5,
                ),
                child: Text(
                  "Proceed to Payment (₹${cart.totalPrice.toStringAsFixed(2)})",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
