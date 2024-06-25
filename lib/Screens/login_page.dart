import 'package:flutter/material.dart';
import 'package:grocerry/Screens/SignUp.dart';
import 'package:grocerry/utils/colors.dart';

import '../Services/FirebaseServices.dart';
import '../Widgets/Custom_textfeild.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _CpasswordController = TextEditingController();
  bool _obscureText = true;
  FirebaseServices obj = FirebaseServices();
  String? emailError;
  String? passwordError;
  bool loading = false;
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Logo

                    SizedBox(height: 60),

                    // Welcome Text
                    Text(
                      'Hello Again!',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: primaryColors,
                          fontFamily: "Airbnb"),
                    ),
                    Text(
                      "Welcome Back You've Been Missed!",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),

                    SizedBox(height: 40),

                    // Email Address
                    CustomTextField(
                      labeltext: 'Email Address',
                    ),

                    SizedBox(height: 20),

                    // Password
                    CustomTextField(
                      labeltext: "Password",
                      isPassword: true,
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
                        if (_formkey.currentState?.validate() ?? false) {
                          obj.registration(
                              password: _passwordController.text,
                              cPassword: _CpasswordController.text,
                              context: context,
                              username: _usernameController.text);
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
                      child: Text('Sign In',
                          style: TextStyle(color: Colors.white)),
                    ),

                    SizedBox(height: 10),

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
                      height: 170,
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ));
                          },
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
      ),
    );
  }
}
