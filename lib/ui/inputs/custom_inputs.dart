import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration getLoginInputStyle({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(.3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(.3)),
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
      ),
      labelStyle: const TextStyle(color: Colors.grey),
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }
}
