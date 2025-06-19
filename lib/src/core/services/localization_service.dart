import 'dart:ui';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'package:ai_animals_lottery/l10n/app_localizations.dart';

class LocalizationService {
  /// The instance of the localization service.
  static LocalizationService get instance => _instance;

  static final _instance = LocalizationService._internal();

  LocalizationService._internal();

  /// The current [localization].
  late AppLocalizations localization;

  /// Loads the localization for the given [locale].
  Future<AppLocalizations> load(Locale locale) async {
    localization = await AppLocalizations.delegate.load(locale);

    // Setup the locale to use on the app.
    Intl.defaultLocale = locale.languageCode;

    // Setup the locale to use on date formatting.
    await initializeDateFormatting(locale.languageCode);

    return localization;
  }
}
