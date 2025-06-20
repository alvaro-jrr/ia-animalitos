import 'package:collection/collection.dart';

import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';

class BettingHouseResult {
  /// The name of the betting house.
  final String name;

  /// The results of the betting house.
  final List<AnimalResult> results;

  const BettingHouseResult({required this.name, required this.results});

  /// Returns an instance from the given [json].
  factory BettingHouseResult.fromJson(Map<String, dynamic> json) {
    return BettingHouseResult(
      name: json['name'] ?? '',
      results: json['results'] is Iterable
          ? (json['results'] as Iterable)
                .map((result) => AnimalResult.fromJson(result))
                .toList()
          : [],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BettingHouseResult &&
        other.name == name &&
        const ListEquality<AnimalResult>().equals(results, other.results);
  }

  @override
  int get hashCode {
    return Object.hash(name, const ListEquality<AnimalResult>().hash(results));
  }
}
