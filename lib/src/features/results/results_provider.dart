import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';

class ResultsProvider extends ChangeNotifier {
  /// The results.
  List<AnimalResult> results = [];

  /// Wether is loading the results.
  bool isLoadingResults = false;

  /// Gets the lottery results.
  Future<void> getResults() async {
    isLoadingResults = true;
    notifyListeners();

    // Get the results from the API.
    await Future.delayed(const Duration(seconds: 2));

    results = [
      AnimalResult(
        lotteryHouseId: 1,
        number: 12,
        name: 'Caballo',
        time: DateTime(2025, 5, 22, 8, 30),
        image: 'https://ianimalitos.com/imagenes/14/12.png',
      ),
      AnimalResult(
        lotteryHouseId: 1,
        number: 12,
        name: 'Caballo',
        time: DateTime(2025, 5, 22, 8, 30),
        image: 'https://ianimalitos.com/imagenes/14/12.png',
      ),
      AnimalResult(
        lotteryHouseId: 2,
        number: 8,
        name: 'Ratón',
        time: DateTime(2025, 5, 22, 8, 30),
        image: 'https://ianimalitos.com/imagenes/1/08.png',
      ),
    ];

    isLoadingResults = false;
    notifyListeners();
  }
}
