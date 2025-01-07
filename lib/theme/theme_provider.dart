import 'package:flutter/material.dart';
import 'package:theme_mode/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  // Initial theme is lightMode
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;
  bool isUserToggle = false;
  // Method to toggle the theme
  void toggleTheme(ThemeData? themeData) {
    isUserToggle = !isUserToggle;
    _themeData = themeData ?? lightMode;
    notifyListeners(); // Notify listeners to rebuild widgets
  }

  // This method allows you to set the theme based on the system
  void setSystemTheme(Brightness brightness) {
    if (isUserToggle) return; // Don't override if the user manually toggled it
    _themeData = brightness == Brightness.dark ? darkMode : lightMode;
    notifyListeners();
  }
}
