// age.dart
import 'package:flutter/material.dart';
import '../sign_up_screen/gender.dart'; // Import the gender.dart file
import '../sign_up_screen/goals.dart'; // Import the goals.dart file

class AgePage extends StatefulWidget {
  @override
  _AgePageState createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  int selectedAge = 1;

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GoalsPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedAge == null
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
                      color: selectedAge == null ? Colors.black : Colors.white,
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
