import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffeb1555),
      ),
      height: 80,
      width: double.infinity,
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            '$text',
            style: TextStyle(fontSize: 22, color: Colors.white),
          )),
    );
  }
}
