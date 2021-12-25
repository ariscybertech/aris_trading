import 'package:flutter/material.dart';
import 'package:trading_application/constants/constants.dart';
import 'package:trading_application/screens/sign_in/sigin_screen.dart';
import 'package:trading_application/widgets/rectangular_button.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(appPadding),
      child: Center(
          child: RectangularButton(
        text: 'Logout',
        press: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SignInScreen(),
            ),
          );
        },
      )),
    );
  }
}
