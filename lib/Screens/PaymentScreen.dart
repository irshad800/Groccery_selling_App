import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'Checkout.dart'; // Make sure you have a colors.dart file with primaryColors defined

class PaymentMethod extends StatefulWidget {
  PaymentMethod({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  State<PaymentMethod> createState() => _PaymentMethod();
}

class _PaymentMethod extends State<PaymentMethod> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _showSnackBar() {
    ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: primaryColors,
        content: Text('Message sent Succesfully'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  String? _selectedPaymentMethod;
  void _handleRadioValueChange(String? value) {
    setState(() {
      _selectedPaymentMethod = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
            color:
                primaryColors, // Ensure primaryColors is defined in colors.dart
            child: Stack(children: [
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
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Select Payment Method:',
                            style:
                                TextStyle(color: primaryColors, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Column(
                              children: [
                                RadioListTile<String>(
                                  title: const Text('UPI'),
                                  value: 'UPI',
                                  activeColor: primaryColors,
                                  groupValue: _selectedPaymentMethod,
                                  onChanged: _handleRadioValueChange,
                                ),
                                RadioListTile<String>(
                                  title: const Text('Cash on Delivery'),
                                  activeColor: primaryColors,
                                  value: 'Cash on Delivery',
                                  groupValue: _selectedPaymentMethod,
                                  onChanged: _handleRadioValueChange,
                                ),
                                RadioListTile<String>(
                                  title: const Text('Card'),
                                  value: 'Card',
                                  activeColor: primaryColors,
                                  groupValue: _selectedPaymentMethod,
                                  onChanged: _handleRadioValueChange,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Center(
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
                                          builder: (context) =>
                                              PaymentDetails()));
                                },
                                child: const Text(
                                  "ADD",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
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
                left: 90,
                child: Text(
                  "Payment Method",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Airbnb",
                    color: Colors.white70,
                  ),
                ),
              ),
            ])));
  }
}
