import 'package:flutter/material.dart';
import 'created.dart'; // Import the CreatedPage

class HappinessPage extends StatefulWidget {
  @override
  _HappinessPageState createState() => _HappinessPageState();
}

class _HappinessPageState extends State<HappinessPage> {
  final List<String> happinessLevels = [
    "Very Unhappy",
    "Unhappy",
    "Neutral",
    "Happy",
    "Very Happy"
  ];
  int selectedHappiness = -1;

  void _handleFinishButtonPressed() {
    if (selectedHappiness == -1) {
      // Show a message if no happiness level is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please select your happiness level.'),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      // Navigate to the CreatedPage if happiness level is selected
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CreatedPage(),
        ),
      );
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
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo and introductory text at the top
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
                  'How would you rate your level of happiness overall?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Understanding your happiness helps us provide personalized support.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 32), // Space before the happiness levels list

            // Happiness levels list
            Expanded(
              child: ListView.builder(
                itemCount: happinessLevels.length,
                itemBuilder: (context, index) {
                  return RadioListTile<int>(
                    title: Text(happinessLevels[index]),
                    value: index,
                    groupValue: selectedHappiness,
                    activeColor: Colors.teal,
                    onChanged: (value) {
                      setState(() {
                        selectedHappiness = value!;
                      });
                    },
                  );
                },
              ),
            ),

            // Bottom "Finish" button
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                onPressed: _handleFinishButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00BCD4),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Finish',
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
