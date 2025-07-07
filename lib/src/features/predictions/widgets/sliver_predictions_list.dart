import 'package:flutter/material.dart';

import 'package:skeletonizer/skeletonizer.dart';

import 'package:ai_animals_lottery/src/core/models/animal.dart';
import 'package:ai_animals_lottery/src/features/predictions/models/prediction.dart';
import 'package:ai_animals_lottery/src/features/predictions/widgets/prediction_item.dart';

class SliverPredictionsList extends StatelessWidget {
  /// The predictions.
  final List<Prediction> predictions;

  const SliverPredictionsList({super.key, required this.predictions});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverList.separated(
        itemCount: predictions.length,
        itemBuilder: (context, index) {
          return PredictionItem(prediction: predictions[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16.0);
        },
      ),
    );
  }

  /// Returns a skeleton of the predictions list.
  static Widget skeleton({required int count}) {
    final predictions = List.generate(
      count,
      (index) => Prediction(
        date: DateTime.now(),
        lotteryHouse: 'lotteryHouse',
        animal: Animal(
          id: '1',
          lotteryHouseId: '1',
          name: 'animal',
          imageUrl: 'imageUrl',
        ),
        isWinner: false,
        lastSevenDays: 0,
        lastFifteenDays: 0,
        lastThirtyDays: 0,
      ),
    );

    return SliverSkeletonizer(
      child: SliverPredictionsList(predictions: predictions),
    );
  }
}
