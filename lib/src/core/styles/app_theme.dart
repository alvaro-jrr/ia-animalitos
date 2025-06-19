import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/core/styles/app_colors.dart';

class AppTheme {
  /// The light theme.
  static final light = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  );

  /// The dark theme.
  static final dark = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  );
}
