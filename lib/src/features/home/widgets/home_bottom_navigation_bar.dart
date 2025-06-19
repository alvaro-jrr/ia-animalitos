import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/app.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  /// The selected index.
  final int selectedIndex;

  /// The callback when the user selects a destination.
  final Function(int) onDestinationSelected;

  const HomeBottomNavigationBar({
    super.key,
    this.selectedIndex = 0,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      elevation: 0,
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.confirmation_num_outlined),
          selectedIcon: Icon(Icons.confirmation_num),
          label: localization.results,
        ),
        NavigationDestination(
          icon: Icon(Icons.bar_chart_outlined),
          selectedIcon: Icon(Icons.bar_chart),
          label: localization.predictions,
        ),
        NavigationDestination(
          icon: Icon(Icons.analytics_outlined),
          selectedIcon: Icon(Icons.analytics),
          label: localization.statistics,
        ),
      ],
    );
  }
}
