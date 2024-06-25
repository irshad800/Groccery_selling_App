import 'package:flutter/material.dart';
import 'package:grocerry/Screens/Checkout.dart';
import 'package:grocerry/Widgets/Custom_textfeild.dart';

import '../../utils/colors.dart'; // Make sure you have a colors.dart file with primaryColors defined

class UserAdress extends StatefulWidget {
  const UserAdress({super.key});

  @override
  State<UserAdress> createState() => _ContactState();
}

class _ContactState extends State<UserAdress> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _showSnackBar() {
    ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: primaryColors,
        content: Text('Adress added Succesfully'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: primaryColors, // Ensure primaryColors is defined in colors.dart
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              top: 105,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Welcome Text

                              // Email Address
                              CustomTextField(
                                labeltext: 'Enter Name',
                              ),

                              SizedBox(height: 15),

                              // Password
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return ("Please Enter the Adress");
                                  }
                                  return null;
                                },
                                maxLines: 4,
                                decoration: InputDecoration(
                                    labelText: 'Enter Adress',
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    )),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CustomTextField(
                                labeltext: 'Enter Pincode',
                                keytype: TextInputType.number,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CustomTextField(
                                labeltext: 'Enter City',
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CustomTextField(labeltext: 'Enter Land mark'),
                              SizedBox(
                                height: 15,
                              ),
                              CustomTextField(
                                labeltext: 'Enter Phone',
                                keytype: TextInputType.number,
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 20),
                                height: 55,
                                width: 500,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryColors,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  onPressed: () {
                                    if (_formkey.currentState?.validate() ??
                                        false) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PaymentDetails(),
                                          ));
                                      _showSnackBar();
                                    }
                                  },
                                  child: Text(
                                    "ADD",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              )

                              // Recovery Password

                              // Sign In with Google Button
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
              left: 120,
              child: Text(
                "Add Adress",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Airbnb",
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
