import 'package:flutter/material.dart';
import 'secure_your_account.dart'; // Import the SecureAccountPage

class OTPPage extends StatefulWidget {
  final String email; // Email passed from ForgetPasswordPage

  OTPPage({required this.email}); // Updated constructor to take email

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  int _counter = 35;
  List<TextEditingController> _otpControllers =
  List.generate(4, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    // Dispose controllers to free memory
    _otpControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _startTimer() {
    if (_counter > 0) {
      Future.delayed(Duration(seconds: 1), () {
        if (mounted && _counter > 0) {
          setState(() {
            _counter--;
          });
          _startTimer();
        }
      });
    }
  }

  String _getEnteredOTP() {
    // Concatenate OTP digits entered by the user
    return _otpControllers.map((controller) => controller.text).join();
  }

  void _resendOTP() {
    setState(() {
      _counter = 35;
      _startTimer();
    });
    // Display a message indicating the OTP was resent
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("A new OTP has been sent to ${widget.email}")),
    );
  }

  void _validateOTP() {
    final String otp = _getEnteredOTP();
    if (otp.length < 4 || otp.contains('')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid 4-digit OTP.")),
      );
    } else {
      // Navigate to SecureAccountPage
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("OTP Verified, continuing...")),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SecureAccountPage()),
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
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                "Enter OTP Code",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "We have sent a one-time password to ",
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: "${widget.email}",
                    style: TextStyle(
                        color: Color(0xFF00BCD4), fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "."),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 50,
                  child: TextField(
                    controller: _otpControllers[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "", // Remove character counter
                      border: OutlineInputBorder(),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 24),
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
                      TextSpan(text: " seconds."),
                    ],
                  ),
                ),
              ),
            if (_counter == 0)
              Center(
                child: TextButton(
                  onPressed: _resendOTP,
                  child: Text(
                    "Resend code",
                    style: TextStyle(color: Color(0xFF00BCD4)),
                  ),
                ),
              ),
            Spacer(),
            ElevatedButton(
              onPressed: _validateOTP,
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
