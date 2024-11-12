import 'package:flutter/material.dart';
import '../main.dart'; // Import MyApp to access themeNotifier

class AppearancePage extends StatefulWidget {
  @override
  _AppearancePageState createState() => _AppearancePageState();
}

class _AppearancePageState extends State<AppearancePage> {
  // Initialize _themeMode with the current value from themeNotifier
  ThemeMode _themeMode = MyApp.themeNotifier.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "App Appearance",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose Theme Mode",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            RadioListTile<ThemeMode>(
              title: Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: _themeMode,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _themeMode = value!;
                  MyApp.themeNotifier.value = _themeMode; // Update global theme mode
                });
              },
            ),
            RadioListTile<ThemeMode>(
              title: Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: _themeMode,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _themeMode = value!;
                  MyApp.themeNotifier.value = _themeMode;
                });
              },
            ),
            RadioListTile<ThemeMode>(
              title: Text("Device Mode"),
              value: ThemeMode.system,
              groupValue: _themeMode,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _themeMode = value!;
                  MyApp.themeNotifier.value = _themeMode;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
