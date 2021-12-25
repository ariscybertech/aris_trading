import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trading_application/constants/constants.dart';


import 'components/credentials.dart';
import 'components/head_text.dart';
import 'components/social.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadText(),
            Credentials(),
            Social(),
          ],
        ),
      ),
    );
  }
}
