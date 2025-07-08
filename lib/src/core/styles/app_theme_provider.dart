import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  /// The current theme mode.
  ThemeMode themeMode = ThemeMode.system;

  /// The current brightness.
  late Brightness brightness;

  AppThemeProvider() {
    brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;

    themeMode = brightness == Brightness.light
        ? ThemeMode.light
        : ThemeMode.dark;
  }

  /// Toggles the theme mode.
  void toggleTheme() {
    brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();
  }
}
