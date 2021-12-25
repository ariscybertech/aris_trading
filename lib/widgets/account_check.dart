import 'package:flutter/material.dart';
import 'package:trading_application/constants/constants.dart';

class AccountCheck extends StatelessWidget {

  final bool login;
  final VoidCallback press;

  const AccountCheck({Key? key, required this.login, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an Account?" : "Already have an Account?",
          style: TextStyle(fontSize: 16,color: primary,),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: primary,),
          ),
        ),
      ],
    );
  }
}
