import 'package:flutter/material.dart';
import 'Goals.dart'; // Import the goals.dart file

class AgePage extends StatefulWidget {
  @override
  _AgePageState createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  int selectedAge = 23; // Default age selection

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
                // Top section with logo, title, and subtitle
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/Logo1.png', // Replace with your logo image path
                      height: 80,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'How old are you?',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Your age helps us tailor our recommendations to you.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                // Middle section with age selection
                Expanded(
                  child: Stack(
                    children: [
                      // Lines above and below the selected age
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 1,
                              color: Colors.lightBlueAccent, // Line color
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                            const SizedBox(height: 48), // Gap between the lines
                            Container(
                              height: 1,
                              color: Colors.lightBlueAccent, // Line color
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                          ],
                        ),
                      ),
                      // ListWheelScrollView for age selection
                      ListWheelScrollView.useDelegate(
                        itemExtent: 50,
                        diameterRatio: 1.5,
                        physics: const FixedExtentScrollPhysics(),
                        onSelectedItemChanged: (index) {
                          setState(() {
                            selectedAge = index + 1; // Update age based on selection
                          });
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            return Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${index + 1}', // Display the age number
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: index + 1 == selectedAge
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: index + 1 == selectedAge
                                          ? const Color(0xFF00BCD4) // Highlight selected number
                                          : Colors.grey,
                                    ),
                                  ),
                                  if (index + 1 == selectedAge) // Show "Years" only for the selected age
                                    const SizedBox(width: 8),
                                  if (index + 1 == selectedAge)
                                    const Text(
                                      'Years',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF00BCD4),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                          childCount: 100, // Age range from 1 to 100
                        ),
                      ),
                    ],
                  ),
                ),

                // Bottom section with the "Continue" button
                Padding(
                  padding: const EdgeInsets.only(bottom: 60.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the GoalsPage after selecting the age
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GoalsPage()),
                      );
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
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
        ),
    );
  }
}