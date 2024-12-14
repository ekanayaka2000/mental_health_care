import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Import the generated Firebase options
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'splash_screen/splash_screen.dart'; // Import SplashScreen
import 'sign_in_screen/signin.dart'; // Import SignInPage

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter is initialized before Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Use Firebase options for the current platform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, ThemeMode currentMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: currentMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: SplashScreen(), // Initial screen (splash screen)
        );
      },
    );
  }
}

class FirebaseService {
  // Function to store user data in Firestore
  Future<void> storeUserData({
    required String email,
    required String password,
    required String gender,
    required String age,
    required List<String> selectedGoals,
    required List<String> selectedCauses,
    required String happinessLevel,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

      try {
        await userRef.set({
          'email': email,
          'password': password,  // Store the password securely (ensure you hash it or avoid direct storage in plain text)
          'gender': gender,
          'age': age,
          'goals': selectedGoals,
          'causes': selectedCauses,
          'happiness_level': happinessLevel,
        }, SetOptions(merge: true));

        print('User data successfully stored');
      } catch (e) {
        print('Error storing user data: $e');
      }
    } else {
      print('User is not authenticated');
    }
  }
}
