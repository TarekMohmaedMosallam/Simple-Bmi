import 'dart:math';

class CalcutateBmi {
  static double calculateBmi(double weight, double height) {
    return weight / pow(height / 100, 2);
  }
}
