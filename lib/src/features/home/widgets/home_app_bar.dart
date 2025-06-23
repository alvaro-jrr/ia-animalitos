import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, this.settings = const HomeAppBarSettings()});

  /// The settings of the app bar.
  final HomeAppBarSettings settings;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.colorScheme.primary,
      title: Text(
        settings.title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onPrimary,
        ),
      ),
      actionsIconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
      actions: settings.actions,
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
