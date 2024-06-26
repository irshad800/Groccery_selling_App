import 'package:flutter/material.dart';

import '../details.dart';
import '../items.dart'; // Adjust import as per your project structure

class fruit extends StatefulWidget {
  fruit({Key? key, required this.searchQuery}) : super(key: key);
  final String searchQuery;
  @override
  State<fruit> createState() => _FoodState();
}

class _FoodState extends State<fruit> {
  final List<Map<String, String>> fruititems = [
    {
      "image": "assets/images/img-removebg-preview.png",
      "name": "fruit",
      "time": "20",
      "rating": "4.5",
      "price": "120",
    },
    {
      "image": "assets/images/img-removebg-preview.png",
      "name": "fruit",
      "time": "30",
      "rating": "5.0",
      "price": "150",
    },
    {
      "image": "assets/images/por-removebg-preview.png",
      "name": "Poratta",
      "time": "20",
      "rating": "4.5",
      "price": "12",
    },
    {
      "image": "assets/images/mandhi-removebg-preview.png",
      "name": "Kuzhi Mandhi",
      "time": "25",
      "rating": "4.5",
      "price": "160",
    },
    {
      "image": "assets/images/img-removebg-preview.png",
      "name": "Avocado Salad",
      "time": "20",
      "rating": "4.5",
      "price": "120",
    },
    {
      "image": "assets/images/img-removebg-preview.png",
      "name": "Avocado Salad",
      "time": "20",
      "rating": "4.5",
      "price": "120",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredfruitItems = fruititems
        .where((item) => item['name']!
            .toLowerCase()
            .contains(widget.searchQuery.toLowerCase()))
        .toList();
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
          childAspectRatio: 0.82,
        ),
        itemCount: filteredfruitItems.length,
        itemBuilder: (context, index) {
          final item = fruititems[index];
          return Items(
            image: item['image']!,
            name: item['name']!,
            time: item['time']!,
            rating: item['rating']!,
            price: item['price']!,
            onTapFull: () {
              // Handle full item tap
            },
            onTapadd: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => details(
                    dImage: item['image']!,
                    dName: item['name'],
                    dCalorie: double.parse(item['rating']!),
                    dPrice: int.parse(item['price']!),
                    dRating: double.parse(item['rating']!),
                    dTime: int.parse(item['time']!),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
