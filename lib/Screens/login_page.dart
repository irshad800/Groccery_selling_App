import 'package:flutter/material.dart';
import 'package:grocerry/Screens/homeScreen.dart';
import 'package:grocerry/utils/colors.dart';

import '../Widgets/Custom_textfeild.dart';
import '../utils/Validator.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  String? emailError;
  String? passwordError;
  bool loading = false;
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    print(height);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Color(0xFFF8F9FA),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Logo

                  SizedBox(height: 40),

                  // Welcome Text
                  Text(
                    'Hello Again!',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Airbnb",
                        color: primaryColors),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Welcome Back You've Been Missed!",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: 38),

                  // Email Address
                  CustomTextField(
                    controller: _emailController,
                    labeltext: 'Email Address',
                    validator: (value) {
                      return validateEmail(value);
                    },
                  ),

                  SizedBox(height: 20),

                  // Password
                  CustomTextField(
                    controller: _passwordController,
                    labeltext: "Password",
                    isPassword: true,
                    validator: (value) {
                      return validatePassword(value);
                    },
                  ),
                  // Recovery Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Recovery Password',
                        style: TextStyle(color: Color(0xFF707B81)),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Sign In Button
                  ElevatedButton(
                    onPressed: () {
                      if (_emailController.text == 'irshadvp800@gmail.com' &&
                              _passwordController.text == '123456' ||
                          _emailController.text == 'user@gmail.com' &&
                              _passwordController.text == '123456') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColors,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child:
                        Text('Sign In', style: TextStyle(color: Colors.white)),
                  ),

                  SizedBox(height: 15),

                  // Sign In with Google Button
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide.none,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    icon: Image.asset('assets/images/img_4.png', height: 24),
                    label: Text(
                      'Sign in with Google',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                  SizedBox(
                    height: 180,
                  ),
                  // Sign Up Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have An Account?",
                        style: TextStyle(color: Color(0xFF707B81)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Sign Up For Free',
                            style: TextStyle(color: primaryColors)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
