import 'package:flutter/material.dart';

import '../core/utils/AppRoute.dart';
import 'listening1/presentation/screen/questionType1Screen.dart';


class RouteGenerator{
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      // case AppRoute.on_board:
      //     return MaterialPageRoute(builder: (context)=> OnBoardingScreen());
      //   case AppRoute.signup:
      //   return MaterialPageRoute(builder: (context)=> SignUpScreen());
      case AppRoute.screen1:
        return MaterialPageRoute(builder: (context)=>  QuestionType1Screen());
        // case AppRoute.splash:
        //   return MaterialPageRoute(builder: (context)=> SplashScreen());
        //   case AppRoute.home:
        //   return MaterialPageRoute(builder: (context)=> BlocProvider(create: (_)=> HomeCubit(Repo(newsService: MealsService(), dbHelper: DataBaseHelper())),child: HomeScreen()));
        //     case AppRoute.login:
        //       return MaterialPageRoute(builder: (context)=> LoginScreen());


      default:
        return MaterialPageRoute(builder: (context){
          return Scaffold(
            body: Center(
              child: Text("No route found"),
            ),
          );
        });
    }

  }
}