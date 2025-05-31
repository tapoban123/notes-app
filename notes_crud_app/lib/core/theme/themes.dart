import 'package:flutter/material.dart';

class CustomThemes {
  CustomThemes._();

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withValues(alpha: 0.7),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        errorStyle: TextStyle(color: Colors.red),
      ),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.black),
    );
  }
}
