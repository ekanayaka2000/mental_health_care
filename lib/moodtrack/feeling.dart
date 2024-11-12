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

  // List to keep track of selected feelings
  List<String> selectedFeelings = [];

  void toggleFeelingSelection(String feeling) {
    setState(() {
      if (selectedFeelings.contains(feeling)) {
        selectedFeelings.remove(feeling); // Deselect feeling if already selected
      } else {
        selectedFeelings.add(feeling); // Select feeling if not already selected
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mood Tracking')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "What is your exact feeling?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.all(10),
              children: feelings.map((feeling) {
                final isSelected = selectedFeelings.contains(feeling);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => toggleFeelingSelection(feeling),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      isSelected ? Colors.tealAccent : Colors.grey[300],
                      foregroundColor: Colors.black,
                    ),
                    child: Text(feeling),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
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
                  : null, // Disable button if no feeling is selected
              child: Text("Continue"),
            ),
          ),
        ],
      ),
    );
  }
}
