import 'package:floor/floor.dart';

@entity
class AnimalResult {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String date;
  final String? animal;
  final String lotteryHouse;
  final String hour;

  AnimalResult({
    this.id,
    required this.date,
    required this.animal,
    required this.lotteryHouse,
    required this.hour,
  });
}
