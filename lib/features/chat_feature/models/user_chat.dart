import 'package:cardio_2/utils/firestore_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserChat {
  final String id;
  final String photoUrl;
  final String nickname;
  final String aboutMe;

  const UserChat(
      {required this.id,
      required this.photoUrl,
      required this.nickname,
      required this.aboutMe});

  Map<String, String> toJson() {
    return {
      FirestoreConstants.nickname: nickname,
      FirestoreConstants.aboutMe: aboutMe,
      FirestoreConstants.photoUrl: photoUrl,
    };
  }

  factory UserChat.fromDocument(DocumentSnapshot doc) {
    String aboutMe = "";
    String photoUrl = "";
    String nickname = "";
    try {
      aboutMe = doc.get(FirestoreConstants.aboutMe);
    } catch (e) {
      debugPrint('error $e');
    }
    try {
      photoUrl = doc.get(FirestoreConstants.photoUrl);
    } catch (e) {
      debugPrint('error $e');
    }
    try {
      nickname = doc.get(FirestoreConstants.nickname);
    } catch (e) {
      debugPrint('error $e');
    }

    return UserChat(
      id: doc.id,
      photoUrl: photoUrl,
      nickname: nickname,
      aboutMe: aboutMe,
    );
  }
}
