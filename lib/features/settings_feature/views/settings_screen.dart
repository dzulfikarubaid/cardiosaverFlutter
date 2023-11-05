import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cardio_2/features/auth_feature/views/login_screen.dart';
import 'package:cardio_2/%5Blegacy%5Dscreens/update_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  String? profileImageUrl;
  String? userDisplayName = 'Guest'; // Default display name
  String? userAge = 'Belum diatur'; // Default age

  // Fungsi untuk mengambil display name dari FirebaseAuth
  Future<void> getDisplayName() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      setState(() {
        userDisplayName = currentUser.displayName ?? 'Guest';
      });
    }
  }

  Future<void> getProfileImageUrl() async {
    setState(() {
      profileImageUrl = user?.photoURL ??
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/2048px-User-avatar.svg.png';
    });
  }

  // Fungsi untuk mengambil umur dari Firestore
  Future<String?> getUserAgeFromFirestore() async {
    final docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .get();

    if (docSnapshot.exists) {
      final userData = docSnapshot.data() as Map<String, dynamic>;
      return userData['umur'] as String?;
    } else {
      return null;
    }
  }

  // Fungsi untuk mengambil umur dari SharedPreferences
  Future<void> getUserAge() async {
    final prefs = await SharedPreferences.getInstance();
    String age = prefs.getString('umur') ?? 'Belum diatur';

    setState(() {
      userAge = age;
    });
  }

  // Fungsi untuk menyimpan umur ke SharedPreferences
  Future<void> setUserAge(String age) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('umur', age);
  }

  // Fungsi untuk logout
  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }



  @override
  void initState() {
    super.initState();
    getDisplayName(); // Ambil display name saat inisialisasi
    getProfileImageUrl();
    getUserAgeFromFirestore().then((value) {
      if (value != null) {
        setUserAge(value);
        getUserAge(); // Ambil umur dari SharedPreferences saat inisialisasi
      }
    });
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
              backgroundImage: NetworkImage(profileImageUrl.toString()),
            ),
            title: Text(
              userDisplayName ?? 'Guest',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            subtitle: Text(
              'Umur: $userAge',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Divider(
            height: 25,
            thickness: 2,
            color: Colors.black26,
          ),
          // ...
          // Daftar item pengaturan lainnya
          // ...
          buildListTile(
            title: "Log out",
            icon: Icons.logout_outlined,
            onTap: () {
              _signOut(context);
            },
          ),
          buildListTile(
            title: "Linked device",
            icon: Icons.usb,
            onTap: () {
              _showLinkedDeviceModal(context);
            },
          ),
        ],
      ),
    );
  }

  ListTile buildListTile({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(10),
        child: Icon(
          icon,
          color: Colors.black54,
          size: 30,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
void _showLinkedDeviceModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Linked Devices",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildDeviceContainer("Device 1", context),
            _buildDeviceContainer("Device 2", context),
            _buildDeviceContainer("Device 3", context),
          ],
        ),
      );
    },
  );
}

Widget _buildDeviceContainer(String deviceName, BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  return InkWell(
    onTap: () {
      _showDevicePopup(context, deviceName);
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: screenWidth,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              Icons.usb,
              color: Colors.blue,
              size: 24,
            ),
            SizedBox(width: 10),
            Text(
              deviceName,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


void _showDevicePopup(BuildContext context, String deviceName) {
  String uniqueCode = '';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // Ubah radius ke 5
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  uniqueCode == "111"
                      ? Column(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 64,
                      ),
                      SizedBox(height: 10),
                      Text("Successfully connected to $deviceName", style: TextStyle(fontSize: 18)),
                    ],
                  )
                      : Column(
                    children: [
                      Text("Allow conncetion with $deviceName ?", style: TextStyle( fontSize: 16,fontWeight: FontWeight.w700),),
                      SizedBox(height: 10),
                      Text("To continue, please enter a unique code on the device:"),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Unique Code",
                        ),
                        onChanged: (value) {
                          setState(() {
                            uniqueCode = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
