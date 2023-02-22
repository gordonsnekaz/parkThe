import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:parkthe/login.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: const [
          Text(
            'Enroute',
            style: TextStyle(
                color: Color(0xff4F4F4F),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'from',
            style: TextStyle(
                color: Color(0xff4F4F4F),
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Boys',
            style: TextStyle(
                color: Color(0xff4F4F4F),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      backgroundColor: const Color(0xff000000),
      nextScreen: LoginPage(),
      splashIconSize: 100,
      duration: 3000,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
