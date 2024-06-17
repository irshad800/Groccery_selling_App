import 'package:flutter/material.dart';
import 'package:grocerry/utils/colors.dart';

import 'homeScreen.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColors,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                  child: Image.asset(
                "assets/images/groc1-removebg-preview.png",
                height: 270,
                width: 270,
              )),
            ),
            Text(
              "Fast delivery at \n your door step",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 37,
                  height: 1.2),
            ),
            SizedBox(height: 30),
            Text(
              "Home delivery and online reservation \n        system for restuarent&cafe",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  height: 1.2),
            ),
            SizedBox(
              height: 140,
            ),
            Container(
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                child: Text(
                  "Let's Explore",
                  style: TextStyle(color: primaryColors, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
