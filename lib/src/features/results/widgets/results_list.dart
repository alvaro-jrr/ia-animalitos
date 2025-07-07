import 'package:flutter/material.dart';

import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';
import 'package:ai_animals_lottery/src/features/results/models/lottery_house.dart';
import 'package:ai_animals_lottery/src/features/results/results_provider.dart';
import 'package:ai_animals_lottery/src/features/results/widgets/animal_list_item.dart';

class ResultsList extends StatelessWidget {
  /// The results.
  final List<AnimalResult> results;

  /// The list [physics] to use.
  final ScrollPhysics? physics;

  const ResultsList({super.key, required this.results, this.physics});

  @override
  Widget build(BuildContext context) {
    return GroupedListView<AnimalResult, String>(
      padding: const EdgeInsets.all(16.0),
      physics: physics,
      elements: results,
      separator: const SizedBox(height: 8.0),
      groupBy: (animal) => animal.lotteryHouseId,
      groupSeparatorBuilder: (lotteryHouseId) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Selector<ResultsProvider, LotteryHouse?>(
            selector: (_, p) => p.lotteryHouses[lotteryHouseId],
            builder: (context, lotteryHouse, child) {
              return Text(
                lotteryHouse?.name ?? '',
                style: TextStyle(fontWeight: FontWeight.w600),
              );
            },
          ),
        );
      },
      groupItemBuilder: (context, animal, groupStart, groupEnd) {
        return Padding(
          padding: groupEnd
              ? const EdgeInsets.only(bottom: 16.0)
              : EdgeInsets.zero,
          child: AnimalListItem(result: animal),
        );
      },
      sort: false,
    );
  }

  /// Returns a skeleton of the results list.
  static Widget skeleton({required int count}) {
    final results = List.generate(
      count,
      (index) =>
          AnimalResult(lotteryHouseId: '1', hour: '08:30 AM', animal: null),
    );

    return Skeletonizer(child: ResultsList(results: results));
  }
}
