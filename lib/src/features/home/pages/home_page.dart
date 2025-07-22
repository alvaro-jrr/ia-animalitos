import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/app.dart';
import 'package:ai_animals_lottery/src/di.dart';
import 'package:ai_animals_lottery/src/features/home/widgets/home_app_bar.dart';
import 'package:ai_animals_lottery/src/features/home/widgets/home_banner.dart';
import 'package:ai_animals_lottery/src/features/home/widgets/home_bottom_navigation_bar.dart';
import 'package:ai_animals_lottery/src/features/predictions/pages/predictions_page.dart';
import 'package:ai_animals_lottery/src/features/predictions/predictions_provider.dart';
import 'package:ai_animals_lottery/src/features/results/pages/results_page.dart';
import 'package:ai_animals_lottery/src/features/results/results_provider.dart';
import 'package:ai_animals_lottery/src/features/results/widgets/select_results_date_popup.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// The current index of the bottom navigation bar.
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    final resultsProvider = di.get<ResultsProvider>();

    /// Get the results.
    resultsProvider.getResults();

    /// Setup the timer.
    resultsProvider.setupResultsTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        key: ValueKey(_currentIndex),
        settings: _getAppBarSettingsByIndex(_currentIndex),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [const ResultsPage(), const PredictionsPage()],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HomeBanner(),
          HomeBottomNavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: _onDestinationSelected,
          ),
        ],
      ),
    );
  }

  /// Returns the app bar settings for the given [index].
  HomeAppBarSettings _getAppBarSettingsByIndex(int index) {
    /// Results.
    if (index == 0) {
      return HomeAppBarSettings(
        title: localization.results,
        actions: [const SelectResultsDatePopup()],
      );
    }

    /// Predictions.
    if (index == 1) {
      return HomeAppBarSettings(title: localization.predictions);
    }

    /// Statistics.
    return HomeAppBarSettings(title: localization.statistics);
  }

  /// Handles the destination selected.
  void _onDestinationSelected(int index) {
    // Get the predictions.
    if (index == 1) {
      di.get<PredictionsProvider>().getPredictions();
    }

    setState(() {
      _currentIndex = index;
    });
  }
}
