import 'package:flutter/material.dart';
import 'analytics.dart'; // Import the analytics.dart file
import '../chatbot/chatbot.dart'; // Import the chatbot.dart file
import '../chatbot/talkcoach.dart'; // Import the talkcoach.dart file
import '../profile/account.dart'; // Import the profile.dart file
import '../moodtrack/moodtrack.dart'; // Import the moodtrack.dart file
import '../home_screen/introducing.dart';

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
    AnalyticsPage(),
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
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              print("Search button pressed");
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IntroducingMentalHealthPage()),
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF00BCD4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Introducing to Mental Health Issues",
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MoodSelectionScreen()),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("How do you feel today?", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
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
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatBotPage()),
                  );
                },
                child: _buildChatOption("Chat with Mindy", 'assets/mindy.png'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TalkCoachPage()),
                  );
                },
                child: _buildChatOption("Talk with Coach", 'assets/coach.png'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text("Your Plans for today?", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          Column(
            children: [
              _buildTimelinePlanItem(
                context,
                "Meditation",
                "Intro to Meditation",
                "8 mins",
                onTap: () {
                  print("Intro to Meditation tapped");
                },
              ),
              _buildTimelinePlanItem(
                context,
                "Articles",
                "Mindfulness Techniques",
                "2 mins",
                onTap: () {
                  print("Mindfulness Techniques tapped");
                },
              ),
              _buildTimelinePlanItem(
                context,
                "Breathing",
                "Deep Breath Dynamics",
                "2 - 5 mins",
                onTap: () {
                  print("Deep Breath Dynamics tapped");
                },
              ),
              _buildTimelinePlanItem(
                context,
                "Smart Journal",
                "What activities usually match",
                "30s - 1 min",
                onTap: () {
                  print("Smart Journal tapped");
                },
              ),
              _buildTimelinePlanItem(
                context,
                "Meditation",
                "Gratitude Meditation",
                "10 mins",
                onTap: () {
                  print("Gratitude Meditation tapped");
                },
              ),
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

  Widget _buildChatOption(String text, String imagePath) {
    return Container(
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
