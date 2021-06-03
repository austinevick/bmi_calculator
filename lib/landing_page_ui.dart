import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff452e6b),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Transactions',
                style: TextStyle(fontSize: 22),
              ),
            ),
            SizedBox(height: 18),
            Container(
              height: MediaQuery.of(context).size.height / 1.3,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInImage(
                    height: 300,
                    image: AssetImage(
                      'images/img.jpg',
                    ),
                    placeholder: AssetImage(
                      'images/placeholder.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'No Transaction yet',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    'The journey of a million coins begins with',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  Text(
                    'one trade! Let\'s get you started.',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff452e6b),
                          borderRadius: BorderRadius.circular(8)),
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Start a Trade',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
