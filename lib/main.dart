import 'package:chat_gpt/dio_helper/dio_helper.dart';
import 'package:chat_gpt/screens/home_screen/home_screen.dart';
import 'package:chat_gpt/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  DioHelper.initDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SplashScreen.routeName: (_) => SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
