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
    apiKey: 'AIzaSyAAdYqiMBTLKtcSdNkv0FG9_lOK7eV20eI',
    appId: '1:340063232683:web:9106cc8cef3a105d1b8dee',
    messagingSenderId: '340063232683',
    projectId: 'beudeliveryclone-16a45',
    authDomain: 'beudeliveryclone-16a45.firebaseapp.com',
    storageBucket: 'beudeliveryclone-16a45.appspot.com',
    measurementId: 'G-WD3HPNLE64',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfaA_K69JQZLc9WNz5ndR0cHPBTxwSqgU',
    appId: '1:340063232683:android:d4cd10fea3c9c21e1b8dee',
    messagingSenderId: '340063232683',
    projectId: 'beudeliveryclone-16a45',
    storageBucket: 'beudeliveryclone-16a45.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFlYudqOmTVvtUN3Zyxtq31OjhYv8u8-A',
    appId: '1:340063232683:ios:38e68d7d24bb0c4b1b8dee',
    messagingSenderId: '340063232683',
    projectId: 'beudeliveryclone-16a45',
    storageBucket: 'beudeliveryclone-16a45.appspot.com',
    iosClientId: '340063232683-5c0bf9i88j9li7o87n074j2odpo8raau.apps.googleusercontent.com',
    iosBundleId: 'com.example.userapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFlYudqOmTVvtUN3Zyxtq31OjhYv8u8-A',
    appId: '1:340063232683:ios:38e68d7d24bb0c4b1b8dee',
    messagingSenderId: '340063232683',
    projectId: 'beudeliveryclone-16a45',
    storageBucket: 'beudeliveryclone-16a45.appspot.com',
    iosClientId: '340063232683-5c0bf9i88j9li7o87n074j2odpo8raau.apps.googleusercontent.com',
    iosBundleId: 'com.example.userapp',
  );
}
