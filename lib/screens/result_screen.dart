import 'package:bmi_calculator/widget/custom_button.dart';
import 'package:flutter/material.dart';

class Resultscreen extends StatelessWidget {
  final double bmi;
  final Color? color;
  final String text;
  const Resultscreen(
      {Key? key, required this.bmi, this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('YOUR BMI'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0x248d8e98),
                    borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '$text',
                        style: TextStyle(fontSize: 26, color: color),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${bmi.toStringAsFixed(1)}',
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                    Text(
                      'Normal BMI range:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '18, - 25 kg/m2',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'You have a normal body\nweight. Good job!',
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Color(0xff0a0d22),
                      height: 60,
                      width: 200,
                      child: Text(
                        'SAVE RESULT',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          CustomButton(
              onPressed: () => Navigator.of(context).pop(),
              text: 'RE-CALCULATE YOUR BMI')
        ],
      ),
    );
  }
}
