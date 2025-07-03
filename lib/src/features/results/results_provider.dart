import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/features/results/api/results_api.dart';
import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';
import 'package:ai_animals_lottery/src/features/results/models/lottery_house.dart';

/// The dates of the results.
typedef ResultDates = ({DateTime today, DateTime yesterday});

class ResultsProvider extends ChangeNotifier {
  /// The lottery houses.
  Map<String, LotteryHouse> lotteryHouses = {};

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
    final response = await ResultsApi.getDayResults();

    results = response?.results ?? [];
    lotteryHouses = response?.lotteryHouses ?? {};

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
