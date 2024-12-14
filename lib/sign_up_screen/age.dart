import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';  // Import Firestore package
import '../sign_up_screen/goals.dart'; // Import the goals.dart file
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth

class AgePage extends StatefulWidget {
  final String userId;  // Receive the userId to store data
  AgePage({required this.userId});

  @override
  _AgePageState createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  int selectedAge = 1;  // Default age selection

  // Function to save the selected age to Firebase
  void saveAgeToFirestore(int age) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(widget.userId).update({
        'age': age,
      });
      print('Age saved to Firestore: $age');
    } catch (e) {
      print('Error saving age to Firestore: $e');
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
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top section with logo, title, and subtitle
            Column(
              children: [
                SizedBox(height: 20),
                Image.asset(
                  'assets/Logo1.png', // Replace with your logo image path
                  height: 80,
                ),
                SizedBox(height: 20),
                Text(
                  'How old are you?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Your age helps us tailor our recommendation to you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),

            // Middle section with age selection
            Expanded(
              child: Center(
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  diameterRatio: 1.5,
                  physics: FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedAge = index + 1;
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) {
                      return Center(
                        child: Text(
                          '${index + 1} Years',
                          style: TextStyle(
                            fontSize: 24,
                            color: index + 1 == selectedAge
                                ? Colors.teal
                                : Colors.grey,
                          ),
                        ),
                      );
                    },
                    childCount: 100,
                  ),
                ),
              ),
            ),

            // Bottom section with the "Continue" button
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Save the age to Firebase Firestore and navigate
                    saveAgeToFirestore(selectedAge);

                    // Navigate to the GoalsPage after saving the age
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GoalsPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedAge == 0
                        ? Colors.white
                        : Color(0xFF00BCD4),
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: selectedAge == 0 ? Colors.black : Colors.white,
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
