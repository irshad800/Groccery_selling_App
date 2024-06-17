import 'package:flutter/widgets.dart';

import '../items.dart';

class food extends StatefulWidget {
  const food({super.key});

  @override
  State<food> createState() => _foodState();
}

class _foodState extends State<food> {
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
                image: 'assets/images/img_3-removebg-preview.png',
                name: 'Burger',
                time: '30',
                rating: '5.0',
                price: '150',
              ),
            ],
          ),
          SizedBox(
            height: 17,
          ),
          Row(
            children: [
              Items(
                image: 'assets/images/por-removebg-preview.png',
                name: 'Poratta',
                time: '20',
                rating: '4.5',
                price: '12',
              ),
              Items(
                image: 'assets/images/mandhi-removebg-preview.png',
                name: 'Kuzhi Mandhi',
                time: '25',
                rating: '4.5',
                price: '160',
              ),
            ],
          ),
          SizedBox(
            height: 10,
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
