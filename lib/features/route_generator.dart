import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limo/features/auth/presentation/screen/login_screen.dart';
import 'package:limo/features/questions_route/Screen/question_router_screen.dart';
import 'package:limo/features/questions_route/cubit/question_flow_cubit.dart';
import 'package:limo/features/translation1/presentation/screen/questionType2Screen.dart';
import '../core/app/splash_screen.dart';
import '../core/utils/AppRoute.dart';
import 'home/presentation/screen/home_screen.dart';
import 'questions_route/repo/questions_repo.dart';

import 'auth/presentation/screen/signup_screen.dart';
import 'listening1/presentation/screen/questionType1Screen.dart';
import 'listening12/presentation/screen/questionType1_2Screen.dart';


class RouteGenerator{
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case AppRoute.questions:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) =>
            QuestionFlowCubit(QuestionsRepository())..start(),
            child: QuestionRouterScreen(),
          ),
        );

            case AppRoute.splash:
              return MaterialPageRoute(builder: (context)=> SplashScreen());
            case AppRoute.signup:
              return MaterialPageRoute(builder: (context)=> SignUpScreen());
            case AppRoute.login:
              return MaterialPageRoute(builder: (context)=> LoginScreen());
      case AppRoute.home:
        return MaterialPageRoute(builder: (context)=> HomeScreen());




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