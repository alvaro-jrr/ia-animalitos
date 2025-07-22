import 'package:floor/floor.dart';

import 'package:ai_animals_lottery/src/core/database/entities/animal_result.dart';

@dao
abstract class AnimalResultDao {
  @Query('SELECT * FROM AnimalResult')
  Future<List<AnimalResult>> findAllResults();

  @Query('SELECT * FROM AnimalResult WHERE date = :date')
  Future<List<AnimalResult>> findResultsByDate(String date);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertResult(AnimalResult result);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertResults(List<AnimalResult> results);

  @Query('DELETE FROM AnimalResult WHERE date = :date')
  Future<void> deleteResultsByDate(String date);
}
