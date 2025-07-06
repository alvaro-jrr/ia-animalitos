import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ai_animals_lottery/src/app.dart';
import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';
import 'package:ai_animals_lottery/src/features/results/results_provider.dart';
import 'package:ai_animals_lottery/src/features/results/widgets/results_list.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context
        .select<
          ResultsProvider,
          ({List<AnimalResult> results, bool isLoadingResults})
        >(
          (provider) => (
            results: provider.resultsByDate[provider.selectedDate] ?? [],
            isLoadingResults: provider.isLoadingResults,
          ),
        );

    // Handle loading.
    if (data.isLoadingResults && data.results.isEmpty) {
      return ResultsList.skeleton(count: 10);
    }

    // Handle empty results.
    if (data.results.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(localization.resultsNotFound),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => _onRetry(context),
              child: Text(localization.retry),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => _onRetry(context),
      child: ResultsList(
        results: data.results,
        // Allow the refresh to work when the list doesn't have enough items to scroll.
        physics: const AlwaysScrollableScrollPhysics(),
      ),
    );
  }

  /// Retries the result fetching.
  Future<void> _onRetry(BuildContext context) async {
    final resultsProvider = context.read<ResultsProvider>();

    return resultsProvider.getResults();
  }
}
