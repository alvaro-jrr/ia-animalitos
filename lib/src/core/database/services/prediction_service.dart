import 'package:ai_animals_lottery/src/core/database/database.dart';
import 'package:ai_animals_lottery/src/features/predictions/models/prediction.dart';

class PredictionService {
  /// The app [database].
  final AppDatabase database;

  const PredictionService(this.database);

  /// Inserts the given [predictions].
  Future<void> insertPredictions(List<Prediction> predictions) async {
    if (predictions.isEmpty) return;

    final predictionsDate = predictions.first.date;

    // Delete the predictions for the given date.
    await database.predictionDao.deletePredictionsByDate(
      predictionsDate.toIso8601String(),
    );

    // Insert the predictions.
    await database.predictionDao.insertPredictions(
      predictions.map((e) => e.toEntity()).toList(),
    );
  }

  /// Gets the results for the given [date].
  Future<List<Prediction>> getPredictionsByDate(DateTime date) async {
    final predictions = await database.predictionDao.findPredictionsByDate(
      date.toIso8601String(),
    );

    // Delete stale predictions for the given date.
    deleteStalePredictions(date);

    return predictions.map(Prediction.fromEntity).toList();
  }

  /// Deletes the predictions for dates that are from yesterday based on the [date].
  Future<void> deleteStalePredictions(DateTime date) async {
    final yesterday = date.subtract(const Duration(days: 1));

    return database.predictionDao.deletePredictionsBeforeDate(
      yesterday.toIso8601String(),
    );
  }
}
