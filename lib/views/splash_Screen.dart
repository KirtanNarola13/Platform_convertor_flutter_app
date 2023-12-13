import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'homepage');
    });
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('lib/Assets/splash_screen.gif'),
        ),
      ),
    );
  }
}
