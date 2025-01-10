import 'package:flutter/material.dart';
import 'Goals.dart'; // Import the GoalsPage
import 'Happiness.dart'; // Import the HappinessPage

class MentalHealthCausesPage extends StatefulWidget {
  @override
  _MentalHealthCausesPageState createState() => _MentalHealthCausesPageState();
}

class _MentalHealthCausesPageState extends State<MentalHealthCausesPage> {
  final List<String> causes = [
    "Work/School",
    "Relationship",
    "Family",
    "Life change",
    "Finance"
  ];
  List<bool> selectedCauses = List.generate(5, (index) => false);

  bool get hasSelectedCauses => selectedCauses.contains(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigate back to the GoalsPage
            Navigator.push(
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  'What causes your mental health issues?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'What factors contribute to your mental health issues? (Select all that apply)',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 2),

            // Causes list
            Expanded(
              child: ListView.builder(
                itemCount: causes.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(causes[index]),
                    value: selectedCauses[index],
                    activeColor: Colors.teal,
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
              padding: const EdgeInsets.only(bottom: 40.0),
              child: ElevatedButton(
                onPressed: () {
                  if (hasSelectedCauses) {
                    // Gather the selected causes
                    List<String> selectedCausesList = causes
                        .asMap()
                        .entries
                        .where((entry) => selectedCauses[entry.key])
                        .map((entry) => entry.value)
                        .toList();

                    // Navigate to the HappinessPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HappinessPage()),
                    );
                  } else {
                    // Show a message if no causes are selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select at least one issue.'),
                        duration: Duration(seconds: 2),
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
