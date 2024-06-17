import 'package:flutter/material.dart';
import 'package:grocerry/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  final String labeltext;
  final String? errorText;
  final bool obscuretext;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  CustomTextField({
    Key? key,
    required this.labeltext,
    this.obscuretext = true,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.errorText,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscuretext;

  @override
  void initState() {
    super.initState();
    _obscuretext = widget.obscuretext;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword ? _obscuretext : false,
      decoration: InputDecoration(
        labelText: widget.labeltext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Colors.white), // Added borderSide here
        ),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscuretext ? Icons.visibility_off : Icons.visibility,
                  color: primaryColors,
                ),
                onPressed: () {
                  setState(() {
                    _obscuretext = !_obscuretext;
                  });
                },
              )
            : null,
        errorText: widget.errorText,
      ),
    );
  }
}
