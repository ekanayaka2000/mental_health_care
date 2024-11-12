import 'package:flutter/material.dart';
import 'password_update_confirm.dart'; // Make sure to import the confirmation page

class SecureAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Secure your Account",
                style: TextStyle(
                  color: Colors.black, // Custom color for title
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 24),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black), // Default color for the text
                children: [
                  TextSpan(text: "Enter your new password for your "),
                  TextSpan(
                    text: "Mental Health Care", // This part will be colored
                    style: TextStyle(color: Color(0xFF00BCD4),fontWeight: FontWeight.bold), // Apply custom color
                  ),
                  TextSpan(text: " account. We will help you secure your account."),
                ],
              ),
            ),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "New Password",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            _buildPasswordInputField('New Password', newPasswordController),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Confirm New Password",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            _buildPasswordInputField('Confirm New Password', confirmPasswordController),
            Spacer(), // Pushes the button to the bottom
            ElevatedButton(
              onPressed: () {
                // Assuming validation is successful, navigate to confirmation page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasswordUpdateConfirmationPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Make button full width
                backgroundColor: Color(0xFF00BCD4), // Custom color for button
              ),
              child: Text(
                "Save Password",
                style: TextStyle(color: Colors.white), // White text color for the button
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordInputField(String labelText, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
        hintText: 'Enter your $labelText',
      ),
    );
  }
}
