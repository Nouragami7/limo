import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/data/repositories/authentication_repository.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/listening1/presentation/screen/questionType1Screen.dart';
import '../../features/route_generator.dart';
import '../utils/AppRoute.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
      create: (_) => AuthCubit(AuthenticationRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.splash,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

