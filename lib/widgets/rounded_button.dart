import 'package:flutter/material.dart';
import 'package:trading_application/constants/constants.dart';


class RoundedButton extends StatelessWidget {
  final String imageSrc;
  final VoidCallback press;

  const RoundedButton({Key? key, required this.imageSrc, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.only(top: appPadding,bottom: appPadding /2),
        child: Container(
          padding: EdgeInsets.all(appPadding / 2),
          width: 65,
          height: 65,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: primary,width: 2),

          ),
          child: Image.asset(imageSrc),
        ),
      ),
    );
  }
}
