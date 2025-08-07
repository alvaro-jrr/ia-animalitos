import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/app.dart';
import 'package:ai_animals_lottery/src/features/settings/widgets/settings_category.dart';
import 'package:ai_animals_lottery/src/features/settings/widgets/settings_item.dart';

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
            onTap: () {},
          ),
          // Legal information.
          SettingsCategory(title: localization.legalInformation),
          SettingsItem(
            icon: Icons.privacy_tip_outlined,
            title: localization.privacyPolicies,
            onTap: () {},
          ),
          SettingsItem(
            icon: Icons.article_outlined,
            title: localization.termsAndConditions,
            onTap: () {},
          ),
          // Share.
        ],
      ),
    );
  }
}
