import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../sign_up_screen/gender.dart'; // Import the gender.dart file
import '../sign_in_screen/signin.dart'; // Import the signin.dart file

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isChecked = false; // Track checkbox state
  bool _isPasswordVisible = false; // Track password visibility state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/Logo1.png', // Replace with your logo image path
              height: 100,
            ),
            SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Join ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Default color
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Mental Health Care',
                    style: TextStyle(
                      color: Colors.cyan, // Desired color for emphasis
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' Today!',
                    style: TextStyle(
                      color: Colors.black, // Default color
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Start your journey to better mental health.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: !_isPasswordVisible, // Control password visibility
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                suffixIcon: GestureDetector(
                  onLongPress: () {
                    setState(() {
                      _isPasswordVisible = true;
                    });
                  },
                  onLongPressUp: () {
                    setState(() {
                      _isPasswordVisible = false;
                    });
                  },
                  child: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                Expanded(
                  child: Text('I agree to MindLink terms & conditions'),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_isChecked) { // Proceed only if terms are agreed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GenderPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please agree to the terms & conditions')),
                  );
                }
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
            SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(
                  color: Colors.grey, // Gray color for "Already have an account?"
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign in',
                    style: TextStyle(
                      color: Colors.red, // Red color for "Sign in"
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
