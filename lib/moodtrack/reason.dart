import 'package:flutter/material.dart';
import 'feeling.dart';

class ReasonSelectionScreen extends StatefulWidget {
  final String mood;

  ReasonSelectionScreen({required this.mood});

  @override
  _ReasonSelectionScreenState createState() => _ReasonSelectionScreenState();
}

class _ReasonSelectionScreenState extends State<ReasonSelectionScreen> {
  // List to keep track of selected reasons
  List<String> selectedReasons = [];

  void toggleReasonSelection(String reason) {
    setState(() {
      if (selectedReasons.contains(reason)) {
        selectedReasons.remove(reason); // Deselect reason if already selected
      } else {
        selectedReasons.add(reason); // Select reason if not already selected
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mood Tracking')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "What is the reason that makes you feel ${widget.mood}?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              _buildReasonButton("Work"),
              _buildReasonButton("School"),
              _buildReasonButton("Family"),
              _buildReasonButton("Partner"),
              _buildReasonButton("Health"),
              _buildReasonButton("Friends"),
              _buildReasonButton("Weather"),
              _buildReasonButton("Hobbies"),
              _buildReasonButton("Exercise"),
              _buildReasonButton("Finances"),
            ],
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (selectedReasons.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeelingSelectionScreen(
                      mood: widget.mood,
                      reasons: selectedReasons,
                    ),
                  ),
                );
              } else {
                // Show a message if no reason is selected
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please select at least one reason")),
                );
              }
            },
            child: Text("Continue"),
          ),
        ],
      ),
    );
  }

  Widget _buildReasonButton(String reason) {
    final isSelected = selectedReasons.contains(reason);
    return ElevatedButton(
      onPressed: () => toggleReasonSelection(reason),
      child: Text(reason),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.tealAccent : Colors.grey[200],
        foregroundColor: isSelected ? Colors.black : Colors.grey[800],
      ),
    );
  }
}
