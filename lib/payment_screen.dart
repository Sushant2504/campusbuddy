import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selectedPayment; // Stores the selected payment method

  final List<Map<String, dynamic>> paymentOptions = [
    {
      "category": "UPI",
      "options": [
        {"name": "Paytm UPI", "icon": "assets/paytm.png", "upi": "paytm://upi/pay"},
        {"name": "PhonePe", "icon": "assets/phonepe.png", "upi": "phonepe://upi/pay"},
        {"name": "GPay", "icon": "assets/google.png", "upi": "tez://upi/pay"},
      ]
    },
    {
      "category": "Cards",
      "options": [
        {"name": "************2575", "icon": "assets/mastercard.png"}
      ]
    },
    {
      "category": "Cash",
      "options": [
        {"name": "Cash", "icon": "assets/cash.png"}
      ]
    }
  ];

  // Method to launch payment app
  Future<void> _processPayment() async {
    final selectedOption = paymentOptions.expand((e) => e["options"]).firstWhere(
          (option) => option["name"] == _selectedPayment,
          orElse: () => {},
        );

    if (selectedOption.containsKey("upi")) {
      final Uri _upiUrl = Uri.parse(selectedOption["upi"]);
      if (await canLaunchUrl(_upiUrl)) {
        await launchUrl(_upiUrl);
      } else {
        _showErrorDialog("Payment app not installed.");
      }
    } else if (_selectedPayment == "************2575") {
      _showSuccessDialog("Processing card payment...");
    } else if (_selectedPayment == "Cash") {
      _showSuccessDialog("Please pay with cash on delivery.");
    }
  }

  // Show Success Dialog
  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Payment Success"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Close Payment Screen
              },
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }

  // Show Error Dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Payment Option",
          style: TextStyle(color: Colors.black, fontSize: width * 0.05, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: paymentOptions.length,
                itemBuilder: (context, categoryIndex) {
                  final category = paymentOptions[categoryIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.02),
                      Text(
                        category["category"],
                        style: TextStyle(fontSize: width * 0.045, fontWeight: FontWeight.bold),
                      ),
                      ...category["options"].map<Widget>((option) {
                        return ListTile(
                          leading: Radio<String>(
                            value: option["name"],
                            groupValue: _selectedPayment,
                            onChanged: (value) {
                              setState(() {
                                _selectedPayment = value;
                              });
                            },
                          ),
                          title: Text(option["name"], style: TextStyle(fontSize: width * 0.04)),
                          trailing: Image.asset(option["icon"], width: 30, height: 30),
                        );
                      }).toList(),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: height * 0.03),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedPayment != null ? Color(0xFF3A77FA) : Colors.grey.shade400,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.3),
              ),
              onPressed: _selectedPayment != null ? _processPayment : null,
              child: Text(
                "Proceed",
                style: TextStyle(fontSize: width * 0.045, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: height * 0.05),
          ],
        ),
      ),
    );
  }
}
