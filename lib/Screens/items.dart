import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerry/utils/FavouriteItemList.dart';

import '../utils/colors.dart';

class Items extends StatefulWidget {
  const Items({
    Key? key,
    this.image,
    this.name,
    this.time,
    this.rating,
    this.price,
    this.onTapFull,
    this.onTapadd,
    this.index,
  }) : super(key: key);

  final String? image;
  final String? name;
  final String? time;
  final String? rating;
  final String? price;
  final VoidCallback? onTapFull;
  final VoidCallback? onTapadd;
  final int? index;

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: primaryColors,
        content: Text(message),
        duration: Duration(seconds: 1),
      ),
    );
  }

  bool _isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite; // Toggle the favorite state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: _scaffoldKey,
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
              left: 15,
              child: Container(
                height: 120,
                width: 130,
                child: Image.asset(
                  widget.image!,
                  fit: BoxFit.cover, // Ensure the image covers the container
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  if (!_isFavorite) {
                    _showSnackBar("Added to favourites");
                  } else {
                    _showSnackBar("Removed from favourites");
                  }
                  _toggleFavorite();
                  if (_isFavorite) {
                    fav(
                      favName: widget.name,
                      favImage: widget.image,
                      favPrice: widget.price,
                      onTapAdd: widget.onTapadd,
                    );
                  } else {
                    fitems.removeAt(widget.index!);
                  }
                },
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
                  widget.name!,
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
                    widget.rating!,
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
