import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/screens/home_screen.dart';
import 'package:flutter_chat_app/presentation/screens/registration_screen.dart';
import 'package:flutter_chat_app/presentation/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => WelcomeScreen(),
        ),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Ant Chat",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
