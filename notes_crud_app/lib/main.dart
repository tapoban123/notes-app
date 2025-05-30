import 'package:flutter/material.dart';
import 'package:notes_crud_app/core/theme/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      debugShowCheckedModeBanner: false,
      theme: CustomThemes.darkTheme(),
      home: const Scaffold(),
    );
  }
}
