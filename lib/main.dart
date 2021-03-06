import 'dart:io';

import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

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
      home: MyHomePage(title: ""),
    );
  }
}
//AWS SERVER
//PW: VIC2021
//User: openvpn
//Color(0xff04040c),Color(0xff6f7693),Color(0xfffd0225)
//https://dribbble.com/shots/4585382-Simple-BMI-Calculator/attachments/1036693?mode=media
//8Ez9b5M

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('test.flutter.dev/battery');
  int batteryLevel = 0;

  int _batteryLevel = 0;
  Future<void> _getBatterLevel() async {
    try {
      final int result = await platform.invokeMethod("getBatteryLevel");
      batteryLevel = result;
    } on PlatformException catch (e) {
      throw Exception(e.message);
    }
    setState(() => _batteryLevel = batteryLevel);
  }

  //int currentPosition = 0;
  int maxPosition = 100;
  // double get percent => currentPosition / maxPosition;
  double get percentage => _batteryLevel / maxPosition;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    // For your reference print the AppDoc directory
    print('File path: ' + directory.path);

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  // Future<File> insertIntoFile() async {
  //   final file = await _localFile;
  //   var p = file.path.;
  //   return p;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Determine battery level in android'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 150,
                color: Colors.white,
                child: TextButton(
                    onPressed: () {
                      _localPath;
                    },
                    child: Text('Get file path')),
              ),
            ),
            Text(
              '$batteryLevel%',
              style: TextStyle(fontSize: 35),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedCounter(
                percent: percentage,
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 150,
                color: Colors.white,
                child: TextButton(
                    onPressed: () {
                      _getBatterLevel();
                    },
                    child: Text('Get battery Level')),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: () {
      //         setState(() {
      //           if (currentPosition < maxPosition) currentPosition++;
      //         });
      //       },
      //       tooltip: 'Increment',
      //       child: Icon(Icons.add),
      //     ),
      //     SizedBox(width: 10),
      //     FloatingActionButton(
      //       onPressed: () {
      //         setState(() {
      //           if (currentPosition > 0) currentPosition--;
      //         });
      //       },
      //       tooltip: 'decrement',
      //       child: Icon(Icons.remove),
      //     ),
      //   ],
      // ),
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
