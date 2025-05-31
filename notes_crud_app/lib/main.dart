import 'package:flutter/material.dart';
import 'package:get/get.dart' show Get;
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:notes_crud_app/core/theme/themes.dart';
import 'package:notes_crud_app/features/home/presentation/controllers/theme_controller/theme_controller.dart';
import 'package:notes_crud_app/features/home/presentation/screens/home_screen.dart';
import 'package:notes_crud_app/routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return GetMaterialApp(
      title: 'Notes App',
      initialRoute: RouteNames.home.name,
      getPages: routes,
      debugShowCheckedModeBanner: false,
      theme:
          themeController.currentTheme.value == Themes.dark.name
              ? CustomThemes.darkTheme()
              : CustomThemes.lightTheme(),
      home: HomeScreen(),
    );
  }
}
