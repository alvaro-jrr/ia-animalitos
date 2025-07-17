import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ai_animals_lottery/src/core/styles/app_theme_provider.dart';
import 'package:ai_animals_lottery/src/di.dart';
import 'package:ai_animals_lottery/src/features/predictions/predictions_provider.dart';
import 'package:ai_animals_lottery/src/features/results/results_provider.dart';

class AppProviders extends StatelessWidget {
  /// The child of the widget.
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.get<ResultsProvider>()),
        ChangeNotifierProvider(
          create: (context) => di.get<PredictionsProvider>(),
        ),
        ChangeNotifierProvider(create: (context) => di.get<AppThemeProvider>()),
      ],
      child: child,
    );
  }
}
