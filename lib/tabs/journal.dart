import 'package:flutter/material.dart';

class JournalPage extends StatelessWidget {
  final List<String> relaxingActivities = [
    "1. Meditation",
    "2. Reading a Book",
    "3. Listening to Music",
    "4. Yoga",
    "5. Spending Time in Nature"
  ];

  final List<String> descriptions = [
    "Find a quiet place, close your eyes, and focus on your breathing. Let go of any distractions.",
    "Engage in a book you enjoy. Reading can help you escape stress and stimulate your imagination.",
    "Listen to soothing or calming music. It can help reduce anxiety and improve your mood.",
    "Practice gentle stretches or poses to improve your flexibility and reduce tension in your body.",
    "Take a walk in the park or sit under a tree. Spending time in nature can have a calming effect on the mind."
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
              "Mind Relaxation Activities",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: relaxingActivities.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          relaxingActivities[index],
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
