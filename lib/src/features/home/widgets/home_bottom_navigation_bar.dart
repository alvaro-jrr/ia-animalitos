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
    final theme = Theme.of(context);
    final selectedColor = theme.colorScheme.primary;
    final unselectedColor = theme.colorScheme.onSurface.withValues(alpha: 0.5);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
            width: 1.0,
          ),
        ),
      ),
      child: NavigationBar(
        elevation: 0,
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        indicatorColor: Colors.transparent,
        backgroundColor: theme.colorScheme.onPrimary,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          return TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: states.contains(WidgetState.selected)
                ? selectedColor
                : unselectedColor,
          );
        }),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.confirmation_num_outlined, color: unselectedColor),
            selectedIcon: Icon(Icons.confirmation_num, color: selectedColor),
            label: localization.results,
          ),
          NavigationDestination(
            icon: Icon(Icons.leaderboard_outlined, color: unselectedColor),
            selectedIcon: Icon(Icons.leaderboard, color: selectedColor),
            label: localization.predictions,
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics_outlined, color: unselectedColor),
            selectedIcon: Icon(Icons.analytics, color: selectedColor),
            label: localization.statistics,
          ),
        ],
      ),
    );
  }
}
