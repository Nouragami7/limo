import 'package:flutter/material.dart';
import 'package:limo/features/listening1/presentation/screen/questionType1Screen.dart';

import 'core/app/app.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: QuestionType1Screen(),
        ),
      ),
    ),
  );
}


