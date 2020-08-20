import 'package:flutter/material.dart';

class CustomThemeData {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      headline4: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      primaryVariant: Colors.white,
      secondary: Colors.grey,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      headline4: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600
      ),
      bodyText1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
      )
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      primaryVariant: Colors.black,
      secondary: Colors.grey,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );
}