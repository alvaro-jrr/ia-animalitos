import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/core/styles/app_color_scheme.dart';

class AppThemeData {
  final AppColorScheme colorScheme;
  final Brightness brightness;

  const AppThemeData({required this.colorScheme, required this.brightness});

  /// Returns the [AppThemeData] for the light theme.
  factory AppThemeData.light() {
    return AppThemeData(
      colorScheme: AppColorScheme.light(),
      brightness: Brightness.light,
    );
  }

  /// Returns the [AppThemeData] for the dark theme.
  factory AppThemeData.dark() {
    return AppThemeData(
      colorScheme: AppColorScheme.dark(),
      brightness: Brightness.dark,
    );
  }

  /// Returns the [ThemeData] from the [AppThemeData].
  ThemeData get themeData {
    return ThemeData(
      brightness: brightness,
      fontFamily: 'Plus Jakarta Sans',
      colorScheme: colorScheme.toColorScheme(brightness),
      scaffoldBackgroundColor: colorScheme.background,
      dividerTheme: DividerThemeData(color: colorScheme.border, thickness: 1),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.primary,
        selectionColor: colorScheme.selection,
        selectionHandleColor: colorScheme.primary,
      ),
      iconTheme: IconThemeData(color: colorScheme.foreground),
      popupMenuTheme: PopupMenuThemeData(
        elevation: 0,
        position: PopupMenuPosition.under,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: colorScheme.border),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
