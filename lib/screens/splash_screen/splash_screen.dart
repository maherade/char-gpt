import 'dart:async';

import 'package:flutter/material.dart';

import '../home_screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Container(
      decoration: const BoxDecoration(color: Color(0xff434654)),
      child: Image.asset('assets/images/chat_gpt.png'),

      // TODO Animated splash Screen
      // AnimatedSplashScreen(
      //   splash: 'assets/images/chat_logo.png',
      //   nextScreen: HomeScreen(),
      //   splashTransition: SplashTransition.rotationTransition,
      //   pageTransitionType: PageTransitionType.scale,
      // )
    );
  }
}
