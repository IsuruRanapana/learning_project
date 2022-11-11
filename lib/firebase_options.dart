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
    apiKey: 'AIzaSyBaQkMBy5TmaDhmVKw53bReOuzWbQT-NNg',
    appId: '1:910272864456:web:a26369f51d02d33ea5c5fd',
    messagingSenderId: '910272864456',
    projectId: 'learning-ddd-practice',
    authDomain: 'learning-ddd-practice.firebaseapp.com',
    storageBucket: 'learning-ddd-practice.appspot.com',
    measurementId: 'G-VJZB0XJD9R',   );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLVxqAO-rGYpsf_WctuQiTmwFveVxOZCE',
    appId: '1:910272864456:android:7c102c2c098386fda5c5fd',
    messagingSenderId: '910272864456',
    projectId: 'learning-ddd-practice',
    storageBucket: 'learning-ddd-practice.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTcWbhmQus2ZYrzORJetjNy5CqGOgFaMY',
    appId: '1:910272864456:ios:9cc2f975d6226214a5c5fd',
    messagingSenderId: '910272864456',
    projectId: 'learning-ddd-practice',
    storageBucket: 'learning-ddd-practice.appspot.com',
    iosClientId: '910272864456-48i859ih7rqae2a51kjh3bqftu9dc3je.apps.googleusercontent.com',
    iosBundleId: 'com.example.learningProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCTcWbhmQus2ZYrzORJetjNy5CqGOgFaMY',
    appId: '1:910272864456:ios:9cc2f975d6226214a5c5fd',
    messagingSenderId: '910272864456',
    projectId: 'learning-ddd-practice',
    storageBucket: 'learning-ddd-practice.appspot.com',
    iosClientId: '910272864456-48i859ih7rqae2a51kjh3bqftu9dc3je.apps.googleusercontent.com',
    iosBundleId: 'com.example.learningProject',
  );
}
