// Import Firebase dependencies
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to register a user
  Future<User?> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Error registering user: $e');
      return null;
    }
  }

  // Function to save user data to Firestore
  Future<void> saveUserData(String email, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(email).set(data);
    } catch (e) {
      print('Error saving user data: $e');
    }
  }
}

// Usage Example in SignUp Flow
Future<void> handleSignUp(String email, String password, Map<String, dynamic> userData) async {
  FirebaseService firebaseService = FirebaseService();

  // Register the user
  User? user = await firebaseService.registerUser(email, password);

  if (user != null) {
    // Save additional user data to Firestore
    await firebaseService.saveUserData(email, userData);
    print('User registered and data saved successfully.');
  } else {
    print('User registration failed.');
  }
}
