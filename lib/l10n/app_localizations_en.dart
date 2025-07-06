// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get results => 'Results';

  @override
  String get predictions => 'Predictions';

  @override
  String get statistics => 'Statistics';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get today => 'Today';

  @override
  String get resultsNotFound => 'No results found';

  @override
  String get retry => 'Retry';

  @override
  String get selectResultsDate => 'Select results date';

  @override
  String get onStandBy => 'On stand by';

  @override
  String get matches => 'Matches';

  @override
  String lastDays(num days) {
    return 'Last $days days';
  }
}
