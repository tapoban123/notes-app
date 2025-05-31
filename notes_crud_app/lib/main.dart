import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_crud_app/features/home/presentation/controllers/theme_controller.dart';
import 'package:notes_crud_app/features/home/presentation/screens/home_screen.dart';
import 'package:notes_crud_app/routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());

    return Obx(
      () => GetMaterialApp(
        title: 'Notes App',
        initialRoute: RouteNames.home.name,
        getPages: routes,
        debugShowCheckedModeBanner: false,
        theme: themeController.getCurrentTheme(context),
        home: HomeScreen(),
      ),
    );
  }
}
