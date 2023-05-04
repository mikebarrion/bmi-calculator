import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;
  double _bmi=0;

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResults() {
    if(_bmi >= 25) {
      return 'Overweight';
    }
    else if(_bmi > 18.5) {
      return 'Normal';
    }
    else {
      return 'Underweight';
    }
  }
  String geInterpretations() {
    if(_bmi >= 25) {
      return 'You need more exercise and diet.';
    }
    else if(_bmi > 18.5) {
      return 'You\'re doing good! Keep it up!';
    }
    else {
      return 'Eat a lot more.';
    }
  }
}