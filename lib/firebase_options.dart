// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAnGor9fQbCI-subZWa0vOFlHF87tLYxR0',
    appId: '1:20844826489:web:431df25d658541be9329a8',
    messagingSenderId: '20844826489',
    projectId: 'mental1234',
    authDomain: 'mental1234.firebaseapp.com',
    storageBucket: 'mental1234.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBXby4Os1y_X7KdT1X4HIm_BxRDN3x7S0g',
    appId: '1:20844826489:android:8c26d0d87b4d91b79329a8',
    messagingSenderId: '20844826489',
    projectId: 'mental1234',
    storageBucket: 'mental1234.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsNd_AEKexzFQNuiq0J82Pj_pdfs0Rdcc',
    appId: '1:20844826489:ios:c9e7a0b868ea81359329a8',
    messagingSenderId: '20844826489',
    projectId: 'mental1234',
    storageBucket: 'mental1234.firebasestorage.app',
    iosBundleId: 'com.example.mentalHealthCare',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAnGor9fQbCI-subZWa0vOFlHF87tLYxR0',
    appId: '1:20844826489:web:aaf76599e4dc508c9329a8',
    messagingSenderId: '20844826489',
    projectId: 'mental1234',
    authDomain: 'mental1234.firebaseapp.com',
    storageBucket: 'mental1234.firebasestorage.app',
  );
}
