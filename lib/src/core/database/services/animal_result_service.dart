import 'package:ai_animals_lottery/src/core/database/database.dart';
import 'package:ai_animals_lottery/src/features/results/models/animal_result.dart';

class AnimalResultService {
  /// The app [database].
  final AppDatabase database;

  const AnimalResultService(this.database);

  /// Inserts the given [results].
  Future<void> insertResults(List<AnimalResult> results) async {
    if (results.isEmpty) return;

    final resultsDate = results.first.date;

    // Delete the results for the given date.
    await database.resultDao.deleteResultsByDate(resultsDate.toIso8601String());

    // Insert the results.
    await database.resultDao.insertResults(
      results.map((e) => e.toEntity()).toList(),
    );
  }

  /// Gets the results for the given [date].
  Future<List<AnimalResult>> getResultsByDate(DateTime date) async {
    final results = await database.resultDao.findResultsByDate(
      date.toIso8601String(),
    );

    // Delete stale results for the given date.
    deleteStaleResults(date);

    return results.map((e) => AnimalResult.fromEntity(e)).toList();
  }

  /// Deletes the results for dates that are at least 2 days old than the given [date].
  Future<void> deleteStaleResults(DateTime date) async {
    final twoDaysAgo = date.subtract(const Duration(days: 2));

    return database.resultDao.deleteResultsBeforeDate(
      twoDaysAgo.toIso8601String(),
    );
  }
}
