import 'package:flutter/material.dart';
import '../chatbot/chatbot.dart'; // Import the chatbot.dart file
import '../chatbot/talkcoach.dart'; // Import the talkcoach.dart file
import '../profile/account.dart'; // Import the profile.dart file
import '../MoodTrack/moodtrack.dart'; // Import the moodtrack.dart file
import '../tabs/article.dart';
import '../tabs/breath.dart';
import '../tabs/gratitude.dart';
import '../tabs/journal.dart';
import '../tabs/meditation.dart';
import 'introducing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Health App',
      theme: ThemeData(
        primaryColor: Color(0xFF00BCD4),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF00BCD4),
          secondary: Colors.tealAccent,
        ),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    Text("Library Page"),
    Text("Analytics Page"), // Removed AnalyticsPage, just for frontend
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Image.asset(
            'assets/Logo1.png',
            width: 40,
            height: 40,
          ),
        ),
        title: Text(
          _selectedIndex == 0 ? "Home" :
          _selectedIndex == 1 ? "Library" :
          _selectedIndex == 2 ? "Analytics" :
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xFF00BCD4),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Introducing Mental Health Section
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IntroducingMentalHealthPage()),
              );
            },
            child: _buildSectionCard("Introducing to Mental Health Issues"),
          ),
          SizedBox(height: 20),

          // Mood Selection Section
          _buildMoodSelectionSection(context),
          SizedBox(height: 30),

          // Chat Options Section
          _buildChatOptionsSection(context),
          SizedBox(height: 20),

          // Plans for Today Section
          Text("Your Plans for today?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Column(
            children: [
              _buildTimelinePlanItem(
                context,
                "Meditation",
                "Intro to Meditation",
                "8 mins",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MeditationPage()),
                  );
                },
              ),
              _buildTimelinePlanItem(
                context,
                "Articles",
                "Mindfulness Techniques",
                "2 mins",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ArticlePage()),
                  );
                },
              ),
              _buildTimelinePlanItem(
                context,
                "Breathing",
                "Deep Breath Dynamics",
                "2 - 5 mins",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BreathPage()),
                  );
                },
              ),
              _buildTimelinePlanItem(
                context,
                "Smart Journal",
                "What activities usually match",
                "30s - 1 min",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JournalPage()),
                  );
                },
              ),
              _buildTimelinePlanItem(
                context,
                "Meditation",
                "Gratitude Meditation",
                "10 mins",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GratitudePage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper methods to modularize sections

  Widget _buildSectionCard(String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF00BCD4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildMoodSelectionSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MoodSelectionScreen()),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("How do you feel today?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMoodIcon(Icons.sentiment_very_satisfied, Colors.green.shade700),
              _buildMoodIcon(Icons.sentiment_satisfied, Colors.lightGreen.shade700),
              _buildMoodIcon(Icons.sentiment_neutral, Colors.amber.shade800),
              _buildMoodIcon(Icons.sentiment_dissatisfied, Colors.orange.shade800),
              _buildMoodIcon(Icons.sentiment_very_dissatisfied, Colors.red.shade800),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMoodIcon(IconData icon, Color color) {
    return CircleAvatar(
      backgroundColor: color.withOpacity(0.3),
      child: Icon(icon, color: color.withOpacity(0.9)),
    );
  }

  Widget _buildChatOptionsSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildChatOption("Chat with Mindy", 'assets/mindy.png', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatBotPage()),
          );
        }),
        _buildChatOption("Talk with Coach", 'assets/coach.png', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TalkCoachPage()),
          );
        }),
      ],
    );
  }

  Widget _buildChatOption(String text, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.tealAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.tealAccent, width: 2),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: Image.asset(
                imagePath,
                width: 30,
                height: 30,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.tealAccent[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelinePlanItem(BuildContext context, String category, String title, String duration, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.teal, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category, style: TextStyle(color: Colors.teal, fontSize: 12)),
                  SizedBox(height: 4),
                  Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(duration, style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
