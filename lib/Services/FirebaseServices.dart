import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocerry/Screens/homeScreen.dart';
import 'package:grocerry/Screens/login_page.dart';

class FirebaseServices {
  // Registration method
  Future<void> registration({
    String? email,
    required String password,
    required String cPassword,
    required BuildContext context,
    required String username,
  }) async {
    if (password != cPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password,
      );
      print("Account Created Successfully");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
      print("Username: $username");
      print("Password: $password");
      print("Confirm Password: $cPassword");
      print("Email: $email");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("FAILED")),
      );
    }
  }

  // Sign-in method
  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Sign In Successful");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScaffold()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid email or password")),
      );
    }
  }
}
