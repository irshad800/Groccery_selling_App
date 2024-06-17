import 'package:flutter/widgets.dart';

import '../items.dart';

class vegetable extends StatefulWidget {
  const vegetable({super.key});

  @override
  State<vegetable> createState() => _vegetableState();
}

class _vegetableState extends State<vegetable> {
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
