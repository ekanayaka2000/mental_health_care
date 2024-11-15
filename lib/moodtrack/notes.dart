import 'package:flutter/material.dart';
import '../home_screen/home.dart'; // Import the HomePage

class NotesScreen extends StatelessWidget {
  final List<String> selectedFeelings;
  final TextEditingController _notesController = TextEditingController();

  NotesScreen({required this.selectedFeelings});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center the "Notes" text
            Center(
              child: Text(
                "Notes",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Selected Feelings:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: selectedFeelings.map((feeling) => Chip(label: Text(feeling))).toList(),
            ),
            SizedBox(height: 20),
            Text(
              "Add notes?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _notesController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Type here..",
                border: OutlineInputBorder(),
                fillColor: Color(0xFF00BCD4).withOpacity(0.2), // Set background color with low opacity
                filled: true,
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Save or handle the notes
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()), // Navigate to HomePage
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00BCD4), // Updated button color
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white), // Updated text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
