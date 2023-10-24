import 'dart:async';

import 'package:cardio_2/features/auth_feature/views/login_screen.dart';
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

class AuthViewModel extends ChangeNotifier {
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
  Future<void> register(String firstname, String lastname, String email,
      String password, String phone) async {
    setLoading(true);
    setErrorText('');

    try {
      String fullname = "$firstname $lastname";

      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = credential.user;
      if (user != null) {
        await user.updateDisplayName(fullname);
      }

      // Create a Firestore document for the registered user
      await firebaseFirestore
          .collection('users')
          .doc(credential.user?.uid)
          .set({
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'phone_number': phone,
      });

      Get.off(() => const LoginScreen());

      setErrorText('');
      setLoading(false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setErrorText('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        setErrorText('The account already exists for that email.');
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
}
