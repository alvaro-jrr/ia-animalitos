import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/core/database/database_controller.dart';
import 'package:ai_animals_lottery/src/di.dart';
import 'package:ai_animals_lottery/src/features/predictions/api/predictions_api.dart';
import 'package:ai_animals_lottery/src/features/predictions/models/prediction.dart';

class PredictionsProvider extends ChangeNotifier {
  /// The predictions of the day.
  List<Prediction> predictions = [];

  /// Wether is loading the predictions.
  bool isLoadingPredictions = false;

  /// Gets the predictions of the day.
  Future<void> getPredictions() async {
    // If predications are already loading, do nothing.
    if (isLoadingPredictions) return;

    isLoadingPredictions = true;
    notifyListeners();

    final now = DateUtils.dateOnly(DateTime.now());

    final dbController = di.get<DatabaseController>();

    // Get the predictions from the database.
    final localPredictions = await dbController.predictions
        .getPredictionsByDate(now);

    if (localPredictions.isNotEmpty) {
      predictions = localPredictions;
      notifyListeners();
    }

    // Get the predictions from the API.
    final response = await PredictionsApi.getPredictions();

    if (response.isNotEmpty) {
      predictions = response;
      dbController.predictions.insertPredictions(predictions);
    }

    isLoadingPredictions = false;
    notifyListeners();
  }
}
