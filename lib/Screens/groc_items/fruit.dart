import 'package:flutter/widgets.dart';

import '../items.dart';

class fruit extends StatefulWidget {
  const fruit({super.key});

  @override
  State<fruit> createState() => _fruitState();
}

class _fruitState extends State<fruit> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Align(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Row(
            children: [
              Items(
                image: 'assets/images/img-removebg-preview.png',
                name: 'fruit',
                time: '20',
                rating: '4.5',
                price: '120',
              ),
              Items(
                image: 'assets/images/img-removebg-preview.png',
                name: 'fruit',
                time: '20',
                rating: '4.5',
                price: '120',
              ),
            ],
          ),
          SizedBox(
            height: 17,
          ),
          Row(
            children: [
              Items(
                image: 'assets/images/img-removebg-preview.png',
                name: 'Avacado Salad',
                time: '20',
                rating: '4.5',
                price: '120',
              ),
              Items(
                image: 'assets/images/img-removebg-preview.png',
                name: 'Avacado Salad',
                time: '20',
                rating: '4.5',
                price: '120',
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
