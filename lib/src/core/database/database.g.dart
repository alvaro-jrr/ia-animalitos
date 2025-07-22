// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AnimalResultDao? _resultDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AnimalResult` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `date` TEXT NOT NULL, `animal` TEXT, `lotteryHouse` TEXT NOT NULL, `hour` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AnimalResultDao get resultDao {
    return _resultDaoInstance ??= _$AnimalResultDao(database, changeListener);
  }
}

class _$AnimalResultDao extends AnimalResultDao {
  _$AnimalResultDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _animalResultInsertionAdapter = InsertionAdapter(
            database,
            'AnimalResult',
            (AnimalResult item) => <String, Object?>{
                  'id': item.id,
                  'date': item.date,
                  'animal': item.animal,
                  'lotteryHouse': item.lotteryHouse,
                  'hour': item.hour
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AnimalResult> _animalResultInsertionAdapter;

  @override
  Future<List<AnimalResult>> findAllResults() async {
    return _queryAdapter.queryList('SELECT * FROM AnimalResult',
        mapper: (Map<String, Object?> row) => AnimalResult(
            id: row['id'] as int?,
            date: row['date'] as String,
            animal: row['animal'] as String?,
            lotteryHouse: row['lotteryHouse'] as String,
            hour: row['hour'] as String));
  }

  @override
  Future<List<AnimalResult>> findResultsByDate(String date) async {
    return _queryAdapter.queryList('SELECT * FROM AnimalResult WHERE date = ?1',
        mapper: (Map<String, Object?> row) => AnimalResult(
            id: row['id'] as int?,
            date: row['date'] as String,
            animal: row['animal'] as String?,
            lotteryHouse: row['lotteryHouse'] as String,
            hour: row['hour'] as String),
        arguments: [date]);
  }

  @override
  Future<void> deleteResultsByDate(String date) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM AnimalResult WHERE date = ?1',
        arguments: [date]);
  }

  @override
  Future<void> deleteResultsBeforeDate(String date) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM AnimalResult WHERE date <= ?1',
        arguments: [date]);
  }

  @override
  Future<void> insertResult(AnimalResult result) async {
    await _animalResultInsertionAdapter.insert(
        result, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertResults(List<AnimalResult> results) async {
    await _animalResultInsertionAdapter.insertList(
        results, OnConflictStrategy.replace);
  }
}
