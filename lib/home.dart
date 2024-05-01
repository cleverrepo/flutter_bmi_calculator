import 'package:bmi_calculator/calculation_page.dart';
import 'package:bmi_calculator/services/logics.dart';
import 'package:bmi_calculator/widgets/drawer.dart';
import 'package:bmi_calculator/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'calculation_page.dart';
import 'calculation_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

bool selected = false;

String selectedIndex = "Inches";
List<String> options = [
  "Inches",
  "Centimeters",
  "Feet",
  "Meters",
];
double bmiResult = 0.0;
double weight = 10;
double heightValue = 150;

int age = 10;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {


    return Consumer<BmiState>(
      builder: (context, bmi, child) => Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: Container(
                      height: 100,
                      width: 85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("Assets/female.png"),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text("Female",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      )),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      height: 100,
                      width: 85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("Assets/male-gender.png"),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text("Female",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
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
                      const Text(
                        "weight",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        heightValue.toStringAsFixed(1),
                        style:
                            const TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Slider(
                          secondaryTrackValue: 10,
                          allowedInteraction: SliderInteraction.tapAndSlide,
                          max: 400,
                          min: 0,
                          activeColor: Colors.blue,
                          thumbColor: Colors.red,
                          label: "Weight",
                          value: heightValue.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              heightValue = value.toDouble();
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              // Change border color when focused
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                          ),
                          isDense: true,
                          isExpanded: true,
                          dropdownColor: Colors.red,
                          iconEnabledColor: Colors.black,
                          icon: const Icon(Icons.arrow_drop_down_sharp),
                          value: selectedIndex,
                          items: options
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedIndex = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 150,
                    width: 150,
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
                        const Text("Weight",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("${weight.toStringAsFixed(1)} kg",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (weight > 0.1) {
                                    weight -= 0.1;
                                  } else {
                                    weight = 0;
                                  }
                                });
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Center(
                                  child: Icon(Icons.remove),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  weight += 0.1;
                                });
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                Container(
                    height: 150,
                    width: 150,
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
                        const Text("Age",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(age.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (age > 0) {
                                    age -= 1;
                                  } else {
                                    age = 0;
                                  }
                                });
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Center(child: Icon(Icons.remove)),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  age += 1;
                                });
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Center(child: Icon(Icons.add)),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            navigation(heightValue);
          },
          child: Container(
            width: 300,
            height: 60,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: const Center(
              child: Text(
                "Calculate",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigation(double res) {
    ResultCalculation resultCalculation = ResultCalculation(
      height: heightValue,
      weight: weight,
      result: res,
    );
    Get.to(() => Calculation(
      bmiResult: resultCalculation.calculateBMI().toStringAsFixed(1),
      resultText: resultCalculation.getDescription(),
    ));
  }
}
