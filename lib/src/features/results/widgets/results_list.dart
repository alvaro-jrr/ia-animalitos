import 'package:flutter/material.dart';

import 'package:grouped_list/grouped_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:ai_animals_lottery/src/core/styles/app_theme.dart';
import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';
import 'package:ai_animals_lottery/src/features/results/models/lottery_house.dart';
import 'package:ai_animals_lottery/src/features/results/widgets/animal_list_item.dart';
import 'package:ai_animals_lottery/src/features/results/widgets/result_list_header.dart';

class ResultsList extends StatelessWidget {
  /// The results.
  final List<AnimalResult> results;

  /// The list [physics] to use.
  final ScrollPhysics? physics;

  const ResultsList({super.key, required this.results, this.physics});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return GroupedListView<AnimalResult, String>(
      padding: const EdgeInsets.all(16.0),
      physics: physics,
      elements: results,
      separator: const SizedBox(height: 8.0),
      groupBy: (animal) => animal.lotteryHouse.id,
      floatingHeader: true,
      useStickyGroupSeparators: true,
      groupStickyHeaderBuilder: (result) {
        return ResultListHeader(
          backgroundColor: theme.colorScheme.background,
          lotteryHouse: result.lotteryHouse,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        );
      },
      groupHeaderBuilder: (result) {
        return ResultListHeader(
          lotteryHouse: result.lotteryHouse,
          padding: const EdgeInsets.only(bottom: 12.0),
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
      (index) => AnimalResult(
        lotteryHouse: LotteryHouse(id: '1', name: 'Test'),
        hour: '08:30 AM',
        animal: null,
      ),
    );

    return Skeletonizer(child: ResultsList(results: results));
  }
}
