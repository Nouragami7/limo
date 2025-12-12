import 'package:flutter/material.dart';
import 'package:limo/features/listening1/presentation/screen/questionType1Screen.dart';

import 'core/app/app.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'firebase_options.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}





