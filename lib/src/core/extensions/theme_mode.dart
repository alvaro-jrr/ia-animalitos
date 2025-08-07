import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/app.dart';

extension ThemeModeExtension on ThemeMode {
  /// Returns the [ThemeMode] from the [value].
  static ThemeMode fromString(String value) {
    return switch (value) {
      'system' => ThemeMode.system,
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  /// Returns the [ThemeMode] from the [brightness].
  static ThemeMode fromBrightness(Brightness brightness) {
    return brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
  }

  /// Returns the value of the [ThemeMode].
  String get value {
    return switch (this) {
      ThemeMode.system => 'system',
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
    };
  }

  /// Returns the title of the [ThemeMode].
  String get title {
    return switch (this) {
      ThemeMode.system => localization.system,
      ThemeMode.light => localization.light,
      ThemeMode.dark => localization.dark,
    };
  }
}
