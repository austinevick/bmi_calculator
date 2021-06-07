import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String image;
  final String text;
  final Color iconColor;
  final Color textColor;
  final VoidCallback onTap;
  const GenderCard(
      {Key? key,
      required this.onTap,
      required this.image,
      required this.text,
      required this.iconColor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(image, height: 85, color: iconColor),
              ),
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 22),
              )
            ],
          ),
        ),
      ),
    );
  }
}
