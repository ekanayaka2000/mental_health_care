import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import '../sign_up_screen/signup.dart'; // Import the signup.dart file
import '../sign_up_screen/age.dart';   // Import the age.dart file

class GenderPage extends StatefulWidget {
  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String selectedGender = ''; // Track the selected gender

  // Firebase Firestore instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to select a gender and store it in Firebase
  Future<void> selectGenderAndStore(String gender) async {
    setState(() {
      selectedGender = gender;
    });

    // Get current user ID
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        // Store the selected gender in Firestore under the user's document
        await _firestore.collection('users').doc(user.uid).update({
          'gender': selectedGender,
        });
      } catch (e) {
        print('Failed to update gender: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top section for logo and text
            Column(
              children: [
                Image.asset(
                  'assets/Logo1.png', // Replace with your logo image path
                  height: 80, // Adjusted size to fit at the top
                ),
                SizedBox(height: 20), // Reduced padding below the logo
                Text(
                  'What is your Gender?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Help us understand you better by selecting your gender',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),

            // Middle section for gender options
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => selectGenderAndStore('Male'),
                      child: GenderCard(
                        icon: Icons.male,
                        label: 'Male',
                        isSelected: selectedGender == 'Male',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => selectGenderAndStore('Female'),
                      child: GenderCard(
                        icon: Icons.female,
                        label: 'Female',
                        isSelected: selectedGender == 'Female',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100),
                TextButton(
                  onPressed: () => selectGenderAndStore('Prefer not to say'),
                  child: Text(
                    'Prefer not to say',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: selectedGender == 'Prefer not to say'
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),

            // Bottom section for the "Continue" button
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: selectedGender.isEmpty
                      ? null
                      : () {
                    // Get the current userId
                    User? user = _auth.currentUser;
                    if (user != null) {
                      // Pass userId to AgePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgePage(userId: user.uid),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedGender.isEmpty
                        ? Colors.white
                        : Color(0xFF00BCD4),
                    minimumSize: Size(150, 50), // Width fits the "Continue" text
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: selectedGender.isEmpty ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  GenderCard({required this.icon, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 50,
          color: isSelected ? Colors.teal : Colors.black54,
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
