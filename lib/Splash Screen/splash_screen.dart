import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/HomeScreen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash_screen';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
    return Scaffold(
        body: Image.asset(
      'assets/images/splash.png',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    ));
  }
}
