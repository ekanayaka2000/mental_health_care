import 'package:flutter/material.dart';
import 'Age.dart'; // Import the age.dart file

class GenderPage extends StatefulWidget {
  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String selectedGender = ''; // Track the selected gender
  bool _isLoading = false; // Track loading state (you can use this for future enhancements like a loading indicator)

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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top section for logo and text
            Column(
              children: [
                Image.asset(
                  'assets/Logo1.png', // Replace with your logo image path
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

            // Middle section for gender options
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

            // Bottom section for the "Continue" button
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: ElevatedButton(
                onPressed: _isLoading
                    ? null // Button will be disabled if _isLoading is true
                    : () {
                  if (selectedGender.isEmpty) {
                    // Show SnackBar if gender is not selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please select a gender."),
                      ),
                    );
                  } else {
                    // Navigate to AgePage if gender is selected
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AgePage(), // Navigate to AgePage
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00BCD4), // Always keep the color as specified
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white, // Keep the text color white
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
