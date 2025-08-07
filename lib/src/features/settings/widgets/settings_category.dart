import 'package:flutter/material.dart';

class SettingsCategory extends StatelessWidget {
  /// The title of the category.
  final String title;

  const SettingsCategory({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16).copyWith(bottom: 8.0),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
    );
  }
}
