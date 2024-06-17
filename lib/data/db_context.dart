import 'package:sqflite/sqflite.dart';

abstract class DbContext {
  /// Executes a [sql] query against the database.
  Future<void> execute(String sql, [List<Object>? params]);

  /// Runs a [sql] query against the database and returns a
  /// list of Map objects as a result.
  Future<List<Map>> query(String sql, [List<Object>? params]);
}

class SqliteDbContext implements DbContext {
  late final Database _database;

  SqliteDbContext(Database database) {
    _database = database;
  }

  @override
  Future<void> execute(String sql, [List<Object>? params]) async {
    await _database.execute(sql, params);
  }

  @override
  Future<List<Map>> query(String sql, [List<Object>? params]) async {
    final results = await _database.rawQuery(sql, params);

    return results;
  }
}
