import 'package:flutter/material.dart';
import '../sign_in_screen/otp.dart'; // Import your OTP screen
import '../sign_in_screen/signin.dart'; // Import your SignIn screen

class ForgetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to Sign In page
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignInPage()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Forget Password?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 24),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Enter your email address to your ",
                style: TextStyle(color: Colors.black), // Default text color
                children: [
                  TextSpan(
                    text: "Mental Health Care",
                    style: TextStyle(color: Color(0xFF00BCD4),fontWeight: FontWeight.bold), // Custom color for "Mental Health Care"
                  ),
                  TextSpan(
                    text: " account. We will send you a one-time password to reset your password.",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Registered Email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            Spacer(), // Push button to bottom
            ElevatedButton(
              onPressed: () {
                // Navigate to OTP page
                Navigator.push(context, MaterialPageRoute(builder: (_) => OTPPage()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Make button full width
                backgroundColor: Color(0xFF00BCD4), // Button color
              ),
              child: Text(
                "Send OTP Code",
                style: TextStyle(color: Colors.white), // Text color
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
