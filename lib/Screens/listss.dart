import 'package:flutter/material.dart';
import 'package:grocerry/utils/colors.dart';

class list extends StatefulWidget {
  list({super.key, required this.name, required this.isSelected});
  String name;
  bool isSelected;

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  @override
  Widget build(BuildContext context) {
    return widget.isSelected
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: primaryColors,
            ),
            child: Text(
              widget.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        : Text(
            widget.name,
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          );
  }
}
