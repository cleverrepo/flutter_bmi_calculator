import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BmiState extends ChangeNotifier{
  int age = 0;
  double weight = 0.1;
  int get _age=>age;
  double get _weight=>weight;
bool toggled =false;
bool get _toggled =>false;
late SharedPreferences preferences;
final darkTheme=ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
);
final lightTheme=ThemeData(
  primaryColor: Colors.white,
  brightness: Brightness.light,
);
changeTheme()async{
  toggled =!toggled;
 await preferences.setBool("_toggles", toggled);
notifyListeners();
}
initializeTheme()async{
  preferences = await SharedPreferences.getInstance();
  toggled = preferences.getBool("_toggles")?? false;
  notifyListeners();
}
void weightIncrement() {
  weight+=0.1;

  notifyListeners();
}
void weightDecrement() {
  weight==5? weight:weight--;
  notifyListeners();
}
void ageIncrement() {
  age++;
  notifyListeners();
}
void ageDecrement() {
  age==1? age:age--;
  notifyListeners();
}
}