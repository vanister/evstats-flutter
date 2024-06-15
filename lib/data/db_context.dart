import 'package:sqflite/sqflite.dart';

import 'sql/create_tables.dart';

abstract class DbContext {
  /// Closes the connecton to the database.
  Future<void> close();

  /// Executes a [sql] query against the database.
  Future<void> execute(String sql, [List<Object>? params]);

  /// Opens a connection to the database.
  Future<void> open();

  /// Runs a [sql] query against the database and returns a
  /// list of Map objects as a result.
  Future<List<Map>> query(String sql, [List<Object>? params]);
}

class SqliteDbContext implements DbContext {
  final String _databasePath;
  late String _dbName;
  late int _databaseVersion;

  // todo - invert this dependency
  Database? _database;

  SqliteDbContext(
    this._databasePath, {
    int databaseVersion = 1,
    String dbName = 'evstats.db',
  }) {
    _databaseVersion = databaseVersion;
    _dbName = dbName;
  }

  bool get databaseOpen => _database?.isOpen ?? false;

  @override
  Future<void> close() async {
    await _database?.close();
  }

  @override
  Future<void> execute(String sql, [List<Object>? params]) async {
    _ensureDatabaseIsOpen();

    await _database?.execute(sql, params);
  }

  @override
  Future<void> open() async {
    if (databaseOpen) {
      return;
    }

    // make sure the database is closed before opening it again
    await close();

    final fullDatabaseName = '$_databasePath/$_dbName';

    _database = await openDatabase(
      fullDatabaseName,
      version: _databaseVersion,
      onCreate: (db, version) async {
        var batch = db.batch();
        // create all of the tables for our app
        // if they don't exists yet
        batch.execute(CreateTablesSql.vehiclesTable);
        batch.execute(CreateTablesSql.ratesTable);
        batch.execute(CreateTablesSql.sessionsTable);

        batch.commit();
      },
    );
  }

  @override
  Future<List<Map>> query(String sql, [List<Object>? params]) async {
    _ensureDatabaseIsOpen();

    final results = await _database!.rawQuery(sql, params);

    return results;
  }

  /// Checks to make sure that the database connection is open, otherwise,
  /// throw an [Exception].
  void _ensureDatabaseIsOpen() {
    if (!databaseOpen) {
      // todo - create specific error
      throw Exception('Database is closed');
    }
  }
}
