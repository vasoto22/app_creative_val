import 'package:flutter/material.dart';

class InputDecorationsForm {
  static InputDecoration inputDecoration({
    required String labelText,
    required String hintext,
    required Icon icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlue)),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent, width: 2),
      ),
      hintText: hintext,
      labelText: labelText,
      prefixIcon: icon,
      suffixIcon: suffixIcon,
    );
  }
}
