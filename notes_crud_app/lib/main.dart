import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:notes_crud_app/core/theme/themes.dart';
import 'package:notes_crud_app/features/home/presentation/screens/home_screen.dart';
import 'package:notes_crud_app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Notes App',
      initialRoute: RouteNames.home.name,
      getPages: routes,
      debugShowCheckedModeBanner: false,
      theme: CustomThemes.darkTheme(),
      home: HomeScreen(),
    );
  }
}
