import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  static void init() async {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDNvO4JPmmZvRN0IFnt_l8ufHOrYjpzLCo",
          authDomain: "wedding-af134.firebaseapp.com",
          databaseURL: "https://wedding-af134-default-rtdb.firebaseio.com",
          projectId: "wedding-af134",
          storageBucket: "wedding-af134.appspot.com",
          messagingSenderId: "119404814869",
          appId: "1:119404814869:web:af45454e310bb1c7dee41c",
          measurementId: "G-9CNJ8P82DE"),
    );
  }
}
