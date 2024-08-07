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
    apiKey: 'AIzaSyDbAag0NElhH55SZGns7Myaf2Z1HPnPMPU',
    appId: '1:629674024056:web:e0d35af7d6c77c12bda18d',
    messagingSenderId: '629674024056',
    projectId: 'fluttertodoapp-3167f',
    authDomain: 'fluttertodoapp-3167f.firebaseapp.com',
    storageBucket: 'fluttertodoapp-3167f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3yCyDKJO8cfA2O-QoUiX6-ohhNGpDK2I',
    appId: '1:629674024056:android:04dd1e1af7f0b5fabda18d',
    messagingSenderId: '629674024056',
    projectId: 'fluttertodoapp-3167f',
    storageBucket: 'fluttertodoapp-3167f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCzv-mFzop6p6XNCgEW4tMC2Zj9YTaguFw',
    appId: '1:629674024056:ios:8147e88eb51e50cbbda18d',
    messagingSenderId: '629674024056',
    projectId: 'fluttertodoapp-3167f',
    storageBucket: 'fluttertodoapp-3167f.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCzv-mFzop6p6XNCgEW4tMC2Zj9YTaguFw',
    appId: '1:629674024056:ios:8147e88eb51e50cbbda18d',
    messagingSenderId: '629674024056',
    projectId: 'fluttertodoapp-3167f',
    storageBucket: 'fluttertodoapp-3167f.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDbAag0NElhH55SZGns7Myaf2Z1HPnPMPU',
    appId: '1:629674024056:web:1e8bb9c5b78a159dbda18d',
    messagingSenderId: '629674024056',
    projectId: 'fluttertodoapp-3167f',
    authDomain: 'fluttertodoapp-3167f.firebaseapp.com',
    storageBucket: 'fluttertodoapp-3167f.appspot.com',
  );

}