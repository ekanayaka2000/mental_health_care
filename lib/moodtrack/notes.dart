import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  final List<String> selectedFeelings;
  final TextEditingController _notesController = TextEditingController();

  NotesScreen({required this.selectedFeelings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mood Tracking')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                hintText: "Add Notes..",
                border: OutlineInputBorder(),
                fillColor: Colors.lightBlue[50],
                filled: true,
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Save or handle the notes
                  Navigator.pop(context);
                },
                child: Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
