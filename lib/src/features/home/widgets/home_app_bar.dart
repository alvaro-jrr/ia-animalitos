import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/core/styles/app_theme.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, this.settings = const HomeAppBarSettings()});

  /// The settings of the app bar.
  final HomeAppBarSettings settings;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final backgroundColor = theme.colorScheme.primary;
    final foregroundColor = Colors.white;

    return AppBar(
      backgroundColor: backgroundColor,
      scrolledUnderElevation: 0.0,
      title: Text(
        settings.title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: foregroundColor,
        ),
      ),
      actionsIconTheme: IconThemeData(color: foregroundColor),
      actions: settings.actions.isEmpty
          ? null
          : [...settings.actions, const SizedBox(width: 16.0)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class HomeAppBarSettings {
  /// The title of the app bar.
  final String title;

  /// The actions of the app bar.
  final List<Widget> actions;

  const HomeAppBarSettings({this.title = '', this.actions = const []});
}
