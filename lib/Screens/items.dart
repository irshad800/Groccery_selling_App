import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Items extends StatefulWidget {
  const Items({
    super.key,
    required this.image,
    required this.name,
    required this.time,
    required this.rating,
    required this.price,
    this.onTapFull,
    this.onTapadd,
  });

  final String image;
  final String name;
  final String time;
  final String rating;
  final String price;
  final VoidCallback? onTapFull;
  final VoidCallback? onTapadd;

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  bool _isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.grey[300],
        ),
        height: 220,
        width: 158,
        child: Stack(
          children: [
            Positioned(
              top: 9,
              left: 1,
              child: Container(
                height: 120,
                width: 150,
                child: Image.asset(
                  widget.image,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: _toggleFavorite,
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? Colors.red : null,
                ),
              ),
            ),
            Positioned(
              bottom: 63,
              left: 10,
              right: 15,
              child: Center(
                child: Text(
                  widget.name,
                  style: TextStyle(fontFamily: "Airbnb"),
                ),
              ),
            ),
            Positioned(
              bottom: 46,
              left: 12,
              right: 2,
              child: Row(
                children: [
                  Text(
                    "${widget.time} min",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      fontFamily: "Airbnb",
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(width: 68),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 15,
                  ),
                  Text(
                    widget.rating,
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 8,
              left: 10,
              child: Text(
                "₹${widget.price}",
                style: TextStyle(fontSize: 21, fontFamily: "Airbnb"),
              ),
            ),
            Positioned(
              bottom: 1,
              right: 1,
              child: GestureDetector(
                onTap: widget.onTapadd,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: primaryColors,
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.plus,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
