import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ai_animals_lottery/src/core/styles/app_theme.dart';
import 'package:ai_animals_lottery/src/core/styles/app_theme_provider.dart';

class ThemeModeSwitch extends StatelessWidget {
  const ThemeModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select<AppThemeProvider, ThemeMode>(
      (provider) => provider.themeMode,
    );

    final isLight = themeMode == ThemeMode.light;
    final isDark = themeMode == ThemeMode.dark;
    final disabledColor = AppTheme.of(context).colorScheme.mutedForeground;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.light_mode_outlined, color: !isLight ? disabledColor : null),
        const SizedBox(width: 4.0),
        Switch(
          value: themeMode == ThemeMode.dark,
          onChanged: (value) {
            context.read<AppThemeProvider>().toggleTheme();
          },
        ),
        const SizedBox(width: 4.0),
        Icon(Icons.dark_mode_outlined, color: !isDark ? disabledColor : null),
      ],
    );
  }
}
