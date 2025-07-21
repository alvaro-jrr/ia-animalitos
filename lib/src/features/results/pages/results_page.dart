import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ai_animals_lottery/src/app.dart';
import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';
import 'package:ai_animals_lottery/src/features/results/results_provider.dart';
import 'package:ai_animals_lottery/src/features/results/widgets/empty_results.dart';
import 'package:ai_animals_lottery/src/features/results/widgets/results_list.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context
        .select<
          ResultsProvider,
          ({List<AnimalResult>? results, bool isLoadingResults})
        >(
          (provider) => (
            results: provider.resultsByDate[provider.selectedDate],
            isLoadingResults: provider.isLoadingResults,
          ),
        );

    final results = data.results;

    // Handle loading.
    if (data.isLoadingResults && (results == null || results.isEmpty)) {
      return ResultsList.skeleton(count: 10);
    }

    // Handle no results.
    if (results == null) {
      return Center(
        child: EmptyResults(
          description: localization.resultsNotFound,
          retryText: localization.retry,
          onRetry: () => _onRetry(context),
        ),
      );
    }

    // Handle empty results.
    if (results.isEmpty) {
      return Center(
        child: EmptyResults(
          description: localization.noResultsAvailableYet,
          retryText: localization.updateResults,
          onRetry: () => _onRetry(context),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => _onRetry(context),
      child: ResultsList(
        results: results,
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
