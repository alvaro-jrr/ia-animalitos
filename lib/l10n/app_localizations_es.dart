// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get results => 'Resultados';

  @override
  String get predictions => 'Predicciones';

  @override
  String get statistics => 'Estadísticas';

  @override
  String get yesterday => 'Ayer';

  @override
  String get today => 'Hoy';

  @override
  String get resultsNotFound => 'No se encontraron resultados';

  @override
  String get retry => 'Reintentar';

  @override
  String get selectResultsDate => 'Seleccionar fecha de resultados';

  @override
  String get onStandBy => 'En espera';

  @override
  String get matches => 'Aciertos';

  @override
  String lastDays(num days) {
    return 'Últimos $days días';
  }

  @override
  String animalsWithHigherStatisticalProbabilitiesOfBenefitingInDrawingsOn(
    String date,
  ) {
    return 'Animalitos con mayores probabilidades estadísticas de salir beneficiados en sorteos del día $date';
  }

  @override
  String get noResultsAvailableYet => 'No hay resultados disponibles aún';

  @override
  String get updateResults => 'Actualizar resultados';

  @override
  String get settings => 'Ajustes';

  @override
  String get privacyPolicies => 'Políticas de privacidad';

  @override
  String get termsAndConditions => 'Términos y condiciones';

  @override
  String get appearance => 'Apariencia';

  @override
  String get preferences => 'Preferencias';

  @override
  String get legalInformation => 'Información legal';
}
