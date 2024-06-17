import 'package:flutter/material.dart';

class header extends StatefulWidget {
  const header({super.key});

  @override
  State<header> createState() => _HeaderPartState();
}

class _HeaderPartState extends State<header> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: Icon(Icons.menu_open_rounded),
                  ),
                ),
              ),
              Center(
                child: Icon(Icons.location_on),
              )
            ],
          ),
        )
      ],
    );
  }
}
