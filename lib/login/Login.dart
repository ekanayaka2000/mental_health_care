import 'package:flutter/material.dart';
import '../SignUp/signup.dart'; // Import the Sign Up page
import '../SignIn/signin.dart'; // Import the Sign In page

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50), // Added space for better vertical alignment
            // Logo and Title
            Image.asset(
              'assets/Logo1.png', // Ensure the asset exists
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              "MENTAL HEALTH CARE",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00BCD4),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Let’s Get Started!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Log in to your Account.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            // Facebook Login Button
            _buildSocialButton(
              context,
              label: 'Sign In with Facebook',
              color: const Color(0xFF1877F2),
              asset: 'assets/facebook.png',
              textColor: Colors.white,
              onPressed: () {
                // Handle Facebook login here
              },
            ),
            const SizedBox(height: 15),

            // Google Login Button
            _buildSocialButton(
              context,
              label: 'Sign In with Google',
              color: Colors.white,
              asset: 'assets/google.png',
              textColor: Colors.black,
              borderColor: Colors.black12,
              onPressed: () {
                // Handle Google login here
              },
            ),
            const SizedBox(height: 15),

            // Apple Login Button
            _buildSocialButton(
              context,
              label: 'Sign In with Apple',
              color: Colors.black,
              asset: 'assets/apple.png',
              textColor: Colors.white,
              onPressed: () {
                // Handle Apple login here
              },
            ),
            const SizedBox(height: 30),

            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00BCD4),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),

            // Sign In Button
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
              child: const Text(
                'Sign In',
                style: TextStyle(color: Color(0xFF00BCD4)),
              ),
            ),
            const SizedBox(height: 20),

            // Privacy Policy and Terms of Service
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle Privacy Policy click
                  },
                  child: const Text(
                    'Privacy Policy',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const Text(' · ', style: TextStyle(color: Colors.black54)),
                TextButton(
                  onPressed: () {
                    // Handle Terms of Service click
                  },
                  child: const Text(
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

  // Widget for Social Login Buttons
  Widget _buildSocialButton(
      BuildContext context, {
        required String label,
        required Color color,
        required String asset,
        required Color textColor,
        Color? borderColor,
        required VoidCallback onPressed,
      }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Image.asset(
        asset,
        height: 24,
      ),
      label: Text(
        label,
        style: TextStyle(color: textColor),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: borderColor != null ? BorderSide(color: borderColor) : BorderSide.none,
        ),
      ),
    );
  }
}
