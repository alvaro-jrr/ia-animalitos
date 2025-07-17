import 'package:ai_animals_lottery/src/core/models/animal.dart';
import 'package:ai_animals_lottery/src/features/results/models/lottery_house.dart';

class AnimalResult {
  /// The animal.
  final Animal? animal;

  /// The lottery house.
  final LotteryHouse lotteryHouse;

  /// The hour of the results.
  final String hour;

  const AnimalResult({
    required this.lotteryHouse,
    required this.hour,
    required this.animal,
  });

  /// Returns an instance from the given [json].
  factory AnimalResult.fromJson(Map<String, dynamic> json) {
    final lotteryHouse = LotteryHouse(
      id: json['id_loteria'] ?? '',
      name: json['desc_loteria'] ?? '',
    );

    return AnimalResult(
      lotteryHouse: lotteryHouse,
      hour: json['desc_hora'] ?? '',
      animal: json['id_animal'] != null ? Animal.fromJson(json) : null,
    );
  }
}
