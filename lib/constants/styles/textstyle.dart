import 'package:flutter/material.dart';

TextStyle lexend(Color color, double fontSize, FontWeight fontWeight) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

TextStyle lobsterTwo(Color color, double fontSize, FontWeight fontWeight) {
  return TextStyle(
    fontFamily: 'LobsterTwo',
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

class CustomTextStyles {
  static TextStyle custombuttom = const TextStyle(
    color: Colors.white,
    fontSize: 17,
    height: 0.08,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.41,
  );
}
