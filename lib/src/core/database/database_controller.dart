import 'package:ai_animals_lottery/src/core/database/database.dart';
import 'package:ai_animals_lottery/src/core/database/services/animal_result_service.dart';
import 'package:ai_animals_lottery/src/core/database/services/prediction_service.dart';

class DatabaseController {
  late AppDatabase database;

  /// The animal results service.
  late AnimalResultService animalResults;

  /// The predictions service.
  late PredictionService predictions;

  /// Initializes the database.
  Future<void> init() async {
    database = await AppDatabaseHelper.getInstance();

    // Initialize services.
    animalResults = AnimalResultService(database);
    predictions = PredictionService(database);
  }

  /// Deletes the database.
  Future<void> deleteDb() => database.clearAllTables();
}
