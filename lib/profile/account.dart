import 'package:flutter/material.dart';
import 'profile.dart';
import 'payment.dart';
import 'settings.dart';
import 'aboutUs.dart'; // Import the aboutUs.dart file
import 'billing.dart'; // Import the billing.dart file for navigation
import '../Login/Login.dart'; // Import the login1.dart file

class AccountPage extends StatelessWidget {
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
                  // Navigate to the BillingPage when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BillingPage()), // Navigate to BillingPage
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text("Guest User"), // Hardcoded name
              subtitle: Text("guest@example.com"), // Hardcoded email
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            Divider(),
            ListView(
              physics: NeverScrollableScrollPhysics(), // Prevents inner scrolling conflict
              shrinkWrap: true, // Makes ListView adapt its height
              children: [
                _buildSettingsTile(context, Icons.payment, "Payment method", PaymentMethodScreen()),
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
                // New About Us section added here
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text("About Us"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUsPage()), // Navigate to About Us page
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
