import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: cart.cartItems.isEmpty
          ? Center(child: Text("Your cart is empty"))
          : ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                var item = cart.cartItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.network(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("₹${item.price.toStringAsFixed(2)}"),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => cart.removeFromCart(item),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: cart.cartItems.isNotEmpty
          ? Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Order placed successfully!"), duration: Duration(seconds: 2)),
                  );
                  cart.clearCart();
                },
                child: Text("Place Order (₹${cart.totalPrice.toStringAsFixed(2)})"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: EdgeInsets.all(16)),
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
