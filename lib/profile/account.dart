import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile.dart';
import 'payment.dart';
import 'billing.dart';
import 'appearance.dart';
import 'settings.dart';
import '../login_page/login1.dart'; // Import the login1.dart file

class AccountPage extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<Map<String, String>> _fetchUserData() async {
    final user = _auth.currentUser;
    if (user == null) {
      return {'name': 'Guest', 'email': 'guest@example.com'};
    }

    final doc = await _firestore.collection('users').doc(user.uid).get();
    if (doc.exists) {
      final data = doc.data();
      return {
        'name': data?['fullName'] ?? 'No Name',
        'email': data?['email'] ?? user.email ?? 'No Email',
      };
    }

    return {'name': 'No Name', 'email': user.email ?? 'No Email'};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(12),
              child: ListTile(
                leading: Icon(Icons.upgrade),
                title: Text("Upgrade Your Plan Now!"),
                subtitle: Text("Enjoy all the benefits and explore the possibilities."),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // Navigate to the PaymentPage when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BillingPage()),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder<Map<String, String>>(
              future: _fetchUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error loading user data");
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Text("No user data available");
                }

                final userData = snapshot.data!;
                return ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text(userData['name']!),
                  subtitle: Text(userData['email']!),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                );
              },
            ),
            Divider(),
            ListView(
              physics: NeverScrollableScrollPhysics(), // Prevents inner scrolling conflict
              shrinkWrap: true, // Makes ListView adapt its height
              children: [
                _buildSettingsTile(context, Icons.payment, "Payment method", PaymentMethodScreen()),
                _buildSettingsTile(context, Icons.subscriptions, "Billing & subscription", BillingPage()),
                _buildSettingsTile(context, Icons.palette, "App appearance", AppearancePage()),
                _buildSettingsTile(context, Icons.group, "Invite your friends", null), // Placeholder for invite feature
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    );
                  },
                ),
              ],
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Log out", style: TextStyle(color: Colors.red)),
              onTap: () {
                // Handle log out and navigate to login1.dart page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to login1.dart page
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildSettingsTile(BuildContext context, IconData icon, String title, Widget? destinationPage) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        if (destinationPage != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationPage),
          );
        }
      },
    );
  }
}
