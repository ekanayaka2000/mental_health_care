import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../Intro/IntroOne.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 8 seconds
    Future.delayed(
      const Duration(seconds: 8),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => IntroOne()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00BCD4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Logo.png', // Ensure this asset exists in your project
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'MENTAL HEALTH CARE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const SpinKitFadingCircle(
              color: Colors.white,
              size: 50.0,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
