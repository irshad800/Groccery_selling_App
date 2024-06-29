import 'package:flutter/material.dart';
import 'package:grocerry/Screens/Checkout.dart';
import 'package:grocerry/Screens/homeScreen.dart';
import 'package:grocerry/Services/FirestoreServices.dart';

import '../models/Cartmodels.dart';
import '../utils/CartList.dart';
import '../utils/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartState();
}

class _CartState extends State<CartScreen> {
  final FirestoreServices _firestoreServices = FirestoreServices();

  double total = 0;

  @override
  void initState() {
    super.initState();
    _listenToCartStream();
  }

  void _listenToCartStream() {
    _firestoreServices.getCart().listen((carts) {
      _calculateTotal(carts);
    });
  }

  void _calculateTotal(List<Cart> carts) {
    total = 0;
    for (var cart in carts) {
      total += cart.price * cart.qty;
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
            ),
          );
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
                                if (Citems == null || Citems.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: primaryColors,
                                          content: Text("Add items to Cart")));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PaymentDetails(
                                                ChTotal: total,
                                              )));
                                }
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
                child: Container(
                  child: StreamBuilder<List<Cart>>(
                    stream: _firestoreServices.getCart(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      List<Cart> carts = snapshot.data ?? [];
                      return ListView.builder(
                        itemCount: carts.length,
                        itemBuilder: (context, index) {
                          Cart cart = carts[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(children: [
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
                                    "assets/images/img_3.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  title: Text(
                                    cart.itemName,
                                    style: TextStyle(fontFamily: "Airbnb"),
                                  ),
                                  subtitle: Text(
                                    '₹${cart.price * cart.qty}',
                                    style: TextStyle(fontFamily: "Airbnb"),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () async {
                                      await _firestoreServices
                                          .deleteCart(cart.id!);
                                      setState(() {
                                        print("a");
                                        _calculateTotal(carts);
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ]),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
