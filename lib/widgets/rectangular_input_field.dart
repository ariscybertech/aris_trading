import 'package:flutter/material.dart';
import 'package:trading_application/constants/constants.dart';

import 'text_field_container.dart';


class RectangularInputField extends StatelessWidget {

  final String hintText;
  final IconData icon;
  final bool obscureText;

  const RectangularInputField({Key? key, required this.hintText, required this.icon, required this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        cursorColor: black,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: black.withOpacity(0.5),
            fontSize: 18,
          ),
          prefixIcon: Icon(icon,color: black.withOpacity(0.5),size: 20,),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
