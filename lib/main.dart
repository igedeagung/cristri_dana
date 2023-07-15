import 'package:flutter/material.dart';
import 'config/firebase_config.dart';
import 'fade_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseConfig.init();

  runApp(FadePageApp());
}