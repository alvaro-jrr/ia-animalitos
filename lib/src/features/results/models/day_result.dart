import 'package:collection/collection.dart';

import 'package:ai_animals_lottery/src/features/results/models/betting_house_result.dart';

class DayResult {
  /// The date of the result.
  final DateTime date;

  /// The results of the day.
  final List<BettingHouseResult> results;

  const DayResult({required this.date, required this.results});

  /// Returns an instance from the given [json].
  factory DayResult.fromJson(Map<String, dynamic> json) {
    return DayResult(
      date: json['date'] is String
          ? DateTime.tryParse(json['date']) ?? DateTime.now()
          : DateTime.now(),
      results: json['results'] is Iterable
          ? (json['results'] as Iterable)
                .map((result) => BettingHouseResult.fromJson(result))
                .toList()
          : [],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DayResult &&
        other.date == date &&
        const ListEquality<BettingHouseResult>().equals(results, other.results);
  }

  @override
  int get hashCode {
    return Object.hash(
      date,
      const ListEquality<BettingHouseResult>().hash(results),
    );
  }
}
