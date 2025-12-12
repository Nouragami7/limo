import 'package:flutter/material.dart';
import 'package:limo/features/auth/presentation/screen/login_screen.dart';
import 'package:limo/features/translation1/presentation/screen/questionType2Screen.dart';
import '../core/app/splash_screen.dart';
import '../core/utils/AppRoute.dart';
import 'auth/presentation/screen/signup_screen.dart';
import 'listening1/presentation/screen/questionType1Screen.dart';
import 'listening12/presentation/screen/questionType1_2Screen.dart';


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

            case AppRoute.screen2:
              return MaterialPageRoute(builder: (context)=> QuestionType12Screen());
              case AppRoute.screen3:
              return MaterialPageRoute(builder: (context)=> QuestionType2Screen());
            case AppRoute.splash:
              return MaterialPageRoute(builder: (context)=> SplashScreen());
            case AppRoute.signup:
              return MaterialPageRoute(builder: (context)=> SignUpScreen());
            case AppRoute.login:
              return MaterialPageRoute(builder: (context)=> LoginScreen());



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