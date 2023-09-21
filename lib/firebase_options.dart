// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB3AhEYnuLIqsTAn3O3GaYn_9OaQtx6rdM',
    appId: '1:208302366620:web:895ca4a8f4290fff5cb259',
    messagingSenderId: '208302366620',
    projectId: 'esp32-gilang-data',
    authDomain: 'esp32-gilang-data.firebaseapp.com',
    databaseURL: 'https://esp32-gilang-data-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'esp32-gilang-data.appspot.com',
    measurementId: 'G-S6BWTCGGEL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANANK3G9voA0u5caYGmkzSZrmuBwZH7Fc',
    appId: '1:208302366620:android:96572ddaf83bf2625cb259',
    messagingSenderId: '208302366620',
    projectId: 'esp32-gilang-data',
    databaseURL: 'https://esp32-gilang-data-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'esp32-gilang-data.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8naB8XZkTAeyg8JAGXswdXaQowDa3XAA',
    appId: '1:208302366620:ios:cde81388df2b18295cb259',
    messagingSenderId: '208302366620',
    projectId: 'esp32-gilang-data',
    databaseURL: 'https://esp32-gilang-data-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'esp32-gilang-data.appspot.com',
    iosBundleId: 'com.example.cardio2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8naB8XZkTAeyg8JAGXswdXaQowDa3XAA',
    appId: '1:208302366620:ios:785ba9552da332565cb259',
    messagingSenderId: '208302366620',
    projectId: 'esp32-gilang-data',
    databaseURL: 'https://esp32-gilang-data-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'esp32-gilang-data.appspot.com',
    iosBundleId: 'com.example.cardio2.RunnerTests',
  );
}
