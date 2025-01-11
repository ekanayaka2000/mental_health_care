import 'package:flutter/material.dart';
import 'feeling.dart';

class ReasonSelectionScreen extends StatefulWidget {
  final String mood;

  ReasonSelectionScreen({required this.mood});

  @override
  _ReasonSelectionScreenState createState() => _ReasonSelectionScreenState();
}

class _ReasonSelectionScreenState extends State<ReasonSelectionScreen> {
  List<String> selectedReasons = [];

  void toggleReasonSelection(String reason) {
    setState(() {
      if (selectedReasons.contains(reason)) {
        selectedReasons.remove(reason);
      } else {
        selectedReasons.add(reason);
      }
    });
  }

  void handleContinue() {
    if (selectedReasons.isEmpty) {
      // Show a message to the user if no reasons are selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please select at least one reason before continuing."),
        ),
      );
    } else {
      // Navigate to the FeelingSelectionScreen if reasons are selected
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FeelingSelectionScreen(
            mood: widget.mood,
            reasons: selectedReasons,
          ),
        ),
      );
    }
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
        padding: const EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is the reason that makes you feel ${widget.mood}?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                ),
                itemCount: reasonList.length,
                itemBuilder: (context, index) {
                  String reason = reasonList[index];
                  final isSelected = selectedReasons.contains(reason);
                  return ElevatedButton(
                    onPressed: () => toggleReasonSelection(reason),
                    child: Text(reason),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected ? Colors.cyan : Colors.cyan[100],
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleContinue,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00BCD4),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

final List<String> reasonList = [
  "Work", "School", "Family", "Partner", "Health", "Friends",
  "Weather", "Hobbies", "Exercise", "Finances", "Events", "Travel"
];
