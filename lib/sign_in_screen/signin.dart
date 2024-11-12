import 'package:flutter/material.dart';
import '../sign_up_screen/signup.dart'; // Import the SignUp page
import '../home_screen/home.dart'; // Import the Home page
import '../sign_in_screen/forget_password.dart'; // Import the Forget Password page

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _agreeToTerms = false; // Checkbox state

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
                  // Add your logo widget here
                  Image.asset(
                    'assets/Logo1.png', // Replace with your logo path
                    height: 100,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Spacer(), // Push content towards the center
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
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
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
                Text("I agree to MindLink terms & conditions") // Updated text
              ],
            ),
            GestureDetector(
              onTap: () {
                // Navigate to Forget Password page
                Navigator.push(context, MaterialPageRoute(builder: (_) => ForgetPasswordPage()));
              },
              child: Text("Forget Password?", style: TextStyle(color: Colors.red)),
            ),
            Spacer(), // Push content towards the bottom
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
              onPressed: () {
                // Navigate to Home page
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 16.0),
                child: Text("Sign In"),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
