import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';
import 'package:ai_animals_lottery/src/features/results/models/lottery_house.dart';

class DayResults {
  /// The date of the results.
  final DateTime date;

  /// The results of the day.
  final List<AnimalResult> results;

  /// The lottery houses of the day.
  final Map<String, LotteryHouse> lotteryHouses;

  const DayResults({
    required this.date,
    required this.results,
    required this.lotteryHouses,
  });

  /// Returns an instance from the given [jsonList].
  factory DayResults.fromJson(List<dynamic> jsonList) {
    final lotteryHouses = <String, LotteryHouse>{};
    final results = <AnimalResult>[];

    for (final json in jsonList) {
      final lotteryHouse = LotteryHouse.fromJson(json);

      // Save the lottery house if it doesn't exist.
      if (!lotteryHouses.containsKey(lotteryHouse.id)) {
        lotteryHouses[lotteryHouse.id] = lotteryHouse;
      }

      // Save the result.
      results.add(AnimalResult.fromJson(json));
    }

    final date = jsonList.firstOrNull?['fecha_sorteo'];

    return DayResults(
      date: date is String
          ? DateTime.tryParse(date) ?? DateTime.now()
          : DateTime.now(),
      lotteryHouses: lotteryHouses,
      results: results,
    );
  }
}
