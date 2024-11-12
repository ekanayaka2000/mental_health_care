import 'package:flutter/material.dart';

class IntroducingMentalHealthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00BCD4),
        title: Text("Introduction to Mental Health"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is Mental Health?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Mental health includes our emotional, psychological, and social well-being. It affects how we think, feel, and act as we cope with life. It also determines how we handle stress, relate to others, and make choices. Mental health is important at every stage of life, from childhood and adolescence through adulthood.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Why is Mental Health Important?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Taking care of your mental health is crucial for overall wellness. Good mental health can enhance your quality of life, improve physical health, strengthen relationships, and increase productivity. Addressing mental health challenges early can also prevent worsening conditions.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Common Myths about Mental Health",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildMythBuster("Myth: Mental health issues are rare.",
                "Fact: Mental health issues are very common. Around 1 in 5 people experience some form of mental health condition each year."),
            _buildMythBuster("Myth: Mental health issues are a sign of weakness.",
                "Fact: Mental health conditions can affect anyone, and they often have complex causes beyond personal control. Seeking help is a sign of strength."),
            _buildMythBuster("Myth: Therapy is only for people with serious mental illnesses.",
                "Fact: Therapy can help anyone facing stress, relationship issues, life transitions, or wanting personal growth."),
            SizedBox(height: 20),
            Text(
              "How to Get Help",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "If you or someone you know is struggling with mental health, consider reaching out to a mental health professional. There are also resources like helplines, community centers, and online support groups that can provide guidance and support.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildMythBuster(String myth, String fact) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            myth,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          SizedBox(height: 5),
          Text(
            fact,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
