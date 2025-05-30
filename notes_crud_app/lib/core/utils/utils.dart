import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notes_crud_app/core/responsiveness/responsive.dart';

void showSnackBar(
  BuildContext context, {
  required String message,
  Color? textColor,
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: getCustomTextStyle(context, color: textColor),
      ),
      backgroundColor: backgroundColor,
    ),
  );
}

void logMessage(String errorLocation, String message) {
  log("[$errorLocation] - $message");
}

Widget showProgressIndicator() {
  return Center(child: CircularProgressIndicator());
}

void showProgressIndicatorDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => showProgressIndicator());
}
