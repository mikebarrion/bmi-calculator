import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class cardChildWidget extends StatelessWidget {
  // const cardChildWidget({this.iconStyle, super.key, });
  cardChildWidget({required this.iconStyle, required this.textSex, });
  final IconData iconStyle;
  final String textSex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconStyle,
          size: 60.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(textSex, style: kLabelTextStyle,
        ),
      ],
    );
  }
}