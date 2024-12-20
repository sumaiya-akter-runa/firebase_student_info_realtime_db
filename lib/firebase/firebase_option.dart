
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
            'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: 'AIzaSyBbTtaZr2CBIxt8FjlWMmxzN0MnRaeWfPw',
      appId: '1:735023328235:android:61aff996f4204dfd3587ae',
      messagingSenderId: '735023328235',
      projectId: 'student-info-6aae5',
      storageBucket: 'student-info-6aae5.firebasestorage.app',
      databaseURL:
      'https://student-info-6aae5-default-rtdb.firebaseio.com/');

  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: 'AIzaSyBbTtaZr2CBIxt8FjlWMmxzN0MnRaeWfPw',
      appId: '1:735023328235:android:61aff996f4204dfd3587ae',
      messagingSenderId: '735023328235',
      projectId: 'student-info-6aae5',
      storageBucket: 'student-info-6aae5.firebasestorage.app',
      iosBundleId: 'com.myapp.firebase_note_app_realtime_db',
      databaseURL:
      'https://student-info-6aae5-default-rtdb.firebaseio.com/');
}