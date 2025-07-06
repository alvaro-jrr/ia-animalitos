import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/features/results/api/results_api.dart';
import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';
import 'package:ai_animals_lottery/src/features/results/models/lottery_house.dart';

/// The dates of the results.
typedef ResultDates = ({DateTime today, DateTime yesterday});

class ResultsProvider extends ChangeNotifier {
  /// The lottery houses.
  Map<String, LotteryHouse> lotteryHouses = {};

  /// The results by date.
  Map<DateTime, List<AnimalResult>> resultsByDate = {};

  /// Wether is loading the results.
  bool isLoadingResults = false;

  /// The dates of the results.
  late ResultDates dates;

  /// The selected date.
  late DateTime selectedDate;

  ResultsProvider() {
    final now = DateUtils.dateOnly(DateTime.now());

    selectedDate = now;
    dates = (today: now, yesterday: now.copyWith(day: now.day - 1));
  }

  /// Gets the lottery results.
  Future<void> getResults() async {
    isLoadingResults = true;
    notifyListeners();

    // Get the results from the API.
    final response = await ResultsApi.getResults(
      fromToday: selectedDate == dates.today,
    );

    if (response != null) {
      resultsByDate[selectedDate] = response.results;
      lotteryHouses = response.lotteryHouses;
    }

    isLoadingResults = false;
    notifyListeners();
  }

  /// Selects the date.
  void selectDate(DateTime date) {
    // If the date is the same as the selected date, do nothing.
    if (date == selectedDate) return;

    selectedDate = date;
    notifyListeners();

    // Get the results from the API.
    getResults();
  }
}
