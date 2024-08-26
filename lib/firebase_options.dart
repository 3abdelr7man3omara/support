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
        return macos;
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
    apiKey: 'AIzaSyDYrO9BDVhF0WZo5T-JQSW6Kdc3skFbSHQ',
    appId: '1:30488494644:web:fe2fc391506857422c0061',
    messagingSenderId: '30488494644',
    projectId: 'supprt-fa9c0',
    authDomain: 'supprt-fa9c0.firebaseapp.com',
    storageBucket: 'supprt-fa9c0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfvAbdnqaFTigWAhCi5I6dS2U0UEvYy_c',
    appId: '1:30488494644:android:fce4a2e5a0a4b1ab2c0061',
    messagingSenderId: '30488494644',
    projectId: 'supprt-fa9c0',
    storageBucket: 'supprt-fa9c0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpnhtGfLLI2k6K1LQW_M0qsQc2bJluLLc',
    appId: '1:30488494644:ios:f41b9738b22c1eab2c0061',
    messagingSenderId: '30488494644',
    projectId: 'supprt-fa9c0',
    storageBucket: 'supprt-fa9c0.appspot.com',
    iosBundleId: 'com.example.untitled2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpnhtGfLLI2k6K1LQW_M0qsQc2bJluLLc',
    appId: '1:30488494644:ios:f41b9738b22c1eab2c0061',
    messagingSenderId: '30488494644',
    projectId: 'supprt-fa9c0',
    storageBucket: 'supprt-fa9c0.appspot.com',
    iosBundleId: 'com.example.untitled2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDYrO9BDVhF0WZo5T-JQSW6Kdc3skFbSHQ',
    appId: '1:30488494644:web:b77639b2ce12f0222c0061',
    messagingSenderId: '30488494644',
    projectId: 'supprt-fa9c0',
    authDomain: 'supprt-fa9c0.firebaseapp.com',
    storageBucket: 'supprt-fa9c0.appspot.com',
  );

}