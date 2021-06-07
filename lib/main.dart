import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'landing_page_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff0a0d22),
          cardColor: Color(0xff1d1f33),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xff0a0d22),
          )),
      home: HomeScreen(),
    );
  }
}
//AWS SERVER
//PW: VIC2021
//User: openvpn
//Color(0xff04040c),Color(0xff6f7693),Color(0xfffd0225)
//https://dribbble.com/shots/4585382-Simple-BMI-Calculator/attachments/1036693?mode=media

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
//8Ez9b5M

class _MyHomePageState extends State<MyHomePage> {
  int currentPosition = 0;
  int maxPosition = 5;
  double get percent => currentPosition / maxPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedDefaultTextStyle(
                child: Text('${(percent) * 100} %'),
                style: TextStyle(fontSize: 22),
                duration: Duration(seconds: 1)),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedCounter(
                percent: percent,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (currentPosition < maxPosition) currentPosition++;
              });
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (currentPosition > 0) currentPosition--;
              });
            },
            tooltip: 'decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class AnimatedCounter extends StatelessWidget {
  final double? percent;
  const AnimatedCounter({Key? key, this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final border = BorderRadius.circular(15);
      return Container(
        alignment: Alignment.centerLeft,
        height: 18,
        decoration: BoxDecoration(color: Colors.blue, borderRadius: border),
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: constraints.maxWidth * percent!,
          decoration: BoxDecoration(color: Colors.red, borderRadius: border),
        ),
      );
    });
  }
}
