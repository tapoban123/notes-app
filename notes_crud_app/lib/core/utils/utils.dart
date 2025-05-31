import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_crud_app/core/responsiveness/responsive.dart';

void showSnackBar(
  BuildContext context, {
  required String message,
  Color? textColor,
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: getCustomTextStyle(context, color: textColor),
      ),
      backgroundColor: backgroundColor,
    ),
  );
}

void logMessage(String heading, String message) {
  log("[$heading] - $message");
}

Widget showProgressIndicator() {
  return Center(child: CircularProgressIndicator());
}

void showProgressIndicatorDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => showProgressIndicator());
}

String formatDate(DateTime date) {
  return DateFormat.yMMMMd().format(date);
}

String formatTime(DateTime time) {
  return DateFormat.jm().format(time);
}
