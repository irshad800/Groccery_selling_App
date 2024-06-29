import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocerry/Screens/homeScreen.dart';
import 'package:grocerry/Screens/login_page.dart';
import 'package:grocerry/utils/colors.dart';

class FirebaseServices {
  // Registration method
  Future<void> registration({
    required String email,
    required String password,
    required String cPassword,
    required BuildContext context,
    required String? username,
  }) async {
    if (password != cPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("Account Created Successfully");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: primaryColors,
          content: Text("Account Created Succesfully")));
      print("Username: $username");
      print("Password: $password");
      print("Confirm Password: $cPassword");
      print("Email: $email");
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green.withOpacity(0.9),
          content: Text(
            e.message ?? "",
            selectionColor: Colors.green,
          ),
        ),
      );
      print(e.message);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: primaryColors, content: Text("SignUp Failed")),
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: primaryColors, content: Text("Login Succesfull")));
      print("Sign In Successful");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScaffold()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: primaryColors,
            content: Text("Incorrect email or password")),
      );
    }
  }

  Future<void> signInWithGoogle({
    required BuildContext context,
  }) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? _googleSignInAccount =
          await _googleSignIn.signIn();
      if (_googleSignInAccount != null) {
        final GoogleSignInAuthentication _googleSignInAuthentication =
            await _googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _googleSignInAuthentication.idToken,
          accessToken: _googleSignInAuthentication.accessToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        print("Google Sign In Successful");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: primaryColors,
            content: Text("Google Sign In Was Succesfull"),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScaffold()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red.withOpacity(0.9),
            content: Text("Google Sign In was aborted"),
          ),
        );
        print("Google Sign In was aborted");
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.withOpacity(0.9),
          content: Text(
            e.message ?? "Authentication error",
            selectionColor: Colors.red,
          ),
        ),
      );
      print("FirebaseAuthException: ${e.message}");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.withOpacity(0.9),
          content: Text("Something went wrong"),
        ),
      );
      print("General Exception: $e");
    }
  }
}
