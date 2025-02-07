import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  final List<String> mindfulnessTechniques = [
    "1. Deep Breathing",
    "2. Body Scan Meditation",
    "3. Mindful Walking",
    "4. Gratitude Practice",
    "5. Observing Thoughts"
  ];

  final List<String> descriptions = [
    "Focus on your breath, inhale deeply through your nose, and exhale slowly through your mouth.",
    "Pay attention to different parts of your body, noticing any sensations or tension, and consciously relax.",
    "Walk slowly and deliberately, paying close attention to each step and how your body moves.",
    "Take a moment to think about things you're grateful for, fostering a positive mindset.",
    "Observe your thoughts without judgment, allowing them to come and go naturally."
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
              "5 Mindfulness Techniques",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: mindfulnessTechniques.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mindfulnessTechniques[index],
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