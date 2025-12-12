import 'package:flutter/material.dart';
import 'package:limo/core/constants/assets.dart';
import 'package:limo/core/constants/colors.dart';
import 'package:limo/core/utils/AppRoute.dart';

import '../utils/user_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showImage = false;

  @override
  void initState() {
    super.initState();

    _startFlow();
  }

  Future<void> _startFlow() async {

    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() => showImage = true);

    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;

    final isLoggedIn = await UserPrefs.isLoggedIn();

    Navigator.pushReplacementNamed(
      context,
      isLoggedIn ? AppRoute.home : AppRoute.login,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          child: showImage
              ? Column(
            key: const ValueKey("image"),
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Assets.logo, height: 360),
              const SizedBox(height: 24),
              const Text(
                "Limo",
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
              : const Text(
            "Byrowni",
            key: ValueKey("text"),
            style: TextStyle(
              fontSize: 48,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
