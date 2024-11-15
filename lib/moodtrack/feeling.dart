import 'package:flutter/material.dart';
import 'notes.dart';

class FeelingSelectionScreen extends StatefulWidget {
  final String mood;
  final List<String> reasons;

  FeelingSelectionScreen({required this.mood, required this.reasons});

  @override
  _FeelingSelectionScreenState createState() => _FeelingSelectionScreenState();
}

class _FeelingSelectionScreenState extends State<FeelingSelectionScreen> {
  final List<String> feelings = [
    "Custom", "Calm", "Happy", "Relaxed", "Excited", "Surprised",
    "Sad", "Stressed", "Upset", "Grateful", "Inspired", "Motivated",
    "Confused", "Enjoy", "Bad"
  ];

  List<String> selectedFeelings = [];

  void toggleFeelingSelection(String feeling) {
    setState(() {
      if (selectedFeelings.contains(feeling)) {
        selectedFeelings.remove(feeling);
      } else {
        selectedFeelings.add(feeling);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "What is your exact feeling?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                children: feelings.map((feeling) {
                  final isSelected = selectedFeelings.contains(feeling);
                  return ElevatedButton(
                    onPressed: () => toggleFeelingSelection(feeling),
                    child: Text(feeling),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected ? Colors.cyan : Colors.cyan[100],
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedFeelings.isNotEmpty
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotesScreen(
                      selectedFeelings: selectedFeelings,
                    ),
                  ),
                );
              }
                  : () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please select at least one feeling")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00BCD4),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text("Continue", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}