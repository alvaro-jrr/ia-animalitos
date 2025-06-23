import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';
import 'package:ai_animals_lottery/src/features/results/results_provider.dart';
import 'package:ai_animals_lottery/src/features/results/widgets/results_list.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final animals = context.select<ResultsProvider, List<AnimalResult>>(
      (provider) => provider.results,
    );

    return ResultsList(results: animals);
  }
}
