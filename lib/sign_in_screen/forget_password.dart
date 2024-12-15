import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../sign_in_screen/otp.dart';
import '../sign_in_screen/signin.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  // Function to send password reset email
  Future<void> _sendPasswordResetEmail() async {
    final String email = _emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your email address.")),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OTPPage(email: email),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password reset email sent to $email")),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An unexpected error occurred.")),
      );
    }
  }

  // Function to update the password in Firestore
  Future<void> _updatePasswordInFirestore(String newPassword) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.updatePassword(newPassword);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({'password': newPassword}); // Store password securely

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password updated successfully.")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => SignInPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User is not authenticated.")),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    } catch (e) {
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
              onPressed: _sendPasswordResetEmail,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Color(0xFF00BCD4),
              ),
              child: Text(
                "Send OTP Code",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
