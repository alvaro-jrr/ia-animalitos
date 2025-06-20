import 'package:flutter/material.dart';

import 'package:collection/collection.dart';

import 'package:ai_animals_lottery/l10n/app_localizations.dart';
import 'package:ai_animals_lottery/src/core/services/localization_service.dart';
import 'package:ai_animals_lottery/src/core/styles/app_theme.dart';
import 'package:ai_animals_lottery/src/features/home/pages/home_page.dart';

/// The localization for the app.
final localization = LocalizationService.instance.localization;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: _localeResolutionCallback,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const HomePage(),
    );
  }

  /// Resolves the locale to use on the app.
  Locale? _localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    Locale localeToUse = supportedLocales.first;

    if (locale != null) {
      if (supportedLocales.contains(locale)) {
        localeToUse = locale;
      } else {
        final supportedLocale = supportedLocales.firstWhereOrNull((element) {
          return element.languageCode == locale.languageCode;
        });

        // Get the first supported locale that matches the language code.
        if (supportedLocale != null) localeToUse = supportedLocale;
      }
    }

    // Load the localization for the locale to use.
    LocalizationService.instance.load(localeToUse);

    return localeToUse;
  }
}
