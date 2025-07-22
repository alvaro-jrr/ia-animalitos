import 'package:get_it/get_it.dart';

import 'package:ai_animals_lottery/src/core/database/database_controller.dart';
import 'package:ai_animals_lottery/src/core/styles/app_theme_provider.dart';
import 'package:ai_animals_lottery/src/features/predictions/predictions_provider.dart';
import 'package:ai_animals_lottery/src/features/results/results_provider.dart';

final di = GetIt.instance;

/// Initializes the dependencies.
Future<void> init() async {
  // Initialize the database.
  final dbController = DatabaseController();
  await dbController.init();
  di.registerLazySingleton(() => dbController);

  di.registerLazySingleton(() => ResultsProvider());
  di.registerLazySingleton(() => PredictionsProvider());
  di.registerLazySingleton(() => AppThemeProvider());
}
