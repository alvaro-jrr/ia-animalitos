import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, this.settings = const HomeAppBarSettings()});

  /// The settings of the app bar.
  final HomeAppBarSettings settings;

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(settings.title), actions: settings.actions);
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
