import 'package:flutter/material.dart';
import '../sign_up_screen/goals.dart'; // Import the GoalsPage
import '../sign_up_screen/happiness.dart'; // Import the HappinessPage

class MentalHealthCausesPage extends StatefulWidget {
  @override
  _MentalHealthCausesPageState createState() => _MentalHealthCausesPageState();
}

class _MentalHealthCausesPageState extends State<MentalHealthCausesPage> {
  List<String> causes = ["Work/School", "Relationship", "Family", "Life change", "Finance"];
  List<bool> selectedCauses = List.generate(5, (index) => false);

  bool get hasSelectedCauses => selectedCauses.contains(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigate back to the GoalsPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => GoalsPage()),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures that logo, list, and button are spaced properly
          children: [
            // Top section with logo, title, and description
            Column(
              children: [
                // Logo at the top
                Center(
                  child: Image.asset(
                    'assets/Logo1.png', // Replace with your logo asset path
                    height: 80, // Adjust the size of the logo
                  ),
                ),
                SizedBox(height: 20), // Space between logo and text
                Text(
                  'What causes your mental health issues?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center, // Center the title
                ),
                SizedBox(height: 8),
                Text(
                  'What factors contribute to your mental health issues? (Select all that apply)',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center, // Center the description
                ),
              ],
            ),

            // Causes list
            Expanded(
              child: ListView.builder(
                itemCount: causes.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(causes[index]),
                    value: selectedCauses[index],
                    onChanged: (value) {
                      setState(() {
                        selectedCauses[index] = value!;
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
                  onPressed: hasSelectedCauses
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HappinessPage()),
                    );
                  }
                      : null, // Disabled if no causes are selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hasSelectedCauses ? Color(0xFF00BCD4) : Colors.grey.shade400,
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: hasSelectedCauses ? Colors.white : Colors.black,
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
