import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/features/home/widgets/home_bottom_navigation_bar.dart';
import 'package:ai_animals_lottery/src/features/predictions/pages/predictions_page.dart';
import 'package:ai_animals_lottery/src/features/results/pages/results_page.dart';
import 'package:ai_animals_lottery/src/features/statistics/pages/statistics_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// The current index of the bottom navigation bar.
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const ResultsPage(),
          const PredictionsPage(),
          const StatisticsPage(),
        ],
      ),
      bottomNavigationBar: HomeBottomNavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
