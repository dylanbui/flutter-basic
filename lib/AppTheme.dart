
import 'package:flutter/material.dart';

class AppTheme {
  // const AppTheme();

  static const Color colorStart = Color(0xFF0d47a1);
  static const Color colorEnd = Color(0xFF1565c0);

  static const buttonGradient = LinearGradient(
    colors:  [colorStart, colorEnd],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const TextStyle textStyle_1 = TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 30);
  static const TextStyle textStyle_2 = TextStyle(fontSize: 20);

  static InputDecoration defaultInputDecoration(String text) {
    return InputDecoration(border: const OutlineInputBorder(), labelText: text,);
  }

}