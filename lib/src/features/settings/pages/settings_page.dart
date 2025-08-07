import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ai_animals_lottery/src/app.dart';
import 'package:ai_animals_lottery/src/core/styles/app_theme_provider.dart';
import 'package:ai_animals_lottery/src/features/settings/widgets/settings_category.dart';
import 'package:ai_animals_lottery/src/features/settings/widgets/settings_item.dart';
import 'package:ai_animals_lottery/src/features/settings/widgets/theme_mode_switch.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Preferences.
          SettingsCategory(title: localization.preferences),
          SettingsItem(
            icon: Icons.palette_outlined,
            title: localization.appearance,
            trailing: ThemeModeSwitch(),
            onTap: () {
              context.read<AppThemeProvider>().toggleTheme();
            },
          ),
          // Legal information.
          SettingsCategory(title: localization.legalInformation),
          SettingsItem(
            icon: Icons.privacy_tip_outlined,
            title: localization.privacyPolicies,
          ),
          SettingsItem(
            icon: Icons.article_outlined,
            title: localization.termsAndConditions,
          ),
          // Share.
        ],
      ),
    );
  }
}
