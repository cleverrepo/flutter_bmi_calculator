import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Calculation extends StatelessWidget {
  const Calculation({super.key, required this.bmiResult, required this.resultText, });
  final String bmiResult;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        },
        icon: const Icon(Icons.arrow_back_ios),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset:
                    const Offset(0, 1), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(

                    'Your BMI result is ${bmiResult.toString()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(

                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      ' $resultText',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
