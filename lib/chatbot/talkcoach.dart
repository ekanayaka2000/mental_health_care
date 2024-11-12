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
              title: Text('Coach'),
              subtitle: Text('Occupation'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigate to chat page (you can replace this with ChatBotPage navigation)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatBotPage()),
                  );
                },
                child: Text('Chat'),
              ),
            ),
          );
        },
      ),
    );
  }
}
