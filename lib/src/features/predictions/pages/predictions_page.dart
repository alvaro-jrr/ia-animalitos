import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:ai_animals_lottery/src/app.dart';
import 'package:ai_animals_lottery/src/features/predictions/models/prediction.dart';
import 'package:ai_animals_lottery/src/features/predictions/predictions_provider.dart';
import 'package:ai_animals_lottery/src/features/predictions/widgets/predictions_list.dart';

class PredictionsPage extends StatelessWidget {
  const PredictionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context
        .select<
          PredictionsProvider,
          ({List<Prediction> predictions, bool isLoadingPredictions})
        >(
          (provider) => (
            predictions: provider.predictions,
            isLoadingPredictions: provider.isLoadingPredictions,
          ),
        );

    // Handle loading.
    if (data.isLoadingPredictions && data.predictions.isEmpty) {
      return PredictionsList.skeleton(count: 10);
    }

    // Handle empty predictions.
    if (data.predictions.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
      child: PredictionsList(predictions: data.predictions),
    );
  }

  /// Retries the predictions fetching.
  Future<void> _onRetry(BuildContext context) async {
    final predictionsProvider = context.read<PredictionsProvider>();

    return predictionsProvider.getPredictions();
  }
}
