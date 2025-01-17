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
    apiKey: 'AIzaSyAK_QLz33uv7d0--JQAXNgFet3o0JbAdSU',
    appId: '1:437806188494:web:5ce129fb9a0e29b9224d9f',
    messagingSenderId: '437806188494',
    projectId: 'userapplication-acaec',
    authDomain: 'userapplication-acaec.firebaseapp.com',
    storageBucket: 'userapplication-acaec.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCR5ycyeUWy7XQOAv00wfMyxOrtgGt-t5Y',
    appId: '1:437806188494:android:bea8ad92c7ba3351224d9f',
    messagingSenderId: '437806188494',
    projectId: 'userapplication-acaec',
    storageBucket: 'userapplication-acaec.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdL_oRGkfKGR34cn8Z0Z0h9TzKL1dvKCM',
    appId: '1:437806188494:ios:82d724e2cc81492d224d9f',
    messagingSenderId: '437806188494',
    projectId: 'userapplication-acaec',
    storageBucket: 'userapplication-acaec.firebasestorage.app',
    iosBundleId: 'com.example.schedule',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAK_QLz33uv7d0--JQAXNgFet3o0JbAdSU',
    appId: '1:437806188494:web:e8787e66093ee99f224d9f',
    messagingSenderId: '437806188494',
    projectId: 'userapplication-acaec',
    authDomain: 'userapplication-acaec.firebaseapp.com',
    storageBucket: 'userapplication-acaec.firebasestorage.app',
  );
}
