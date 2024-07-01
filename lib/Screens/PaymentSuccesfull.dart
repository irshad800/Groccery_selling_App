import 'package:flutter/material.dart';
import 'package:grocerry/Screens/homeScreen.dart';

import '../utils/colors.dart';

class PaymentSuccesfull extends StatefulWidget {
  const PaymentSuccesfull({super.key});

  @override
  State<PaymentSuccesfull> createState() => _PaymentSuccesfullState();
}

class _PaymentSuccesfullState extends State<PaymentSuccesfull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColors,
        child: Stack(children: [
          Positioned(
            top: 280,
            right: 10,
            left: 10,
            child: Image.asset("assets/images/img_7.png"),
          ),
          Positioned(
            top: 50,
            left: 90,
            child: Text(
              "Order Summary",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                fontFamily: "Airbnb",
                color: Colors.white70,
              ),
            ),
          ),
          Positioned(
            bottom: 250,
            left: 110,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScaffold(),
                    ));
              },
              child: Text(
                "Home Page",
                style: TextStyle(color: primaryColors, fontSize: 18),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
