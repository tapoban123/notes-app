import 'package:flutter/material.dart';

class CustomThemes {
  CustomThemes._();

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black);
  }

  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white);
  }
}
