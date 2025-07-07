import 'package:ai_animals_lottery/src/core/models/animal.dart';

class AnimalResult {
  /// The id of the lottery house.
  final String lotteryHouseId;

  /// The animal.
  final Animal? animal;

  /// The hour of the results.
  final String hour;

  const AnimalResult({
    required this.lotteryHouseId,
    required this.hour,
    required this.animal,
  });

  /// Returns an instance from the given [json].
  factory AnimalResult.fromJson(Map<String, dynamic> json) {
    return AnimalResult(
      lotteryHouseId: json['id_loteria'] ?? '',
      hour: json['desc_hora'] ?? '',
      animal: json['id_animal'] != null ? Animal.fromJson(json) : null,
    );
  }
}
