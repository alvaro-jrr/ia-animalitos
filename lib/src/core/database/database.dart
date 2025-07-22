import 'dart:async';
import 'dart:io';

import 'package:floor/floor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:ai_animals_lottery/src/core/database/dao/animal_result_dao.dart';
import 'package:ai_animals_lottery/src/core/database/dao/prediction_dao.dart';
import 'package:ai_animals_lottery/src/core/database/entities/animal_result.dart';
import 'package:ai_animals_lottery/src/core/database/entities/prediction.dart';

part 'database.g.dart';

class AppDatabaseHelper {
  AppDatabaseHelper._();

  static AppDatabase? _instance;

  /// Returns the database instance.
  static Future<AppDatabase> getInstance() async {
    if (_instance != null) return _instance!;

    _instance = await $FloorAppDatabase
        .databaseBuilder('app_database.db')
        .addMigrations(getMigrations())
        .build();

    return _instance!;
  }

  /// Generates the database path.
  static Future<String> getDatabasePath() async {
    final directory = await (Platform.isIOS
        ? getLibraryDirectory()
        : getApplicationSupportDirectory());

    return p.join(directory.path, 'app_database.db');
  }

  /// The db migrations.
  static List<Migration> getMigrations() {
    return [];
  }
}

@Database(version: 1, entities: [AnimalResult, Prediction])
abstract class AppDatabase extends FloorDatabase {
  AnimalResultDao get resultDao;
  PredictionDao get predictionDao;

  /// Deletes the database.
  Future<void> clearAllTables() async {
    const tables = ['AnimalResult', 'Prediction'];

    for (final table in tables) {
      await database.execute('DELETE FROM $table');
    }
  }
}
