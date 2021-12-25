import 'package:flutter/material.dart';
import 'package:trading_application/constants/constants.dart';
import 'package:trading_application/screens/sign_in/sigin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trading App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: SignInScreen(),
    );
  }
}

