import 'dart:math';

import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/widget/alert_dialog_content.dart';
import 'package:bmi_calculator/widget/custom_button.dart';
import 'package:bmi_calculator/widget/gender_card.dart';
import 'package:bmi_calculator/widget/weght_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

enum Gender { Male, Female }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int weight = 30;
  int age = 15;
  int height = 5;
  var bmi = 0.0;
  Gender selectedGender = Gender.Male;
  Color color = Colors.white;
  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      showDialog(context: context, builder: (ctx) => AlertDialogContent());
    });
    super.initState();
  }

  double get calculateBMI => bmi = weight / pow(height / 100, 2);
  String get getText {
    if (calculateBMI >= 25.0) {
      color = Colors.red;
      return 'OVERWEIGHT';
    } else if (calculateBMI >= 18.5 || calculateBMI == 24.9) {
      color = Colors.green;
      return 'HEALTHY';
    } else if (calculateBMI < 18.5) {
      color = Colors.red.shade200;
      return 'UNDERWEIGHT';
    } else {
      color = Colors.red;
      return 'Obesity';
    }
  }

  String get getInterpretation {
    return '';
  }

  String get getRange {
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Row(
              children: [
                GenderCard(
                    onTap: () => setState(() => selectedGender = Gender.Male),
                    iconColor: selectedGender != Gender.Male
                        ? Color(0xff8d8e98)
                        : Colors.white,
                    textColor: selectedGender != Gender.Male
                        ? Color(0xff8d8e98)
                        : Colors.white,
                    image: 'images/male.png',
                    text: 'MALE'),
                GenderCard(
                    onTap: () => setState(() => selectedGender = Gender.Female),
                    iconColor: selectedGender != Gender.Female
                        ? Color(0xff8d8e98)
                        : Colors.white,
                    textColor: selectedGender != Gender.Female
                        ? Color(0xff8d8e98)
                        : Colors.white,
                    image: 'images/female.png',
                    text: 'FEMALE'),
              ],
            ),
          ),
          Expanded(
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'HEIGHT',
                      style: TextStyle(color: Color(0xff8d8e98), fontSize: 22),
                    ),
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$height',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          color: Color(0xff8d8e98),
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          trackHeight: 3,
                          inactiveTrackColor: Color(0xff8d8e95),
                          overlayColor: Color(0x29eb1555),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xffeb1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 14),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                        max: 500,
                        min: 5,
                        value: height.toDouble(),
                        onChanged: (value) =>
                            setState(() => height = value.round()),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                WeightCard(
                    increment: () => setState(() => weight++),
                    decrement: () => setState(() => weight--),
                    text: 'WEIGHT',
                    weight: weight),
                WeightCard(
                    increment: () => setState(() => age++),
                    decrement: () => setState(() => age--),
                    text: 'AGE',
                    weight: age),
              ],
            ),
          ),
          const SizedBox(height: 15),
          CustomButton(
            text: 'CALCULATE YOUR BMI',
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              var _bmi = calculateBMI;
              var _text = getText;
              return Resultscreen(
                text: _text,
                color: color,
                bmi: _bmi,
              );
            })),
          )
        ],
      ),
    );
  }
}
