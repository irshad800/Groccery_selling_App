import 'package:flutter/material.dart';
import 'package:grocerry/Screens/PaymentSuccesfull.dart';
import 'package:grocerry/Screens/UserAdress.dart';

import '../../utils/colors.dart';
import '../Services/FirestoreServices.dart';
import '../models/Cartmodels.dart';
import 'PaymentScreen.dart';

class PaymentDetails extends StatefulWidget {
  PaymentDetails({
    super.key,
    this.ChTotal,
  });

  final double? ChTotal;

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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

  Future<void> _updateCartQuantity(Cart cart, int newQty) async {
    if (newQty < 1) return;
    await _firestoreServices.updateCartQuantity(cart.id!, newQty);
    setState(() {
      cart.qty = newQty;
      _calculateTotal([cart]); // Recalculate total for the updated cart
    });
  }

  Future<void> _deleteCartItem(String cartId) async {
    await _firestoreServices.deleteCart(cartId);
  }

  @override
  Widget build(BuildContext context) {
    double deliveryCharge = 30.0;
    double totalAmount = total + deliveryCharge;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return false;
        },
        child: Container(
          color: primaryColors,
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 15,
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.1),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 127,
                child: Text(
                  "CheckOut",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Airbnb",
                    color: Colors.white70,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                top: 99,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 20, left: 20, top: 10),
                        child: Container(
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: StreamBuilder<List<Cart>>(
                            stream: _firestoreServices.getCart(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              List<Cart> carts = snapshot.data ?? [];
                              if (carts.isEmpty) {
                                return Center(
                                  child: Image.asset("assets/images/img_5.png"),
                                );
                              }
                              return ListView.builder(
                                itemCount: carts.length,
                                itemBuilder: (context, index) {
                                  var cart = carts[index];
                                  return ListTile(
                                    dense: true,
                                    tileColor: primaryColors,
                                    title: Text(
                                      cart.itemName,
                                      style: TextStyle(),
                                    ),
                                    subtitle: Text("Qty: ${cart.qty}"),
                                    trailing: Text(
                                      "₹${cart.price * cart.qty}",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Scroll to view all",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Container(width: 300, child: Divider()),
                      Padding(
                        padding: EdgeInsets.only(right: 20, left: 30),
                        child: Row(
                          children: [
                            Text(
                              "Address:",
                              style: TextStyle(
                                  fontFamily: "Airbnb",
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 133,
                            ),
                            ElevatedButton(
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
                                        builder: (context) => UserAdress()));
                              },
                              child: const Text(
                                "Add",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20, left: 30),
                        child: Row(
                          children: [
                            Text(
                              "Payment:",
                              style: TextStyle(
                                  fontFamily: "Airbnb",
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 116,
                            ),
                            ElevatedButton(
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
                                        builder: (context) => PaymentMethod()));
                              },
                              child: const Text(
                                "Select",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(width: 300, child: Divider()),
                      Padding(
                        padding: EdgeInsets.all(30),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Sub total:",
                                    style: TextStyle(
                                        fontFamily: "Airbnb",
                                        fontSize: 17,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  Text(
                                    "₹${total.toStringAsFixed(1)}",
                                    style: TextStyle(
                                        fontFamily: "Airbnb",
                                        fontSize: 17,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Delivery:",
                                    style: TextStyle(
                                        fontFamily: "Airbnb",
                                        fontSize: 17,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: 125,
                                  ),
                                  Text(
                                    "₹${deliveryCharge.toStringAsFixed(1)}",
                                    style: TextStyle(
                                        fontFamily: "Airbnb",
                                        fontSize: 17,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(width: 300, child: Divider()),
                              Row(
                                children: [
                                  Text(
                                    "Total:",
                                    style: TextStyle(
                                        fontFamily: "Airbnb",
                                        fontSize: 25,
                                        color: primaryColors),
                                  ),
                                  SizedBox(
                                    width: 115,
                                  ),
                                  Text(
                                    "₹${totalAmount.toStringAsFixed(1)}",
                                    style: TextStyle(
                                      fontFamily: "Airbnb",
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "ThankYou.Enjoy.Explore",
                        style: TextStyle(
                            color: primaryColors, fontFamily: "Airbnb"),
                      ),
                      SizedBox(
                        height: 38,
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        height: 55,
                        width: 400,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColors,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentSuccesfull(),
                                ));
                          },
                          child: Text(
                            "Place Order",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      )
                    ],
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
