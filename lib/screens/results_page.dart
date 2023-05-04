import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'input_pages.dart';
import '../constants.dart';
import '../main.dart';
import '../components/button_calculate.dart';

class ResultsPage extends StatelessWidget {
  // const ResultsPage({Key? key}) : super(key: key);
  ResultsPage({required this.bmiResult, required this.resultText, required this.intepretation});

  final String bmiResult;
  final String resultText;
  final String intepretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child:
          Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,)),
          ),
          Expanded(
            flex: 5,
            child: ReusableWidget(
                kolor: kActiveKolor,
            onPress: () {},
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(resultText.toUpperCase(), style: kResultTextStyle, textAlign: TextAlign.center,),
                Text(bmiResult, style: kBMITextStyle, textAlign: TextAlign.center,),
                Text(intepretation,
                  style: kBodyTextStyle, textAlign: TextAlign.center,),
              ],
            ),
            ),

          ),
          ButtonCalculate(onTap: () {
            Navigator.pop(context);
          }, buttonTitle: 'RE-CALCULATE'),
        ],
      ),

    );
  }
}
