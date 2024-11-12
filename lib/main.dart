import 'package:flutter/material.dart';
import '../splash_screen/splash_screen.dart';
import '../profile/appearance.dart'; // Import AppearancePage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Define a global ValueNotifier to manage the theme mode
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, ThemeMode currentMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: currentMode, // Apply the current theme mode
          theme: ThemeData.light(), // Light theme configuration
          darkTheme: ThemeData.dark(), // Dark theme configuration
          home: SplashScreen(), // Start with SplashScreen
        );
      },
    );
  }
}
