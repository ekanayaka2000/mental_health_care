import 'package:flutter/material.dart';
import '../sign_up_screen/mental_health_causes.dart'; // Import the MentalHealthCausesPage
import '../sign_in_screen/signin.dart'; // Import the SignInPage

class HappinessPage extends StatefulWidget {
  @override
  _HappinessPageState createState() => _HappinessPageState();
}

class _HappinessPageState extends State<HappinessPage> {
  List<String> happinessLevels = ["Very Unhappy", "Unhappy", "Neutral", "Happy", "Very Happy"];
  int selectedHappiness = -1;

  bool get hasSelectedHappiness => selectedHappiness != -1;

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
          children: [
            // Logo and introductory text at the top
            Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/Logo1.png', // Replace with your logo asset path
                    height: 80, // Adjust the size of the logo
                  ),
                ),
                SizedBox(height: 20), // Space between logo and text
                Text(
                  'How would you rate your level of happiness overall?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Understanding your happiness helps us provide personalized support.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 32), // Space before the happiness levels list

            // Happiness levels list
            Expanded(
              child: ListView.builder(
                itemCount: happinessLevels.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    title: Text(happinessLevels[index]),
                    value: index,
                    groupValue: selectedHappiness,
                    onChanged: (value) {
                      setState(() {
                        selectedHappiness = value as int;
                      });
                    },
                  );
                },
              ),
            ),

            // Bottom "Finish" button
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: hasSelectedHappiness
                      ? () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  }
                      : null, // Disabled if no happiness level is selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hasSelectedHappiness ? Color(0xFF00BCD4) : Colors.grey.shade400,
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Finish',
                    style: TextStyle(
                      color: hasSelectedHappiness ? Colors.white : Colors.black,
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
