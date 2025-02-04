import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Age.dart'; // Import AgePage

class GenderPage extends StatefulWidget {
  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String selectedGender = ''; // Track the selected gender
  bool _isLoading = false; // Track loading state

  // Function to store gender in Firestore
  Future<void> storeGenderInFirestore() async {
    User? user = FirebaseAuth.instance.currentUser; // Get current user
    if (user != null) {
      String userId = user.uid; // Get user ID

      CollectionReference users = FirebaseFirestore.instance.collection('users');

      await users.doc(userId).set({
        'gender': selectedGender,
      }, SetOptions(merge: true)).then((_) {
        print("Gender updated successfully!");
      }).catchError((error) {
        print("Failed to update gender: $error");
      });
    } else {
      print("No user logged in!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/Logo1.png', // Replace with your logo
                  height: 80,
                ),
                const SizedBox(height: 20),
                const Text(
                  'What is your Gender?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Help us understand you better by selecting your gender',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = 'Male';
                        });
                      },
                      child: GenderCard(
                        icon: Icons.male,
                        label: 'Male',
                        isSelected: selectedGender == 'Male',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = 'Female';
                        });
                      },
                      child: GenderCard(
                        icon: Icons.female,
                        label: 'Female',
                        isSelected: selectedGender == 'Female',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedGender = 'Prefer not to say';
                    });
                  },
                  child: Text(
                    'Prefer not to say',
                    style: TextStyle(
                      color: selectedGender == 'Prefer not to say'
                          ? Color(0xFF00BCD4)
                          : Colors.black54,
                      fontWeight: selectedGender == 'Prefer not to say'
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () async {
                  if (selectedGender.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please select a gender."),
                      ),
                    );
                  } else {
                    setState(() {
                      _isLoading = true; // Show loading state
                    });

                    await storeGenderInFirestore(); // Save gender to Firestore

                    setState(() {
                      _isLoading = false;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AgePage(), // Navigate to AgePage
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00BCD4),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
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

  const GenderCard({
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 50,
          color: isSelected ? Color(0xFF00BCD4) : Colors.black54,
        ),
        const SizedBox(height: 8),
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
