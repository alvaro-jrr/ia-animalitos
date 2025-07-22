import 'dart:async';

import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/core/database/database_controller.dart';
import 'package:ai_animals_lottery/src/di.dart';
import 'package:ai_animals_lottery/src/features/results/api/results_api.dart';
import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';

/// The dates of the results.
typedef ResultDates = ({DateTime today, DateTime yesterday});

class ResultsProvider extends ChangeNotifier {
  /// The timer to update the results.
  Timer? _timer;

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
    // If the results are already loading, do nothing.
    if (isLoadingResults) return;

    isLoadingResults = true;
    notifyListeners();

    final dbController = di.get<DatabaseController>();

    // Get the results from the database.
    final localResults = await dbController.animalResults.getResultsByDate(
      selectedDate,
    );

    if (localResults.isNotEmpty) {
      resultsByDate[selectedDate] = localResults;
      notifyListeners();
    }

    // Get the results from the API.
    final response =
        await ResultsApi.getResults(
          fromToday: selectedDate == dates.today,
        ).then((response) {
          if (response == null) return null;

          return response.where((result) => result.animal != null).toList();
        });

    if (response != null) {
      resultsByDate[selectedDate] = response;

      // Save the results to the database.
      di.get<DatabaseController>().animalResults.insertResults(response);
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

  /// Setups the timer to update the results.
  void setupResultsTimer() {
    if (_timer != null) return;

    final initalInterval = getResultsTimerInterval();

    // Setup the timer.
    _timer = Timer.periodic(initalInterval, (timer) {
      // Get the results.
      getResults();

      // Setup the timer again.
      setupResultsTimer();

      // Cancel the timer.
      _timer?.cancel();
      _timer = null;
    });
  }

  /// Returns the interval to fetch the results.
  Duration getResultsTimerInterval() {
    // Get the current time.
    final now = DateTime.now();
    final hour = now.hour;
    final minute = now.minute;

    // If the hour is before 8, set the interval to the time to be 8.
    if (hour < 8) {
      final todayEightAm = DateTime(now.year, now.month, now.day, 8, 0, 0);

      return todayEightAm.difference(now);
    }

    // If the hour is between 8 and 20, set the interval to the time to be 10 minutes.
    if (hour >= 8 && hour <= 20) {
      // Calculate how many minutes are left to 10.
      final minutesToNextTen = 10 - (minute % 10);

      final inTenMinutes = now.add(Duration(minutes: minutesToNextTen));

      return inTenMinutes.difference(now);
    }

    // If the hour is after 21, set the interval to the time to be the next day at 8.
    final tomorrowEightAm = DateTime(now.year, now.month, now.day + 1, 8, 0, 0);

    return tomorrowEightAm.difference(now);
  }
}
