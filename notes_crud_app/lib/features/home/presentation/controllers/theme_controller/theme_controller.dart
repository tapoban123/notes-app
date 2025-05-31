import 'package:get/get.dart';

enum Themes { light, dark }

class ThemeController extends GetxController {
  final currentTheme = RxString(Themes.dark.name);

  void setTheme(Themes newTheme) {
    currentTheme.value = newTheme.name;
  }
}
