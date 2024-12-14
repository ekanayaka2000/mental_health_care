import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import '../sign_up_screen/happiness.dart'; // Import happiness page
import '../sign_up_screen/mental_health_causes.dart'; // Import mental health causes page

class GoalsPage extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  List<String> goals = [
    "Improve Mood",
    "Reduce Stress",
    "Improve Sleep",
    "Enhance Relationships",
    "Boost Confidence"
  ];
  List<bool> selectedGoals = List.generate(5, (index) => false);

  bool get hasSelectedGoals => selectedGoals.contains(true);

  // Firebase Firestore and FirebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to store selected goals in Firestore
  Future<void> storeGoalsInFirestore() async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        // Save selected goals to Firestore under the user's document
        await _firestore.collection('users').doc(user.uid).update({
          'goals': goals.asMap().entries
              .where((entry) => selectedGoals[entry.key])
              .map((entry) => entry.value)
              .toList(),
        });
        print('Goals saved to Firestore');
      } catch (e) {
        print('Failed to save goals to Firestore: $e');
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
            // Navigate back to the MentalHealthCausesPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MentalHealthCausesPage()),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top section with logo, title, and description
            Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/Logo1.png', // Replace with your logo asset path
                    height: 80, // Adjust the size of the logo
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'What are your main goals?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Select the options that best represent what you hope to achieve. (Select all that apply)',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            // Goals list
            Expanded(
              child: ListView.builder(
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(goals[index]),
                    value: selectedGoals[index],
                    onChanged: (value) {
                      setState(() {
                        selectedGoals[index] = value!;
                      });
                    },
                  );
                },
              ),
            ),

            // Bottom "Continue" button
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: hasSelectedGoals
                      ? () async {
                    // Store the selected goals in Firestore
                    await storeGoalsInFirestore();

                    // Navigate to the HappinessPage after storing goals
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HappinessPage()),
                    );
                  }
                      : null, // Disabled if no goals are selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hasSelectedGoals ? Color(0xFF00BCD4) : Colors.grey.shade400,
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: hasSelectedGoals ? Colors.white : Colors.black,
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
