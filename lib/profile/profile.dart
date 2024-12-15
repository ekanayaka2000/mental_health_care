import 'package:flutter/material.dart';
import 'package:mental_health_care/home_screen/home.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
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
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.purple[100],
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15,
                      child: Icon(Icons.edit, size: 15),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildTextField("Full Name"),
            _buildTextField("Phone Number"),
            _buildTextField("Email"),
            _buildTextField("Date Of Birth"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );// Handle profile update
              },
              child: Text("Update Profile" , style: TextStyle(fontSize: 16,color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00BCD4), // Replaces primary
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}