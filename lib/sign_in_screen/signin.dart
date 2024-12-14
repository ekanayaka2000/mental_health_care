import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Authentication
import '../sign_up_screen/signup.dart'; // Import the SignUp page
import '../home_screen/home.dart'; // Import the Home page
import '../sign_in_screen/forget_password.dart'; // Import the Forget Password page

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance

  bool _agreeToTerms = false; // Checkbox state
  bool _isLoading = false; // Loading state for button

  // Function to sign in the user
  Future<void> _signInUser() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Sign in the user with email and password
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Navigate to the Home page if successful
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      // Handle sign-in errors
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Incorrect password.';
      } else {
        message = 'Failed to sign in. Please try again.';
      }

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
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
            // Navigate back to the signup page
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignUpPage()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/Logo1.png', // Replace with your logo path
                    height: 100,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: Column(
                children: [
                  Text("Welcome Back!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Sign in to continue your journey."),
                  SizedBox(height: 24),
                ],
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {
                    // Handle password visibility toggle
                  },
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value!; // Toggle checkbox state
                    });
                  },
                ),
                Text("I agree to MindLink terms & conditions")
              ],
            ),
            GestureDetector(
              onTap: () {
                // Navigate to Forget Password page
                Navigator.push(context, MaterialPageRoute(builder: (_) => ForgetPasswordPage()));
              },
              child: Text("Forget Password?", style: TextStyle(color: Colors.red)),
            ),
            Spacer(),
            Center(child: Text("Or continue with")),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.facebook),
                  onPressed: () {
                    // Handle Facebook sign-in
                  },
                ),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    // Handle Google sign-in
                  },
                  child: Image.asset(
                    'assets/google.png',
                    height: 16,
                    width: 16,
                  ),
                ),
                SizedBox(width: 16),
                IconButton(
                  icon: Icon(Icons.apple),
                  onPressed: () {
                    // Handle Apple sign-in
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00BCD4), // Button color
                foregroundColor: Colors.white, // Text color
              ),
              onPressed: _isLoading
                  ? null
                  : () {
                if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                  _signInUser(); // Attempt to sign in the user
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter your email and password.")),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 16.0),
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("Sign In"),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
