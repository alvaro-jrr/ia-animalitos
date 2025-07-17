import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ai_animals_lottery/src/core/styles/app_theme_data.dart';
import 'package:ai_animals_lottery/src/core/styles/app_theme_provider.dart';

class AppTheme {
  /// The light theme.
  static final light = AppThemeData.light();

  /// The dark theme.
  static final dark = AppThemeData.dark();

  /// Returns the [AppThemeData] from the [brightness].
  static AppThemeData fromBrightness(Brightness brightness) {
    return brightness == Brightness.light ? light : dark;
  }

  /// Returns the [AppThemeData] from the [context].
  static AppThemeData of(BuildContext context) {
    final brightness = context.select<AppThemeProvider, Brightness>(
      (provider) => provider.brightness,
    );

    return AppTheme.fromBrightness(brightness);
  }
}
