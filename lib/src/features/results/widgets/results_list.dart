import 'package:flutter/material.dart';

import 'package:grouped_list/grouped_list.dart';

import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';
import 'package:ai_animals_lottery/src/features/results/widgets/animal_list_item.dart';

class ResultsList extends StatelessWidget {
  /// The results.
  final List<AnimalResult> results;

  const ResultsList({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return GroupedListView<AnimalResult, int>(
      padding: const EdgeInsets.all(16.0),
      elements: results,
      separator: const SizedBox(height: 8.0),
      groupBy: (animal) => animal.lotteryHouseId,
      groupSeparatorBuilder: (lotteryHouseId) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            'Casa de apuestas',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        );
      },
      groupItemBuilder: (context, animal, groupStart, groupEnd) {
        return Padding(
          padding: groupEnd
              ? const EdgeInsets.only(bottom: 16.0)
              : EdgeInsets.zero,
          child: AnimalListItem(animal: animal),
        );
      },
      sort: false,
    );
  }
}
