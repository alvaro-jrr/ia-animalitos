import 'package:get_it/get_it.dart';

import 'package:ai_animals_lottery/src/features/predictions/predictions_provider.dart';
import 'package:ai_animals_lottery/src/features/results/results_provider.dart';

final di = GetIt.instance;

/// Initializes the dependencies.
void init() {
  di.registerLazySingleton(() => ResultsProvider());
  di.registerLazySingleton(() => PredictionsProvider());
}
