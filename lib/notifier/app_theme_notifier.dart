import 'package:federicoviceconti_github_io/core/theme_data.dart';
import 'package:flutter/material.dart';

class AppThemeNotifier extends ChangeNotifier {
  ThemeData _appTheme = CustomThemeData.lightTheme;

  ThemeMode get currentAppTheme => _appTheme == CustomThemeData.lightTheme 
    ? ThemeMode.light 
    : ThemeMode.dark;

  bool get isDark => currentAppTheme == ThemeMode.dark;

  switchAppTheme() {
    _appTheme = _appTheme == CustomThemeData.lightTheme
      ? CustomThemeData.darkTheme
      : CustomThemeData.lightTheme;

    notifyListeners();
  }
}