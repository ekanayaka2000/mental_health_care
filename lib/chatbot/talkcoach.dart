import 'package:flutter/material.dart';
import '../chatbot/chatbot.dart'; // Import the chatbot.dart file

class TalkCoachPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Talk with Coach'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: 5, // Example count of 5 coaches
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              tileColor: Colors.lightBlue[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.purple[100],
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                'Coach ${index + 1}', // Dynamically show coach number
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Occupation ${index + 1}', // Example subtitle, you can replace with actual data
                style: TextStyle(fontSize: 14),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigate to chat page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatBotPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: Text(
                  'Chat',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
