import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/features/predictions/api/predictions_api.dart';
import 'package:ai_animals_lottery/src/features/predictions/models/prediction.dart';

class PredictionsProvider extends ChangeNotifier {
  /// The predictions of the day.
  List<Prediction> predictions = [];

  /// Wether is loading the predictions.
  bool isLoadingPredictions = false;

  /// Gets the predictions of the day.
  Future<void> getPredictions() async {
    isLoadingPredictions = true;
    notifyListeners();

    final response = await PredictionsApi.getPredictions();

    if (response.isNotEmpty) {
      predictions = response;
    }

    isLoadingPredictions = false;
    notifyListeners();
  }
}
