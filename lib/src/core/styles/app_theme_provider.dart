import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/core/extensions/theme_mode.dart';
import 'package:ai_animals_lottery/src/core/services/preferences_service.dart';

const _themeModeKey = 'theme_mode';

class AppThemeProvider extends ChangeNotifier {
  /// The current theme mode.
  ThemeMode themeMode = ThemeMode.system;

  /// The current brightness.
  late Brightness brightness;

  AppThemeProvider() {
    // Get the preferred theme mode.
    final preferredThemeMode = getPreferredTheme();

    // If the preferred theme mode is the system, set the theme mode based on the brightness.
    if (preferredThemeMode == ThemeMode.system) {
      brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;

      themeMode = ThemeModeExtension.fromBrightness(brightness);
      return;
    }

    brightness = preferredThemeMode == ThemeMode.light
        ? Brightness.light
        : Brightness.dark;

    themeMode = preferredThemeMode;
  }

  /// Gets the theme mode from the preferences.
  ThemeMode getPreferredTheme() {
    final themeMode = PreferencesService().getString(_themeModeKey);

    // If the theme mode is not set, return the system theme mode.
    if (themeMode == null) return ThemeMode.system;

    return ThemeModeExtension.fromString(themeMode);
  }

  /// Saves the preferred theme mode in the preferences.
  void savePreferredTheme(ThemeMode themeMode) {
    PreferencesService().setString(_themeModeKey, themeMode.value);
  }

  /// Toggles the theme mode.
  void toggleTheme() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    brightness = themeMode == ThemeMode.light
        ? Brightness.light
        : Brightness.dark;

    notifyListeners();

    savePreferredTheme(themeMode);
  }
}
