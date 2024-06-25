import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocerry/Screens/Checkout.dart';
import 'package:grocerry/Screens/homeScreen.dart';

import '../utils/CartList.dart';
import '../utils/colors.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double total = 0;

  @override
  void initState() {
    super.initState();
    _calculateTotal();
  }

  void _calculateTotal() {
    total = 0;
    for (var item in Citems) {
      total += item['price'] * item['qty'];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: () async {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainScaffold(),
            ));
        return false;
      },
      child: Container(
        color: primaryColors,
        child: Stack(
          children: [
            Positioned(
              top: 15,
              left: 15,
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1),
                child: InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScaffold(),
                            ));
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              top: 75,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              height: 100,
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        right: 10,
                        child: Container(
                          height: 60,
                          width: 130,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColors,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentDetails(
                                            ChTotal: total,
                                          )));
                            },
                            child: const Text(
                              "CheckOut>>",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 35,
                        left: 25,
                        child: Text(
                          "Total:",
                          style: TextStyle(
                            fontFamily: "Airbnb",
                            fontSize: 25,
                            color: primaryColors,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 35,
                        left: 110,
                        child: Text(
                          "₹$total",
                          style: const TextStyle(
                            fontFamily: "Airbnb",
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 15,
              left: 150,
              child: Text(
                "Cart",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Airbnb",
                  color: Colors.white70,
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: 15,
              right: 15,
              bottom: 120,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 9,
                  childAspectRatio: 3,
                ),
                itemCount: Citems.length,
                itemBuilder: (context, index) {
                  var item = Citems[index];
                  return Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            item['image'],
                            width: 40,
                            height: 40,
                          ),
                          title: Text(
                            item['name'],
                            style: TextStyle(
                              fontFamily: "Airbnb",
                              color: primaryColors,
                            ),
                          ),
                          subtitle: Text(
                            "₹${item['price'] * item['qty']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Airbnb",
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Positioned(
                        bottom: 6,
                        right: -2,
                        child: Container(
                          height: 50,
                          width: 122,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(17),
                            ),
                            color: primaryColors,
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                iconSize: 20,
                                onPressed: () {
                                  setState(() {
                                    if (item['qty'] > 1) {
                                      item['qty']--;
                                      _calculateTotal();
                                    }
                                  });
                                },
                                icon: const Icon(
                                  CupertinoIcons.minus,
                                  color: Colors.white,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "${item['qty']}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              IconButton(
                                iconSize: 20,
                                onPressed: () {
                                  setState(() {
                                    item['qty']++;
                                    _calculateTotal();
                                  });
                                },
                                icon: const Icon(
                                  CupertinoIcons.plus,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 2,
                        right: 4,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              Citems.removeAt(index);
                              _calculateTotal();
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: primaryColors,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
