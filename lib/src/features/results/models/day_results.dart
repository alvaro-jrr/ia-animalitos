import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';

class DayResults {
  /// The date of the results.
  final DateTime date;

  /// The results of the day.
  final List<AnimalResult> results;

  const DayResults({required this.date, required this.results});

  /// Returns an instance from the given [jsonList].
  factory DayResults.fromJson(List<dynamic> jsonList) {
    final results = <AnimalResult>[];

    for (final json in jsonList) {
      // Save the result.
      results.add(AnimalResult.fromJson(json));
    }

    final date = jsonList.firstOrNull?['fecha_sorteo'];

    return DayResults(
      date: date is String
          ? DateTime.tryParse(date) ?? DateTime.now()
          : DateTime.now(),
      results: results,
    );
  }
}
