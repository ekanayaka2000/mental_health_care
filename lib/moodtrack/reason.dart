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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "What is the reason that makes you feel ${widget.mood}?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
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
                  _buildReasonButton("Events"),
                  _buildReasonButton("Travel"),
                ],
              ),
            ),
            SizedBox(height: 20),
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please select at least one reason")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00BCD4),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text("Continue", style: TextStyle(fontSize: 18,color: Colors.white)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildReasonButton(String reason) {
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
  }
}
