import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Function to store user data
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
