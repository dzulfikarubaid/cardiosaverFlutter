import 'dart:async';
import 'dart:typed_data';

import 'package:cardio_2/features/auth_feature/views/login_screen.dart';
import 'package:cardio_2/services/firebase_firestore_service.dart';
import 'package:cardio_2/services/firebase_storage_service.dart';
import 'package:cardio_2/utils/navbar_roots.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Status {
  uninitialized,
  authenticated,
  authenticating,
  authenticateError,
  authenticateException,
  authenticateCanceled,
}

class AuthViewModel with ChangeNotifier {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  bool loading = false;
  String errorText = '';

  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  setErrorText(String value) {
    errorText = value;
    notifyListeners();
  }

  AuthViewModel({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // LOGIN
  Future<void> login(String email, String password) async {
    setLoading(true);
    setErrorText('');

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.off(() => const NavBarRoots());

      setErrorText('');
      setLoading(false);
    } on FirebaseAuthException catch (e) {
      setLoading(false);

      if (e.code == 'user-not-found') {
        setErrorText('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        setErrorText('Wrong password provided.');
      } else if (e.code == 'invalid-email') {
        setErrorText('Please enter a valid email.');
      } else {
        setErrorText('An unknown error occurred.');
      }
    } catch (e) {
      setErrorText('An error occurred: $e');
      setLoading(false);
    }
    Timer(const Duration(seconds: 2), () {
      setErrorText('');
    });
  }

  // SIGNUP
  Future<void> register(String firstname, String email, String password,
      String phone, Uint8List? file, bool isDoctor) async {
    setLoading(true);
    setErrorText('');

    try {
      // signup with email password
      final user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // upload image to firestore
      final image = await FirebaseStorageService.uploadImage(
          file!, 'image/profile/${user.user!.uid}');

      //create user
      await FirebaseFirestoreService.createUser(
        image: image,
        email: user.user!.email!,
        isDoctor: isDoctor,
        uid: user.user!.uid,
        name: firstname,
      );

      Get.off(() => const LoginScreen());

      setErrorText('');
      setLoading(false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setErrorText('The password provided is too weak.');
        setLoading(false);
      } else if (e.code == 'email-already-in-use') {
        setErrorText('The account already exists for that email.');
        setLoading(false);
      } else {
        setErrorText('An unknown error occurred.');
        setLoading(false);
      }
    } catch (e) {
      setErrorText('An error occurred: $e');
      setLoading(false);
    }
    Timer(const Duration(seconds: 2), () {
      setErrorText('');
    });
  }
}
