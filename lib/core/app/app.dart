import 'package:flutter/material.dart';

import '../../features/listening1/presentation/screen/questionType1Screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: QuestionType1Screen(),
        ),
      ),
    );
  }
}
