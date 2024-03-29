import 'package:flutter/material.dart';

class CustomThemeData {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
      headlineMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      secondary: Colors.grey,
      background: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      secondary: Colors.grey,
      background: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );
}