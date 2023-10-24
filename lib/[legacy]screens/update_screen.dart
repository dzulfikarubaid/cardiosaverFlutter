import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  XFile? _image;
  String? base64Image;

  void initializeControllers() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      nameController = TextEditingController(text: user.displayName ?? '');
      emailController = TextEditingController(text: user.email ?? '');
    }

    final firestore = FirebaseFirestore.instance;
    final userUid = user?.uid;
    if (userUid != null) {
      firestore.collection('users').doc(userUid).get().then((userData) {
        if (userData.exists) {
          final data = userData.data() as Map<String, dynamic>;
          setState(() {
            ageController = TextEditingController(text: data['umur'] ?? '');
            addressController =
                TextEditingController(text: data['alamat'] ?? '');
          });
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    nameController = TextEditingController(text: user?.displayName ?? '');
    emailController = TextEditingController(text: user?.email ?? '');
    ageController = TextEditingController();
    addressController = TextEditingController();
    initializeControllers();
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _image = pickedFile;
        base64Image = base64Encode(bytes);
      });
    }
  }

  Future<String?> uploadImageToFirebaseStorage() async {
    final user = FirebaseAuth.instance.currentUser;
    final storage = FirebaseStorage.instance;

    if (user != null && _image != null) {
      try {
        final ref = storage.ref().child('profile_images/${user.uid}.jpg');
        final metadata = SettableMetadata(
          contentType: 'image/jpeg', // Ganti dengan jenis konten gambar yang sesuai
        );

        final uploadTask = ref.putData(
          await _image!.readAsBytes(),
          metadata,
        );

        final snapshot = await uploadTask.whenComplete(() {});
        final downloadURL = await snapshot.ref.getDownloadURL();

        return downloadURL;
      } catch (e) {
        print('Error uploading image to Firebase Storage: $e');
        return null;
      }
    }

    return null;
  }

  Future<void> _updateProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    Navigator.pop(context);
    if (user != null) {
      try {
        await user.updateDisplayName(nameController.text);
        await user.updateEmail(emailController.text);

        final imageUrl = await uploadImageToFirebaseStorage();

        if (imageUrl != null) {
          await user.updatePhotoURL(imageUrl);
        }

        final firestore = FirebaseFirestore.instance;
        final userUid = user.uid;
        if (userUid != null) {
          final userData = await firestore.collection('users').doc(userUid).get();
          if (!userData.exists) {
            await firestore.collection('users').doc(userUid).set({
              'umur': ageController.text,
              'alamat': addressController.text,
            });
          } else {
            await firestore.collection('users').doc(userUid).update({
              'full_name': nameController.text,
              'email': emailController.text,
              'umur': ageController.text,
              'alamat': addressController.text,
            });
          }
        }
      } catch (e) {
        print('Error updating profile: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _getImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _image != null
                    ? MemoryImage(base64Decode(base64Image!))
                    : null,
                child: _image == null ? Icon(Icons.add_a_photo) : null,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Umur'),
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _updateProfile();
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
