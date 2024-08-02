import 'package:flutter/material.dart';

final _lightTheme = ThemeData(
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.all(10),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: Color(0xFF4A4E71),
    ),
  ),
  fontFamily: 'Inter',
  useMaterial3: true,
);

abstract class AppThemeProvider {
  static ThemeData get light => _lightTheme;
}

Color getFieldColor(bool? isValid) {
  Color color = const Color(0xFF4A4E71);

  if (isValid == false) color = const Color.fromRGBO(255, 128, 128, 1);
  if (isValid == true) color = const Color.fromRGBO(39, 178, 116, 1);

  return color;
}
