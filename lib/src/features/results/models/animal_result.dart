import 'dart:convert';

import 'package:ai_animals_lottery/src/core/database/entities/animal_result.dart'
    as entity;
import 'package:ai_animals_lottery/src/core/models/animal.dart';
import 'package:ai_animals_lottery/src/core/models/lottery_house.dart';

class AnimalResult {
  /// The date of the results.
  final DateTime date;

  /// The animal.
  final Animal? animal;

  /// The lottery house.
  final LotteryHouse lotteryHouse;

  /// The hour of the results.
  final String hour;

  const AnimalResult({
    required this.date,
    required this.lotteryHouse,
    required this.hour,
    required this.animal,
  });

  /// Returns an instance from the given [json].
  factory AnimalResult.fromJson(Map<String, dynamic> json) {
    final date = json['fecha_sorteo'] ?? '';

    return AnimalResult(
      date: date is String
          ? DateTime.tryParse(date) ?? DateTime.now()
          : DateTime.now(),
      lotteryHouse: LotteryHouse.fromJson(json),
      hour: json['desc_hora'] ?? '',
      animal: json['id_animal'] != null ? Animal.fromJson(json) : null,
    );
  }

  /// Returns an instance from the given [entity].
  factory AnimalResult.fromEntity(entity.AnimalResult entity) {
    return AnimalResult(
      date: DateTime.parse(entity.date),
      lotteryHouse: LotteryHouse.fromJson(jsonDecode(entity.lotteryHouse)),
      hour: entity.hour,
      animal: entity.animal != null
          ? Animal.fromJson(jsonDecode(entity.animal!))
          : null,
    );
  }

  /// Returns the [AnimalResult] entity.
  entity.AnimalResult toEntity() {
    return entity.AnimalResult(
      date: date.toIso8601String(),
      animal: animal != null ? jsonEncode(animal!.toJson()) : null,
      lotteryHouse: jsonEncode(lotteryHouse.toJson()),
      hour: hour,
    );
  }
}
