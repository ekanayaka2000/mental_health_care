import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Goals.dart'; // Import the GoalsPage

class AgePage extends StatefulWidget {
  @override
  _AgePageState createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  int selectedAge = 23; // Default age selection
  bool _isLoading = false; // Loading state

  // Function to store age in Firestore
  Future<void> storeAgeInFirestore() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;

      CollectionReference users = FirebaseFirestore.instance.collection('users');
      await users.doc(userId).set({
        'age': selectedAge,
      }, SetOptions(merge: true)).then((_) {
        print("Age updated successfully!");
      }).catchError((error) {
        print("Failed to update age: $error");
      });
    } else {
      print("No user logged in!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/Logo1.png',
                  height: 80,
                ),
                const SizedBox(height: 20),
                const Text(
                  'How old are you?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your age helps us tailor our recommendations to you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 1,
                          color: Colors.lightBlueAccent,
                          width: MediaQuery.of(context).size.width * 0.8,
                        ),
                        const SizedBox(height: 48),
                        Container(
                          height: 1,
                          color: Colors.lightBlueAccent,
                          width: MediaQuery.of(context).size.width * 0.8,
                        ),
                      ],
                    ),
                  ),
                  ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    diameterRatio: 1.5,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedAge = index + 1;
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        return Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: index + 1 == selectedAge
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: index + 1 == selectedAge
                                      ? const Color(0xFF00BCD4)
                                      : Colors.grey,
                                ),
                              ),
                              if (index + 1 == selectedAge)
                                const SizedBox(width: 8),
                              if (index + 1 == selectedAge)
                                const Text(
                                  'Years',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00BCD4),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                      childCount: 100,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () async {
                  setState(() {
                    _isLoading = true;
                  });
                  await storeAgeInFirestore();
                  setState(() {
                    _isLoading = false;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GoalsPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00BCD4),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
