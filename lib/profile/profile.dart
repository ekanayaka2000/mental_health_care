import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _selectedImage;
  final picker = ImagePicker();
  String? _profilePictureUrl;
  final _auth = FirebaseAuth.instance;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final userId = _auth.currentUser?.uid;

    if (userId != null) {
      final userDoc =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();

      if (userDoc.exists) {
        setState(() {
          _profilePictureUrl = userDoc['profilePicture'];
          _fullNameController.text = userDoc['fullName'] ?? '';
          _phoneNumberController.text = userDoc['phoneNumber'] ?? '';
          _emailController.text = userDoc['email'] ?? '';
          _dobController.text = userDoc['dateOfBirth'] ?? '';
        });
      }
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadProfileImage() async {
    if (_selectedImage == null) return;

    try {
      final userId = _auth.currentUser?.uid;

      if (userId == null) return;

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_pictures')
          .child('$userId.jpg');
      await storageRef.putFile(_selectedImage!);

      final imageUrl = await storageRef.getDownloadURL();

      setState(() {
        _profilePictureUrl = imageUrl;
      });

      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'profilePicture': imageUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profile picture updated successfully")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error uploading profile picture: $e")),
      );
    }
  }

  Future<void> _updateUserProfile() async {
    final userId = _auth.currentUser?.uid;

    if (userId != null) {
      try {
        await FirebaseFirestore.instance.collection('users').doc(userId).update({
          'fullName': _fullNameController.text,
          'phoneNumber': _phoneNumberController.text,
          'email': _emailController.text,
          'dateOfBirth': _dobController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile updated successfully")),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error updating profile: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.purple[100],
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!)
                        : (_profilePictureUrl != null
                        ? NetworkImage(_profilePictureUrl!)
                        : null),
                    child: (_selectedImage == null && _profilePictureUrl == null)
                        ? Icon(Icons.person, size: 50, color: Colors.grey)
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.edit, size: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildTextField("Full Name", _fullNameController),
              _buildTextField("Phone Number", _phoneNumberController),
              _buildTextField("Email", _emailController),
              _buildTextField("Date Of Birth", _dobController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await _uploadProfileImage();
                  await _updateUserProfile();
                },
                child: Text("Update Profile",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00BCD4),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
