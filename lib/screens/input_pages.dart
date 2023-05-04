import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_widget.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/button_calculate.dart';
import 'package:bmi_calculator/components/round_icon.dart';
import 'package:bmi_calculator/components/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  // Color maleCardColor = inactiveCardKolor;
  // Color femaleCardColor = inactiveCardKolor;

  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff090C22),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
          },
        ),
        title: Text('BMI CALCULATOR',
          textAlign: TextAlign.right,

        ),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableWidget(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      kolor: selectedGender == Gender.male ? kActiveKolor : kInactiveCardKolor, //maleCardColor,
                      cardChild: cardChildWidget(
                        iconStyle: FontAwesomeIcons.mars,
                        textSex: 'MALE',),
                  ),
                  ),
                  Expanded(
                    child: ReusableWidget(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      kolor: selectedGender == Gender.female ? kActiveKolor : kInactiveCardKolor, //femaleCardColor,
                    cardChild: cardChildWidget(
                      iconStyle: FontAwesomeIcons.venus,
                      textSex: 'FEMALE',),
                  ),
                  ),
            ], // children
          )),
          // middle card
          Expanded(
            child: Container(
              child: ReusableWidget(
              kolor: kActiveKolor,
                onPress: () {  },
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),
                        style: kNumberTextStyle),
                      Text('cm'),
                    ],
                  ),
                SliderTheme(data: SliderTheme.of(context).copyWith(
                    inactiveTickMarkColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape:
                    RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape:
                    RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    min: 120.0, max: 220.0,
                    value: height.toDouble(),
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        // print(newValue);
                        height = newValue.round();
                      });
                       },),
                )
                ],
              ),
               ),
            ),
          ),
          //2 bottom cards
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableWidget(
                      kolor: kActiveKolor, onPress: () {  },
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text('WEIGHT',
                          style: kLabelTextStyle,),
                          Text(weight.toString(),
                              style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                },
                              ),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                              })
                            ],
                          )
                        ],
                      ),
                      )
                  ),

                  Expanded(
                      child: ReusableWidget(
                      kolor: kActiveKolor,onPress: () {},
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',
                          style: kLabelTextStyle),
                          Text(age.toString(),
                          style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                              },),
                              SizedBox(width: 10.0),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                              },),
                            ],
                          )
                        ],
                      ),),

                  ),
                ],
              )),
          ButtonCalculate(buttonTitle: 'CALCULATE',
            onTap: () {
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

            Navigator.push(
              context, MaterialPageRoute(builder: (context) => ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResults(),
              intepretation: calc.geInterpretations(),
            ))
            );
            },),
    ]
      ),);
  }
}
