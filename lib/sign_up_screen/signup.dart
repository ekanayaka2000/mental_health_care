import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:firebase_core/firebase_core.dart'; // Import FirebaseCore
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import '../sign_up_screen/gender.dart'; // Import the gender.dart file
import '../sign_in_screen/signin.dart'; // Import the signin.dart file

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isChecked = false; // Track checkbox state
  bool _isPasswordVisible = false; // Track password visibility state
  final _emailController = TextEditingController(); // Controller for email input
  final _passwordController = TextEditingController(); // Controller for password input
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Method to handle sign up
  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      // If form is valid, try to sign up with Firebase
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Store user details in Firestore
        await _storeUserData(userCredential.user);

        // Proceed to the GenderPage if sign up is successful
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GenderPage()),
        );
      } catch (e) {
        // Show error message if sign up fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign up: $e')),
        );
      }
    }
  }

  // Method to store user data in Firestore
  Future<void> _storeUserData(User? user) async {
    if (user != null) {
      try {
        // Create a document for the user in the "users" collection
        DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

        await userRef.set({
          'email': user.email,
          'password': _passwordController.text, // Store the password (you can choose to store it hashed for security reasons)
          'gender': '',  // Placeholder for gender
          'age': '',     // Placeholder for age
          'goals': [],   // Placeholder for goals
          'causes': [],  // Placeholder for mental health causes
          'happiness_level': '', // Placeholder for happiness level
        });

        print('User data successfully stored');
      } catch (e) {
        print('Error storing user data: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assign the form key here
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
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
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
                onPressed: _isChecked ? _signUp : null, // Only allow sign up if terms are agreed
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
      ),
    );
  }
}
