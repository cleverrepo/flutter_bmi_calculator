import 'dart:math';

class ResultCalculation {
  final double height;
  final double weight;
  late double result;
  late String message;

  ResultCalculation({required this.height, required this.weight, required double result});

  double calculateBMI() {
    result = weight / pow(height / 100, 2);
    return result;
  }

  String getDescription() {
    if (result >= 25) {
      message = "Overweight";
      return "You have a higher weight than normal. Try to lose weight through physical activity.";
    } else if (result >= 18.5) {
      message = "Normal weight";
      return "You have a normal weight. Keep it up!";
    } else {
      message = "Underweight";
      return "Your weight is less than normal. Try to gain more weight.";
    }
  }
}