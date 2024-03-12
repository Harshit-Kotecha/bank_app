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
    apiKey: 'AIzaSyCLK0UqwCnaQG0YqvzOdYVFA1wg5Q5tUkM',
    appId: '1:819249440938:web:c70399455f9eef3bf348d3',
    messagingSenderId: '819249440938',
    projectId: 'bank-app-56492',
    authDomain: 'bank-app-56492.firebaseapp.com',
    storageBucket: 'bank-app-56492.appspot.com',
    measurementId: 'G-65JJCLCFEF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmuaLPQm09TBGQiacvaObfnRTOIqwNMMU',
    appId: '1:819249440938:android:ef5b97e099c8a4adf348d3',
    messagingSenderId: '819249440938',
    projectId: 'bank-app-56492',
    storageBucket: 'bank-app-56492.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0sBkUtEcdrXxKE_wW6uiLLJGd6RTO0to',
    appId: '1:819249440938:ios:13567bfeef618239f348d3',
    messagingSenderId: '819249440938',
    projectId: 'bank-app-56492',
    storageBucket: 'bank-app-56492.appspot.com',
    iosBundleId: 'com.example.bankApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0sBkUtEcdrXxKE_wW6uiLLJGd6RTO0to',
    appId: '1:819249440938:ios:380c39d860f4af6ef348d3',
    messagingSenderId: '819249440938',
    projectId: 'bank-app-56492',
    storageBucket: 'bank-app-56492.appspot.com',
    iosBundleId: 'com.example.bankApp.RunnerTests',
  );
}
