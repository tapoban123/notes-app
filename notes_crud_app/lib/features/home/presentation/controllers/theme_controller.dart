import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_crud_app/core/theme/themes.dart';

class ThemeController extends GetxController {
  final isDarkMode = RxBool(true);

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  ThemeData getCurrentTheme(BuildContext context) {
    if (isDarkMode.value) {
      return CustomThemes.darkTheme(context);
    } else {
      return CustomThemes.lightTheme(context);
    }
  }
}
