import 'package:flutter/material.dart';

import '../../features/listening1/presentation/screen/questionType1Screen.dart';
import '../../features/route_generator.dart';
import '../utils/AppRoute.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoute.screen3 ,// change this to the first screen you want to show
      onGenerateRoute: RouteGenerator.generateRoute,
      //note : to naviigate from page to page use :
      //Navigator.pushNamed(context, "/signup");
      debugShowCheckedModeBanner: false,
      //  home:  SplashScreen(),  --->  //we will use it in the future
    );
  }
}

