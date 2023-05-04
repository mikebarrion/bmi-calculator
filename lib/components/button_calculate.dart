import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ButtonCalculate extends StatelessWidget {
  const ButtonCalculate({
    required this.onTap, required this.buttonTitle
  });
  final Function() onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerKolor,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(buttonTitle,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,

              ),),
          ],
        ),
      ),
    );
  }
}
