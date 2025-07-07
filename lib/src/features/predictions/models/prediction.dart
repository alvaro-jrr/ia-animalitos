import 'package:ai_animals_lottery/src/core/models/animal.dart';

class Prediction {
  /// The date of the prediction.
  final DateTime date;

  /// The lottery house of the prediction.
  final String lotteryHouse;

  /// The predicted [animal].
  final Animal animal;

  /// Wether the prediction is a winner.
  final bool isWinner;

  /// The number of successful predictions in the last 7 days.
  final int lastSevenDays;

  /// The number of successful predictions in the last 15 days.
  final int lastFifteenDays;

  /// The number of successful predictions in the last 30 days.
  final int lastThirtyDays;

  const Prediction({
    required this.date,
    required this.lotteryHouse,
    required this.animal,
    required this.isWinner,
    required this.lastSevenDays,
    required this.lastFifteenDays,
    required this.lastThirtyDays,
  });

  /// Creates a [Prediction] from a JSON object.
  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      date: DateTime.parse(json['fecha']),
      lotteryHouse: json['desc_loteria'],
      animal: Animal.fromJson(json),
      isWinner: json['salio'] != null,
      lastSevenDays: json['d7'] is String ? int.tryParse(json['d7']) ?? 0 : 0,
      lastFifteenDays: json['d15'] is String
          ? int.tryParse(json['d15']) ?? 0
          : 0,
      lastThirtyDays: json['d30'] is String
          ? int.tryParse(json['d30']) ?? 0
          : 0,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Prediction &&
        other.date == date &&
        other.lotteryHouse == lotteryHouse &&
        other.animal == animal &&
        other.isWinner == isWinner &&
        other.lastSevenDays == lastSevenDays &&
        other.lastFifteenDays == lastFifteenDays &&
        other.lastThirtyDays == lastThirtyDays;
  }

  @override
  int get hashCode {
    return Object.hash(
      date,
      lotteryHouse,
      animal,
      isWinner,
      lastSevenDays,
      lastFifteenDays,
      lastThirtyDays,
    );
  }
}
