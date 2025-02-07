import 'dart:async';
import 'package:flutter/material.dart';

class BreathPage extends StatefulWidget {
  @override
  _BreathPageState createState() => _BreathPageState();
}

class _BreathPageState extends State<BreathPage> {
  final List<String> deepBreathTechniques = [
    "1. Inhale Slowly",
    "2. Hold Your Breath",
    "3. Exhale Slowly",
    "4. Repeat"
  ];

  final List<String> descriptions = [
    "Breathe in slowly through your nose, filling your lungs fully with air.",
    "Hold your breath for a few seconds to let the air settle in your lungs.",
    "Exhale slowly through your mouth, releasing all the air from your lungs.",
    "Repeat this process for several minutes to calm your mind and body."
  ];

  int currentStep = 0;
  Timer? _timer;
  int _remainingTime = 0;
  bool _isTimerRunning = false;
  bool _isCompleted = false;

  void startTimer(int duration) {
    setState(() {
      _isTimerRunning = true;
      _remainingTime = duration;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime == 0) {
        timer.cancel();
        setState(() {
          _isTimerRunning = false;
          if (currentStep < 3) {
            currentStep++;
            _remainingTime = 0;
          } else {
            _isCompleted = true; // Mark as completed when the cycle is finished
            currentStep = 0; // Reset the step for the next cycle
          }
        });
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

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
              "Deep Breathing Dynamics",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deepBreathTechniques[currentStep],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    descriptions[currentStep],
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Time remaining: $_remainingTime s",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _isTimerRunning
                          ? null
                          : () {
                        // Start the timer based on the current step
                        if (currentStep == 0) {
                          startTimer(5); // 5 seconds to inhale
                        } else if (currentStep == 1) {
                          startTimer(3); // 3 seconds to hold breath
                        } else if (currentStep == 2) {
                          startTimer(5); // 5 seconds to exhale
                        } else if (currentStep == 3) {
                          // Complete cycle, start over
                          setState(() {
                            currentStep = 0;
                            _remainingTime = 0;
                          });
                        }
                      },
                      child: Text(
                        _isTimerRunning ? "In Progress..." : "Start",
                      ),
                    ),
                  ),
                  // Display step numbers under each technique
                  SizedBox(height: 30),
                  for (int i = 0; i <= currentStep; i++)
                    Text(
                      deepBreathTechniques[i] + " - Completed",
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                ],
              ),
            ),
            // Bottom Center buttons
            if (_isCompleted)
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Complete the process and go back
                      },
                      child: Text("Complete"),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _isCompleted = false; // Reset completion status
                          currentStep = 0; // Start the cycle again
                          _remainingTime = 0;
                        });
                        startTimer(5); // Start from the first step
                      },
                      child: Text("Repeat"),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
