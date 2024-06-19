import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocerry/Screens/welcome_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    home: welcomePage(),
  ));
}
