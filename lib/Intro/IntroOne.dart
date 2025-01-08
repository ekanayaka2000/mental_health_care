import 'package:flutter/material.dart';
import 'IntroTwo.dart'; // Ensure the correct import for the next screen
import '../login/Login.dart'; // Ensure the correct import for the login screen

class IntroOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top section with a wave and logo
          Expanded(
            flex: 3,
            child: ClipPath(
              clipper: BottomWaveClipper(),
              child: Container(
                color: const Color(0xFF00BCD4),
                child: Center(
                  child: Image.asset(
                    'assets/Logo.png', // Ensure this asset exists in your project
                    height: 150,
                  ),
                ),
              ),
            ),
          ),
          // Bottom section with text and buttons
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Your Personalized Mental Health Companion",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Discover personalized mental health plans tailored just for you. "
                        "Track your mood and explore a world of wellness resources.",
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Skip button
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.lightBlue.withOpacity(0.2),
                          minimumSize: const Size(120, 50),
                        ),
                        child: const Text(
                          'Skip',
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                      ),
                      // Continue button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => IntroTwo()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          minimumSize: const Size(120, 50),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Clipper for wave design
class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width * 0.5, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
