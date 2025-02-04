import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'age.dart'; // Import AgePage
import 'mental_health_causes.dart';

class GoalsPage extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  final List<String> goals = [
    "Improve Mood",
    "Reduce Stress",
    "Improve Sleep",
    "Enhance Relationships",
    "Boost Confidence",
  ];
  final List<bool> selectedGoals = List.generate(5, (index) => false);

  bool get hasSelectedGoals => selectedGoals.contains(true);

  Future<void> saveSelectedGoals() async {
    try {
      // Get the logged-in user's UID
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        print("⚠ Error: User is not authenticated.");
        return;
      }

      // Filter selected goals
      List<String> selectedGoalsList = [];
      for (int i = 0; i < goals.length; i++) {
        if (selectedGoals[i]) {
          selectedGoalsList.add(goals[i]);
        }
      }

      // Save selected goals under the user's Firestore document
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'selected_goals': selectedGoalsList,
      }, SetOptions(merge: true));

      print("✅ Goals successfully saved!");

    } catch (e) {
      print("❌ Error saving goals: $e");
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
            // Navigate back to AgePage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AgePage()),
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
            // Top section
            Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/Logo1.png', // Replace with your logo
                    height: 80,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'What are your main goals?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
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
                    activeColor: Colors.teal,
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
              padding: const EdgeInsets.only(bottom: 50.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (hasSelectedGoals) {
                    await saveSelectedGoals(); // Save goals to Firestore
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MentalHealthCausesPage(),
                      ),
                    );
                  } else {
                    // Show error message if no goals are selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select at least one goal."),
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
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
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
