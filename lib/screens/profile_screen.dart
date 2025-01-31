import 'package:flutter/material.dart';

// User Profile Model
class UserProfile {
  final String name;
  final String course;
  final String id;
  final String email;
  final String phone;
  final String hostel;
  final String address;
  final int printOrders;
  final int parkingBookings;
  final int balance;
  final List<Map<String, String>> recentActivity;

  UserProfile({
    required this.name,
    required this.course,
    required this.id,
    required this.email,
    required this.phone,
    required this.hostel,
    required this.address,
    required this.printOrders,
    required this.parkingBookings,
    required this.balance,
    required this.recentActivity,
  });
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;

  // Example user profile data
  UserProfile user = UserProfile(
    name: "Prasanna Patil",
    course: "Computer Science • Year 2",
    id: "CS20220001",
    email: "john.doe@college.edu",
    phone: "+91 98765 43210",
    hostel: "Block A - Room 304",
    address: "123, ABC Road, Pune, India",
    printOrders: 12,
    parkingBookings: 5,
    balance: 250,
    recentActivity: [
      {"title": "Print Order #123", "subtitle": "Today, 10:30 AM", "icon": "print"},
      {"title": "Parking Slot A4 Booked", "subtitle": "Yesterday, 2:15 PM", "icon": "local_parking"},
      {"title": "Subscription Renewed", "subtitle": "2 days ago", "icon": "subscriptions"},
      {"title": "Payment Successful - ₹100", "subtitle": "Last Week", "icon": "payment"},
    ],
  );
  // Payment Tile Widget
Widget _buildPaymentTile(IconData icon, String title, Color cardColor, Color textColor) {
  return ListTile(
    leading: Icon(icon, color: Colors.green),
    title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: textColor.withOpacity(0.7)),
    tileColor: cardColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    onTap: () {
      // Navigate to payment screen
    },
  );
}

// Settings Tile Widget
Widget _buildSettingsTile(IconData icon, String title, Color cardColor, Color textColor, {bool isLogout = false}) {
  return ListTile(
    leading: Icon(icon, color: isLogout ? Colors.red : Colors.grey),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: isLogout ? Colors.red : textColor,
      ),
    ),
    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: textColor.withOpacity(0.7)),
    tileColor: cardColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    onTap: () {
      if (isLogout) {
        // Handle logout action
      }
    },
  );
}


  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isDarkMode ? Colors.black : Colors.white;
    Color textColor = isDarkMode ? Colors.white : Colors.black;
    Color cardColor = isDarkMode ? Colors.grey[900]! : Colors.white;
    Color profileHeaderColor = isDarkMode ? Colors.grey[850]! : Color(0xFF3A77FA);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: profileHeaderColor,
        elevation: 0,
        title: Text("Profile", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(icon: Icon(Icons.notifications, color: Colors.white), onPressed: () {}),
          Switch(
            value: isDarkMode,
            activeColor: Colors.white,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            _buildProfileHeader(profileHeaderColor, textColor),

            SizedBox(height: 20),

            // Personal Information Section
            _buildSectionTitle("Personal Information", textColor),
            _buildInfoTile(Icons.email, "Email", user.email, cardColor, textColor),
            _buildInfoTile(Icons.phone, "Phone", user.phone, cardColor, textColor),
            _buildInfoTile(Icons.location_city, "Hostel", user.hostel, cardColor, textColor),
            _buildInfoTile(Icons.home, "Address", user.address, cardColor, textColor),

            SizedBox(height: 20),

            // Recent Activity Section
            _buildSectionTitle("Recent Activity", textColor),
            ...user.recentActivity.map((activity) => _buildActivityTile(activity, cardColor, textColor)).toList(),

            SizedBox(height: 20),

            // Payment Options & Subscription
            _buildSectionTitle("Payment & Subscriptions", textColor),
            _buildPaymentTile(Icons.credit_card, "Manage Payment Methods", cardColor, textColor),
            _buildPaymentTile(Icons.subscriptions, "Subscription Details", cardColor, textColor),

            SizedBox(height: 20),

            // Settings and Logout
            _buildSectionTitle("Settings", textColor),
            _buildSettingsTile(Icons.settings, "App Settings", cardColor, textColor),
            _buildSettingsTile(Icons.privacy_tip, "Privacy & Security", cardColor, textColor),
            _buildSettingsTile(Icons.help, "Help & Support", cardColor, textColor),
            _buildSettingsTile(Icons.logout, "Logout", cardColor, textColor, isLogout: true),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(Color backgroundColor, Color textColor) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/avatar.png'),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor)),
                  Text(user.course, style: TextStyle(fontSize: 14, color: textColor.withOpacity(0.7))),
                  Text("ID: ${user.id}", style: TextStyle(fontSize: 14, color: textColor.withOpacity(0.7))),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildProfileStat("${user.printOrders}", "Print Orders", textColor),
              _buildProfileStat("${user.parkingBookings}", "Parking Bookings", textColor),
              _buildProfileStat("₹${user.balance}", "Balance", textColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStat(String value, String label, Color textColor) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor)),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14, color: textColor.withOpacity(0.7))),
      ],
    );
  }

  Widget _buildSectionTitle(String title, Color textColor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String value, Color cardColor, Color textColor) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: TextStyle(fontSize: 14, color: textColor.withOpacity(0.7))),
      subtitle: Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
      tileColor: cardColor,
    );
  }

  Widget _buildActivityTile(Map<String, String> activity, Color cardColor, Color textColor) {
    IconData icon = Icons.event;
    if (activity["icon"] == "print") icon = Icons.print;
    else if (activity["icon"] == "local_parking") icon = Icons.local_parking;
    else if (activity["icon"] == "subscriptions") icon = Icons.subscriptions;
    else if (activity["icon"] == "payment") icon = Icons.payment;

    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(activity["title"]!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
      subtitle: Text(activity["subtitle"]!, style: TextStyle(fontSize: 14, color: textColor.withOpacity(0.7))),
      tileColor: cardColor,
    );
  }
}
