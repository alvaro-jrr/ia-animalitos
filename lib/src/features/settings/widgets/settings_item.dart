import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  /// The title of the item.
  final String title;

  /// The icon of the item.
  final IconData icon;

  /// The callback when the item is tapped.
  final VoidCallback? onTap;

  /// The trailing widget of the item.
  final Widget? trailing;

  const SettingsItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: TextStyle(fontSize: 14.0)),
      onTap: onTap,
      trailing: trailing,
    );
  }
}
