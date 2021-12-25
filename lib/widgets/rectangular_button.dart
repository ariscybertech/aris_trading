import 'package:flutter/material.dart';
import 'package:trading_application/constants/constants.dart';

class RectangularButton extends StatelessWidget {
  final String text;
  final VoidCallback press;

  const RectangularButton({Key? key, required this.text, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.only(top: appPadding,bottom: appPadding /2),
        child: Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
              color: primary,
          ),
          child: Center(
            child: Text(text,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: white,
            ),),
          ),
        ),
      ),
    );
  }
}
