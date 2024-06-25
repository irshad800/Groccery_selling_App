import 'package:flutter/material.dart';
import 'package:grocerry/Screens/PaymentScreen.dart';
import 'package:grocerry/Screens/UserAdress.dart';
import 'package:grocerry/utils/CartList.dart';

import '../../utils/colors.dart';

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

  double total = 0;
  @override
  void initState() {
    _calculateTotal();
    super.initState();
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
                          child: ListView.builder(
                            itemCount: Citems.length,
                            itemBuilder: (context, index) {
                              var item = Citems[index];
                              return ListTile(
                                dense: true,
                                tileColor: primaryColors,
                                title: Text(
                                  item['name'],
                                  style: TextStyle(),
                                ),
                                subtitle: Text("Qty: ${item['qty']}"),
                                trailing:
                                    Text("₹${item['price'] * item['qty']}",
                                        style: TextStyle(
                                          fontSize: 12,
                                        )),
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
                              "Adress:",
                              style: TextStyle(
                                  fontFamily: "Airbnb",
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 149,
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
                                    "$total",
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
                          onPressed: () {},
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
