import 'package:flutter/material.dart';

Widget showConfirmDialog(
  BuildContext context, {
  required String title,
  required String content,
  required VoidCallback onCancel,
  required VoidCallback onContinue,
}) {
  return AlertDialog(
    title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
    content: Text(content),
    actions: [
      TextButton(
        onPressed: onContinue,
        style: TextButton.styleFrom(backgroundColor: Colors.red),
        child: Text("Delete", style: TextStyle(color: Colors.white)),
      ),
      TextButton(
        onPressed: onCancel,
        style: TextButton.styleFrom(backgroundColor: Colors.blue),
        child: Text("Cancel", style: TextStyle(color: Colors.white)),
      ),
    ],
  );
}
