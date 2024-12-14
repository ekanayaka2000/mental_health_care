import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import '../sign_in_screen/otp.dart'; // Import your OTP screen
import '../sign_in_screen/signin.dart'; // Import your SignIn screen

class ForgetPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  // Function to send password reset email
  Future<void> _sendPasswordResetEmail(BuildContext context) async {
    final String email = _emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your email address.")),
      );
      return;
    }

    try {
      // Send password reset email using Firebase Authentication
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      // Navigate to OTP page after sending reset email
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OTPPage(email: email), // Pass email to OTPPage
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password reset email sent to $email")),
      );
    } on FirebaseAuthException catch (e) {
      // Handle Firebase exceptions (e.g. user not found)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    } catch (e) {
      // Handle other errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An unexpected error occurred.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to Sign In page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => SignInPage()),
            );
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
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: "Mental Health Care",
                    style: TextStyle(color: Color(0xFF00BCD4), fontWeight: FontWeight.bold),
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
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                hintText: "Enter your registered email",
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                _sendPasswordResetEmail(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Color(0xFF00BCD4),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
              ),
              child: Text(
                "Send OTP Code",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
