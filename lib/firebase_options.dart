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
    apiKey: 'AIzaSyA9m5oQBcJxIfG06EUCs5LjgAGbVYIYlAY',
    appId: '1:444451116851:web:3d258988aaf928f5d35046',
    messagingSenderId: '444451116851',
    projectId: 'grocerry-selling-app-ecommerce',
    authDomain: 'grocerry-selling-app-ecommerce.firebaseapp.com',
    storageBucket: 'grocerry-selling-app-ecommerce.appspot.com',
    measurementId: 'G-EDL0DRECQ2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCC6yZPO3f8s5Kk9B8pEIsiqmrlFOpTHz8',
    appId: '1:444451116851:android:bfc2002c91fb562ad35046',
    messagingSenderId: '444451116851',
    projectId: 'grocerry-selling-app-ecommerce',
    storageBucket: 'grocerry-selling-app-ecommerce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA5-GOHNqpiaCJ3XwpkzLrD2gesfDrQJIY',
    appId: '1:444451116851:ios:edd771a15c12b96ed35046',
    messagingSenderId: '444451116851',
    projectId: 'grocerry-selling-app-ecommerce',
    storageBucket: 'grocerry-selling-app-ecommerce.appspot.com',
    iosBundleId: 'com.example.grocerry',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA5-GOHNqpiaCJ3XwpkzLrD2gesfDrQJIY',
    appId: '1:444451116851:ios:edd771a15c12b96ed35046',
    messagingSenderId: '444451116851',
    projectId: 'grocerry-selling-app-ecommerce',
    storageBucket: 'grocerry-selling-app-ecommerce.appspot.com',
    iosBundleId: 'com.example.grocerry',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA9m5oQBcJxIfG06EUCs5LjgAGbVYIYlAY',
    appId: '1:444451116851:web:125935befc115e26d35046',
    messagingSenderId: '444451116851',
    projectId: 'grocerry-selling-app-ecommerce',
    authDomain: 'grocerry-selling-app-ecommerce.firebaseapp.com',
    storageBucket: 'grocerry-selling-app-ecommerce.appspot.com',
    measurementId: 'G-DYB6X5RESY',
  );
}
