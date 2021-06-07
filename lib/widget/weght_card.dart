import 'package:flutter/material.dart';

class WeightCard extends StatelessWidget {
  final String text;
  final int weight;
  final VoidCallback increment;
  final VoidCallback decrement;

  const WeightCard(
      {Key? key,
      required this.increment,
      required this.decrement,
      required this.text,
      required this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(color: Color(0xff8d8e98), fontSize: 22),
              ),
            ),
            Text(
              '$weight',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Color(0x248d8e98),
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                        onPressed: decrement,
                        icon:
                            Icon(Icons.remove, color: Colors.white, size: 40)),
                  ),
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Color(0x248d8e98),
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                        color: Color(0xff1c1f32),
                        onPressed: increment,
                        icon: Icon(Icons.add, color: Colors.white, size: 40)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
