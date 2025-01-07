import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_mode/main.dart';
import 'package:theme_mode/theme/theme_provider.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme:
      ColorScheme.light(surface: Colors.grey.shade400, primary: Colors.lime),
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: const Color.fromARGB(255, 78, 86, 3)),
);

ColorScheme colorScheme =
    Provider.of<ThemeProvider>(navigatorKey.currentContext!, listen: false)
        .themeData
        .colorScheme;

class AppColor {
  static Color get backGroundColor {
    return colorScheme.surface;
  }

  static Color get primaryColor {
    return colorScheme.primary;
  }
}
