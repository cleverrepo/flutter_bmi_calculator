import 'package:bmi_calculator/services/logics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() {
  Get.put(BmiState());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (_)=>BmiState()..initializeTheme(),
      child: Consumer <BmiState>(
        builder: (context, bmiState, child) {

          return GetMaterialApp(
            title: 'Flutter Demo',
            themeMode: bmiState.toggled?ThemeMode.dark:ThemeMode.light,
            darkTheme: bmiState.toggled?bmiState.darkTheme:bmiState.lightTheme,
            home: const Home(),
            debugShowCheckedModeBanner: false,
          );
        },

      ),
    );

}}
