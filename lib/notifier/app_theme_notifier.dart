import 'package:federicoviceconti_github_io/core/theme_data.dart';
import 'package:flutter/material.dart';

class AppThemeNotifier extends ChangeNotifier {
  ThemeData _appTheme = CustomThemeData.darkTheme;

  ThemeMode get currentAppTheme => _appTheme == CustomThemeData.lightTheme 
    ? ThemeMode.light 
    : ThemeMode.dark;

  switchAppTheme() {
    _appTheme = _appTheme == CustomThemeData.lightTheme
      ? CustomThemeData.darkTheme
      : CustomThemeData.lightTheme;

    notifyListeners();
  }
}