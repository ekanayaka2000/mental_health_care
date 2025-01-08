import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSettingOption(
              icon: Icons.notifications,
              title: "Notification Setting",
              onTap: () {
                // Navigate to Notification Settings page
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Navigate to Notification Setting")),
                );
              },
            ),
            Divider(),
            _buildSettingOption(
              icon: Icons.vpn_key,
              title: "Password Manager",
              onTap: () {
                // Navigate to Password Manager page
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Navigate to Password Manager")),
                );
              },
            ),
            Divider(),
            _buildSettingOption(
              icon: Icons.person_remove,
              title: "Delete Account",
              onTap: () {
                // Handle account deletion or navigate to confirmation page
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Delete Account tapped")),
                );
              },
            ),
            Divider(),
            _buildDarkModeToggle(),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingOption({
    required IconData icon,
    required String title,
    required void Function() onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildDarkModeToggle() {
    return SwitchListTile(
      title: Text("Dark Mode", style: TextStyle(fontSize: 16)),
      secondary: Icon(Icons.dark_mode, color: Colors.blue),
      value: false, // Replace with actual dark mode state
      onChanged: (bool value) {
        // Handle dark mode toggle
        print("Dark Mode toggled: $value");
      },
    );
  }
}
