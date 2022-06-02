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
    apiKey: 'AIzaSyBmiBLhgx0BataTXQyfMhqLE2ZubkrNC9I',
    appId: '1:706264711653:web:6212692d50e52b572aaf0c',
    messagingSenderId: '706264711653',
    projectId: 'flutter-todo-app-1',
    authDomain: 'flutter-todo-app-1.firebaseapp.com',
    storageBucket: 'flutter-todo-app-1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDE_-zsZ2ovycT2u2RvVrw5vM0jpG0kEPU',
    appId: '1:706264711653:android:51550894e3c92e702aaf0c',
    messagingSenderId: '706264711653',
    projectId: 'flutter-todo-app-1',
    storageBucket: 'flutter-todo-app-1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCoWrNSb-i8oTak-binV9H4Skxt6rEGsmc',
    appId: '1:706264711653:ios:b9d1799acae782cf2aaf0c',
    messagingSenderId: '706264711653',
    projectId: 'flutter-todo-app-1',
    storageBucket: 'flutter-todo-app-1.appspot.com',
    iosClientId: '706264711653-l024t8s127dqfn4tj5j55gkh20v9gpi8.apps.googleusercontent.com',
    iosBundleId: 'com.pentaio.flutterTodoApp1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCoWrNSb-i8oTak-binV9H4Skxt6rEGsmc',
    appId: '1:706264711653:ios:b9d1799acae782cf2aaf0c',
    messagingSenderId: '706264711653',
    projectId: 'flutter-todo-app-1',
    storageBucket: 'flutter-todo-app-1.appspot.com',
    iosClientId: '706264711653-l024t8s127dqfn4tj5j55gkh20v9gpi8.apps.googleusercontent.com',
    iosBundleId: 'com.pentaio.flutterTodoApp1',
  );
}