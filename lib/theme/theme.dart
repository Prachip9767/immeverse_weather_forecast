import 'package:flutter/material.dart';


class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = true; // initial value set to true for dark mode

  ThemeData get currentTheme => _isDarkMode ? ThemeData.dark() : ThemeData.light();
  ThemeMode get currentThemeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  bool get isDarkMode => _isDarkMode; // getter to check if it's dark mode

  void toggleTheme() {
    _isDarkMode = !_isDarkMode; // Toggle the boolean value
    notifyListeners();
  }
}

