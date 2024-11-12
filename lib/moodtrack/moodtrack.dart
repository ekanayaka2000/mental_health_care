import 'package:flutter/material.dart';
import 'reason.dart';

class MoodSelectionScreen extends StatefulWidget {
  @override
  _MoodSelectionScreenState createState() => _MoodSelectionScreenState();
}

class _MoodSelectionScreenState extends State<MoodSelectionScreen> {
  String selectedMood = ''; // Variable to store the selected mood

  void onMoodSelected(String mood) {
    setState(() {
      selectedMood = mood;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mood Tracking')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "How do you feel today?",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          // Semicircle mood selector (custom widget)
          MoodSelectorWidget(onMoodSelected: onMoodSelected),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (selectedMood.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReasonSelectionScreen(mood: selectedMood),
                  ),
                );
              } else {
                // Show a message if no mood is selected
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please select a mood")),
                );
              }
            },
            child: Text("Continue"),
          ),
        ],
      ),
    );
  }
}

class MoodSelectorWidget extends StatelessWidget {
  final Function(String) onMoodSelected;

  MoodSelectorWidget({required this.onMoodSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.sentiment_very_dissatisfied, color: Colors.red, size: 50),
          onPressed: () => onMoodSelected("Very Dissatisfied"),
        ),
        IconButton(
          icon: Icon(Icons.sentiment_dissatisfied, color: Colors.orange, size: 50),
          onPressed: () => onMoodSelected("Dissatisfied"),
        ),
        IconButton(
          icon: Icon(Icons.sentiment_neutral, color: Colors.yellow, size: 50),
          onPressed: () => onMoodSelected("Neutral"),
        ),
        IconButton(
          icon: Icon(Icons.sentiment_satisfied, color: Colors.lightGreen, size: 50),
          onPressed: () => onMoodSelected("Satisfied"),
        ),
        IconButton(
          icon: Icon(Icons.sentiment_very_satisfied, color: Colors.green, size: 50),
          onPressed: () => onMoodSelected("Very Satisfied"),
        ),
      ],
    );
  }
}
