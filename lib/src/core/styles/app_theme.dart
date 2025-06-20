import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/core/styles/app_colors.dart';

class AppTheme {
  /// The light theme.
  static final light = ThemeData(
    fontFamily: 'Plus Jakarta Sans',
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
    dividerColor: Colors.grey.shade200,
  );

  /// The dark theme.
  static final dark = ThemeData(
    fontFamily: 'Plus Jakarta Sans',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
  );
}
