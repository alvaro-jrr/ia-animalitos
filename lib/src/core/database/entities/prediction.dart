import 'package:floor/floor.dart';

@entity
class Prediction {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String date;
  final String animal;
  final String lotteryHouse;
  final bool isWinner;
  final int lastSevenDays;
  final int lastFifteenDays;
  final int lastThirtyDays;

  Prediction({
    this.id,
    required this.date,
    required this.animal,
    required this.lotteryHouse,
    required this.isWinner,
    required this.lastSevenDays,
    required this.lastFifteenDays,
    required this.lastThirtyDays,
  });
}
