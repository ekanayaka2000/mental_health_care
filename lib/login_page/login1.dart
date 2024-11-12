import 'package:flutter/material.dart';
import '../sign_up_screen/signup.dart'; // Import the Sign Up page
import '../sign_in_screen/signin.dart'; // Import the Sign In page

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo and Title
            Image.asset(
              'assets/Logo1.png', // Replace with your logo image path
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              "MENTAL HEALTH CARE",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00BCD4),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Let’s get Start!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            ),
            Text(
              "Log in to your Account.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),

            // Facebook Login Button
            ElevatedButton.icon(
              onPressed: () {
                // Handle Facebook login here
              },
              icon: Image.asset(
                'assets/facebook.png', // Replace with your Facebook logo image path
                height: 24,
              ),
              label: Text(
                  'Sign In with Facebook',
                  style: TextStyle(color: Colors.white)
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1877F2),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 15),

            // Google Login Button
            ElevatedButton.icon(
              onPressed: () {
                // Handle Google login here
              },
              icon: Image.asset(
                'assets/google.png', // Replace with your Google logo image path
                height: 24,
              ),
              label: Text(
                'Sign In with Google',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.black12),
                ),
              ),
            ),
            SizedBox(height: 15),

            // Apple Login Button
            ElevatedButton.icon(
              onPressed: () {
                // Handle Apple login here
              },
              icon: Image.asset(
                'assets/apple.png', // Replace with your Apple logo image path
                height: 24,
              ),
              label: Text(
                  'Sign In with Apple',
                  style: TextStyle(color: Colors.white)
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                // Navigate to Sign Up page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00BCD4),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),

            // Sign In Button
            TextButton(
              onPressed: () {
                // Navigate to Sign In page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
              child: Text(
                'Sign In',
                style: TextStyle(color: Color(0xFF00BCD4)),
              ),
            ),
            SizedBox(height: 20),

            // Privacy Policy and Terms of Service
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle Privacy Policy click
                  },
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                Text(' · ', style: TextStyle(color: Colors.black54)),
                TextButton(
                  onPressed: () {
                    // Handle Terms of Service click
                  },
                  child: Text(
                    'Terms Of Service',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
