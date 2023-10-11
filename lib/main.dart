import 'package:cardio_2/api/firebase_api.dart';
import 'package:cardio_2/screens/notif_to_maps_screen.dart';
import 'package:cardio_2/screens/welcome_screens.dart';
import 'package:cardio_2/widgets/navbar_roots.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'firebase_options.dart';
import 'package:get_storage/get_storage.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  //Remove this method to stop OneSignal Debugging
  // OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  // OneSignal.initialize(
  //     "77e32082-ea27-42e3-a898-c72e141824ef"); // Perlu Diganti dengan ID akun cardio saver

  // OneSignal.Notifications.requestPermission(true);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  FirebaseApi.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    notificationHandler();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        debugPrint('User is signed in!');
      }
    });
  }

  void notificationHandler() {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    FirebaseMessaging.onMessage.listen((event) async {
      await FirebaseApi.pushNotification(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null
          ? const WelcomeScreen()
          : const NavBarRoots(),
    );
  }
}
