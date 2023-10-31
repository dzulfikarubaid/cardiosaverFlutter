import 'package:cardio_2/api/firebase_api.dart';
import 'package:cardio_2/features/auth_feature/view_model/auth_view_model.dart';
import 'package:cardio_2/features/chat_feature/view_model/chat_view_model.dart';
import 'package:cardio_2/features/splash_feature/views/welcome_screens.dart';
import 'package:cardio_2/utils/navbar_roots.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:get_storage/get_storage.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> _backgroundMessageHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);

  FirebaseApi.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(
            firebaseAuth: FirebaseAuth.instance,
            firebaseFirestore: firebaseFirestore,
          ),
        ),
        ChangeNotifierProvider(create: (_) => ChatViewModel()),
      ],
      child: GetMaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: FirebaseAuth.instance.currentUser == null
            ? const WelcomeScreen()
            : const NavBarRoots(),
      ),
    );
  }
}
