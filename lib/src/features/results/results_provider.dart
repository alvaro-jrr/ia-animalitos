import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';

/// The dates of the results.
typedef ResultDates = ({DateTime today, DateTime yesterday});

class ResultsProvider extends ChangeNotifier {
  /// The results.
  List<AnimalResult> results = [];

  /// Wether is loading the results.
  bool isLoadingResults = false;

  /// The dates of the results.
  late ResultDates dates;

  /// The selected date.
  late DateTime selectedDate;

  ResultsProvider() {
    final now = DateUtils.dateOnly(DateTime.now());

    // Set the dates.
    dates = (today: now, yesterday: now.subtract(const Duration(days: 1)));
    selectedDate = now;
  }

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

  /// Selects the date.
  void selectDate(DateTime date) {
    // Do nothing if the date is the same as the selected date.
    if (date == selectedDate) return;

    selectedDate = date;
    notifyListeners();
  }
}
