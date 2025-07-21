import 'package:flutter/material.dart';

import 'package:ai_animals_lottery/src/app.dart';
import 'package:ai_animals_lottery/src/core/styles/app_theme.dart';
import 'package:ai_animals_lottery/src/core/widgets/animal_image.dart';
import 'package:ai_animals_lottery/src/features/predictions/models/prediction.dart';

class PredictionItem extends StatelessWidget {
  /// The prediction to display.
  final Prediction prediction;

  const PredictionItem({super.key, required this.prediction});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: theme.colorScheme.border),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Lottery house.
                    Text(
                      prediction.lotteryHouse,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 6.0),

                    // The number of successful predictions in the last 7, 15 and 30 days.
                    Text(
                      localization.matches,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      '${localization.lastDays(7)}: ${prediction.lastSevenDays}',
                    ),
                    Text(
                      '${localization.lastDays(15)}: ${prediction.lastFifteenDays}',
                    ),
                    Text(
                      '${localization.lastDays(30)}: ${prediction.lastThirtyDays}',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: prediction.isWinner
                        ? theme.colorScheme.success
                        : null,
                  ),
                  child: Column(
                    children: [
                      AnimalImage(animal: prediction.animal, size: 48.0),
                      const SizedBox(height: 4.0),
                      Text(
                        prediction.animal.name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        prediction.animal.id,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
