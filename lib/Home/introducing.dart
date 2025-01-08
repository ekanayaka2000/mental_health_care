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
            // Introduction Text
            _buildSectionTitle("What is Mental Health?"),
            _buildSectionContent(
                "Mental health includes our emotional, psychological, and social well-being. "
                    "It affects how we think, feel, and act as we cope with life. It also determines how we handle stress, relate to others, "
                    "and make choices. Mental health is important at every stage of life, from childhood and adolescence through adulthood."
            ),

            SizedBox(height: 20),

            _buildSectionTitle("Why is Mental Health Important?"),
            _buildSectionContent(
                "Taking care of your mental health is crucial for overall wellness. Good mental health can enhance your quality of life, "
                    "improve physical health, strengthen relationships, and increase productivity. Addressing mental health challenges early can also prevent worsening conditions."
            ),

            SizedBox(height: 20),

            _buildSectionTitle("Common Myths about Mental Health"),
            _buildMythBuster(
                "Myth: Mental health issues are rare.",
                "Fact: Mental health issues are very common. Around 1 in 5 people experience some form of mental health condition each year."
            ),
            _buildMythBuster(
                "Myth: Mental health issues are a sign of weakness.",
                "Fact: Mental health conditions can affect anyone, and they often have complex causes beyond personal control. Seeking help is a sign of strength."
            ),
            _buildMythBuster(
                "Myth: Therapy is only for people with serious mental illnesses.",
                "Fact: Therapy can help anyone facing stress, relationship issues, life transitions, or wanting personal growth."
            ),

            SizedBox(height: 20),

            _buildSectionTitle("How to Get Help"),
            _buildSectionContent(
                "If you or someone you know is struggling with mental health, consider reaching out to a mental health professional. "
                    "There are also resources like helplines, community centers, and online support groups that can provide guidance and support."
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Section Title
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueGrey[800]),
    );
  }

  // Section Content
  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 16, color: Colors.grey[800]),
      ),
    );
  }

  // Myth Buster
  Widget _buildMythBuster(String myth, String fact) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning, color: Colors.red, size: 20),
              SizedBox(width: 10),
              Text(
                myth,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ],
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              fact,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
