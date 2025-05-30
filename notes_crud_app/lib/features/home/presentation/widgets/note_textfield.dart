import 'package:flutter/material.dart';

class NoteTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final int maxLines;
  const NoteTextfield({
    super.key,
    required this.textController,
    required this.hintText,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(hintText: hintText, hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.4))),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      maxLines: maxLines,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Fields cannot be empty.";
        }
        return null;
      },
    );
  }
}
