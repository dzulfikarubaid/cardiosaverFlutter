import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cardio_2/screens/login_screen.dart';
import 'package:cardio_2/screens/update_screen.dart';
import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  String profileImageUrl = "";

  Future<void> getProfileImageUrl() async {
      setState(() {
        profileImageUrl = user?.photoURL ?? '';
      });
  }
  // Function to sign out the user
  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(), // Replace with your login screen
        ),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }
  @override
  void initState() {
    super.initState();
    getProfileImageUrl(); // Panggil fungsi untuk mendapatkan URL gambar profil saat inisialisasi
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UpdateProfileScreen(),
                ),
              );
            },
            leading: CircleAvatar(
              maxRadius: 30,
              backgroundImage: NetworkImage(profileImageUrl), // Gunakan URL gambar profil
            ),
            title: StreamBuilder<User?>(
              stream: _auth.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  final user = snapshot.data;
                  if (user != null) {
                    return Text(
                      user.displayName ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    );
                  }
                }
                return Text(
                  'Guest',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                );
              },
            ),
            subtitle: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(_auth.currentUser?.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Text(
                    'Umur: Belum diatur',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  );
                }
                final userData = snapshot.data!.data()!;
                final userAge = userData['umur'] ?? 'Belum diatur';
                return Text(
                  'Umur: $userAge',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                );
              },
            ),
          ),
          Divider(
            height: 25,
            thickness: 2,
            color: Colors.black26,
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.people_alt_outlined,
                color: Colors.black54,
                size: 30,
              ),
            ),
            title: const Text(
              "Linked Account",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.person_outlined,
                color: Colors.black54,
                size: 30,
              ),
            ),
            title: const Text(
              "Account",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                CupertinoIcons.globe,
                color: Colors.black54,
                size: 30,
              ),
            ),
            title: const Text(
              "Language",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          Divider(
            height: 20,
            thickness: 2,
            color: Colors.black26,
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                CupertinoIcons.exclamationmark_circle,
                color: Colors.black54,
                size: 30,
              ),
            ),
            title: const Text(
              "About",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.help_outline_rounded,
                color: Colors.black54,
                size: 30,
              ),
            ),
            title: const Text(
              "Help",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.feedback_outlined,
                color: Colors.black54,
                size: 30,
              ),
            ),
            title: const Text(
              "Feedback",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          Divider(
            height: 20,
            thickness: 2,
            color: Colors.black26,
          ),
          ListTile(
            onTap: () {
              _signOut(context); // Call the sign-out function
            },
            leading: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.logout_outlined,
                color: Colors.black54,
                size: 30,
              ),
            ),
            title: const Text(
              "Log out",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
