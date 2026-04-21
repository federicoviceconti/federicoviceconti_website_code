import 'package:flutter/material.dart';

class AppStateController extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;
  Locale _locale = const Locale('en');

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;
  bool get isDarkMode => _themeMode == ThemeMode.dark;
  bool get isItalian => _locale.languageCode == 'it';

  void toggleTheme() {
    _themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  void toggleLocale() {
    _locale = isItalian ? const Locale('en') : const Locale('it');
    notifyListeners();
  }
}
