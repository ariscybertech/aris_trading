import 'package:flutter/material.dart';
import 'package:trading_application/constants/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: appPadding / 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal,width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
