import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MoodSelectionScreen extends StatefulWidget {
  @override
  _MoodSelectionScreenState createState() => _MoodSelectionScreenState();
}

class _MoodSelectionScreenState extends State<MoodSelectionScreen> {
  double selectedMood = 2; // Default mood selection

  // Mapping of mood levels to icons, colors, and emojis
  final List<Mood> moods = [
    Mood(icon: Icons.sentiment_very_dissatisfied, color: Colors.red, emoji: "😡"),
    Mood(icon: Icons.sentiment_dissatisfied, color: Colors.orange, emoji: "😞"),
    Mood(icon: Icons.sentiment_neutral, color: Colors.yellow, emoji: "😐"),
    Mood(icon: Icons.sentiment_satisfied, color: Colors.lightGreen, emoji: "😊"),
    Mood(icon: Icons.sentiment_very_satisfied, color: Colors.green, emoji: "😁"),
  ];

  // Get mood text based on selection
  String get moodText {
    switch (selectedMood.round()) {
      case 0:
        return "Very Dissatisfied";
      case 1:
        return "Dissatisfied";
      case 2:
        return "Neutral";
      case 3:
        return "Satisfied";
      case 4:
        return "Very Satisfied";
      default:
        return "Neutral";
    }
  }

  // Get the button text based on the selected mood
  String get buttonText {
    switch (selectedMood.round()) {
      case 0:
        return "Very Dissatisfied";
      case 1:
        return "Dissatisfied";
      case 2:
        return "Neutral";
      case 3:
        return "Satisfied";
      case 4:
        return "Very Satisfied";
      default:
        return "Neutral";
    }
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
          // Display selected mood emoji at the top
          Text(
            moods[selectedMood.round()].emoji,
            style: TextStyle(fontSize: 100),
          ),
          SizedBox(height: 5), // Reduced space between emoji and gauge
          // Semi-circular mood selector with increased size
          SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                startAngle: 180,
                endAngle: 0,
                minimum: 0,
                maximum: 4,
                showTicks: false,
                showLabels: false,
                radiusFactor: 0.95, // Increased size of the circular gauge (scale the whole gauge)
                pointers: <GaugePointer>[
                  NeedlePointer(
                    value: selectedMood,
                    enableDragging: true,
                    onValueChanged: (value) {
                      setState(() {
                        selectedMood = value;
                      });
                    },
                    needleLength: 0.6, // Increased needle length
                    needleColor: Colors.brown,
                    knobStyle: KnobStyle(
                      color: Colors.brown,
                      sizeUnit: GaugeSizeUnit.factor,
                      knobRadius: 0.12, // Increased knob radius
                    ),
                  ),
                ],
                ranges: <GaugeRange>[
                  // Very Dissatisfied Range (Red)
                  GaugeRange(
                    startValue: 0,
                    endValue: 0.8,
                    color: Colors.red.withOpacity(1),
                    startWidth: 60, // Increased width of the ranges
                    endWidth: 60,
                  ),
                  // Dissatisfied Range (Orange)
                  GaugeRange(
                    startValue: 0.8,
                    endValue: 1.6,
                    color: Colors.orange.withOpacity(1),
                    startWidth: 60,
                    endWidth: 60,
                  ),
                  // Neutral Range (Yellow)
                  GaugeRange(
                    startValue: 1.6,
                    endValue: 2.4,
                    color: Colors.yellow.withOpacity(1),
                    startWidth: 60,
                    endWidth: 60,
                  ),
                  // Satisfied Range (Light Green)
                  GaugeRange(
                    startValue: 2.4,
                    endValue: 3.2,
                    color: Colors.lightGreen.withOpacity(1),
                    startWidth: 60,
                    endWidth: 60,
                  ),
                  // Very Satisfied Range (Green)
                  GaugeRange(
                    startValue: 3.2,
                    endValue: 4,
                    color: Colors.green.withOpacity(1),
                    startWidth: 60,
                    endWidth: 60,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5), // Decreased gap further between gauge and button
          ElevatedButton(
            onPressed: () {
              // Add functionality as needed
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF00BCD4), // Button color
            ),
            child: Text(
              buttonText, // Dynamically change button text based on mood
              style: TextStyle(color: Colors.white), // White text color
            ),
          ),
        ],
      ),
    );
  }
}

class Mood {
  final IconData icon;
  final Color color;
  final String emoji;

  Mood({required this.icon, required this.color, required this.emoji});
}
