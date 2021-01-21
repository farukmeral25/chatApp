import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/screens/splash_screen.dart';
import 'package:flutter_chat_app/presentation/widgets/theme/style.dart';
import 'injection_container.dart' as di;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: greenColor,
      ),
      home: SplashScreen(),
    );
  }
}
