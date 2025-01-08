import 'package:flutter/material.dart';
import 'Happiness.dart'; // Import happiness page

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
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
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                onPressed: hasSelectedGoals
                    ? () {
                  // Navigate to the HappinessPage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HappinessPage()),
                  );
                }
                    : null, // Disable if no goals are selected
                style: ElevatedButton.styleFrom(
                  backgroundColor: hasSelectedGoals
                      ? const Color(0xFF00BCD4)
                      : Colors.grey.shade400,
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
