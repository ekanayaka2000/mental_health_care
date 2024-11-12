import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSettingOption(Icons.notifications, "Notification Setting"),
            _buildSettingOption(Icons.vpn_key, "Password Manager"),
            _buildSettingOption(Icons.person_remove, "Delete Account"),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingOption(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        // Handle setting option tap
      },
    );
  }
}
