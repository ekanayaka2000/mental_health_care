import 'package:flutter/material.dart';
import '../sign_in_screen/secure_your_account.dart'; // Import the renamed SecureAccountPage

class OTPPage extends StatefulWidget {
  final String email; // Add email parameter

  OTPPage({required this.email}); // Updated constructor to take email

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  int _counter = 35;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
        _startTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Enter OTP Code",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Check your email inbox for a message from ",
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: "Mental Health Care",
                    style: TextStyle(color: Color(0xFF00BCD4)),
                  ),
                  TextSpan(
                    text: ".",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                );
              }),
            ),
            SizedBox(height: 16),
            if (_counter > 0)
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "You can resend the code in ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "$_counter",
                        style: TextStyle(color: Colors.red),
                      ),
                      TextSpan(
                        text: " seconds.",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            if (_counter == 0)
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _counter = 35;
                      _startTimer();
                    });
                  },
                  child: Text(
                    "Resend code",
                    style: TextStyle(color: Color(0xFF00BCD4)),
                  ),
                ),
              ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SecureAccountPage(),
                  ),
                );
              },
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Color(0xFF00BCD4),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
