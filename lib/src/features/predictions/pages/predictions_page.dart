import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:ai_animals_lottery/src/app.dart';
import 'package:ai_animals_lottery/src/features/predictions/models/prediction.dart';
import 'package:ai_animals_lottery/src/features/predictions/predictions_provider.dart';
import 'package:ai_animals_lottery/src/features/predictions/widgets/sliver_predictions_list.dart';

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

    // Handle empty predictions.
    if (!data.isLoadingPredictions && data.predictions.isEmpty) {
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

    final predictionsDate = data.predictions.isEmpty
        ? DateTime.now()
        : data.predictions.first.date;

    final isLoadingPredictions =
        data.isLoadingPredictions && data.predictions.isEmpty;

    return RefreshIndicator(
      onRefresh: () => _onRetry(context),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Skeletonizer(
                enabled: isLoadingPredictions,
                child: Text(
                  localization
                      .animalsWithHigherStatisticalProbabilitiesOfBenefitingInDrawingsOn(
                        DateFormat.yMd().format(predictionsDate),
                      ),
                ),
              ),
            ),
          ),
          if (isLoadingPredictions)
            SliverPredictionsList.skeleton(count: 10)
          else
            SliverPredictionsList(predictions: data.predictions),
        ],
      ),
    );
  }

  /// Retries the predictions fetching.
  Future<void> _onRetry(BuildContext context) async {
    final predictionsProvider = context.read<PredictionsProvider>();

    return predictionsProvider.getPredictions();
  }
}
