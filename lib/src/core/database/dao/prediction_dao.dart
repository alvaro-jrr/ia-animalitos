import 'package:floor/floor.dart';

import 'package:ai_animals_lottery/src/core/database/entities/prediction.dart';

@dao
abstract class PredictionDao {
  @Query('SELECT * FROM Prediction')
  Future<List<Prediction>> findAllPredictions();

  @Query('SELECT * FROM Prediction WHERE date = :date')
  Future<List<Prediction>> findPredictionsByDate(String date);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPrediction(Prediction prediction);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPredictions(List<Prediction> predictions);

  @Query('DELETE FROM Prediction WHERE date = :date')
  Future<void> deletePredictionsByDate(String date);

  @Query('DELETE FROM Prediction WHERE date <= :date')
  Future<void> deletePredictionsBeforeDate(String date);
}
