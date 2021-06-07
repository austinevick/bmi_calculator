import 'package:flutter/material.dart';

class AlertDialogContent extends StatelessWidget {
  const AlertDialogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('BMI'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(fontSize: 18),
              ))
        ],
        content: Text(
            'Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women.'));
  }
}
