import 'package:flutter/material.dart';

abstract class LoginDefaultTheme {
  static InputDecoration get loginInputDecoration {
    return InputDecoration(
      labelStyle: TextStyle(
        color: Color.fromRGBO(164, 150, 148, 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color.fromRGBO(115, 107, 96, 1),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color.fromRGBO(115, 107, 96, 1),
        ),
      ),
    );
  }
}
