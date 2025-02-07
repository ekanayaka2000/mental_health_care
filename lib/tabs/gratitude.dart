import 'package:flutter/material.dart';

class GratitudePage extends StatelessWidget {
  final List<String> gratitudeMeditationTechniques = [
    "1. Reflect on Your Day",
    "2. Express Gratitude for Loved Ones",
    "3. Focus on Personal Strengths",
    "4. Acknowledge Simple Blessings",
    "5. Visualize a Positive Future"
  ];

  final List<String> descriptions = [
    "Take a moment to reflect on your day, acknowledging the small wins and moments of joy.",
    "Think about the people in your life who support you, and express your gratitude for them.",
    "Consider your strengths and qualities that help you navigate challenges.",
    "Appreciate the simple things in life, like a good meal, nature, or moments of peace.",
    "Visualize a bright and positive future, focusing on what you're grateful for in the days to come."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Gratitude Meditation Practices",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: gratitudeMeditationTechniques.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          gratitudeMeditationTechniques[index],
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          descriptions[index],
                          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Complete"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
