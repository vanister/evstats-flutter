import 'dart:async';

import 'package:sqflite/sqflite.dart';

abstract class DbConnection {
  /// True if the database is open, false otherwise.
  bool get isOpen;

  /// Gets a [database] instance. This will open the connection
  /// to the [database] if it is not already opened.
  FutureOr<Database> get database;

  /// Closes the connecton to the database.
  Future<void> close();

  /// Opens a connection to the database.
  /// Override [path], [version], [name] and [onCreate] to provide
  /// custom connection options
  Future<void> open({
    String path,
    int? version,
    String? name,
    FutureOr<void> Function(Database db, int version)? onCreate,
  });
}

class SqliteConnection implements DbConnection {
  late final String _path;
  late final String _name;
  late final int _version;
  Database? _database;

  SqliteConnection(
    String path, {
    String? name = 'evstats.db',
    int? version = 1,
  }) {
    _path = path;
    _name = name!;
    _version = version!;
  }

  @override
  bool get isOpen => _database?.isOpen ?? false;

  @override
  FutureOr<Database> get database async {
    // check if the database is created and return that instance,
    // otherwise return a new instance and store it
    if (_database != null) {
      return _database!;
    }

    await open();

    return _database!;
  }

  @override
  Future<void> open({
    String? path,
    int? version,
    String? name,
    FutureOr<void> Function(Database db, int version)? onCreate,
  }) async {
    if (isOpen) {
      return;
    }

    final dbName = name ?? _name;
    final dbPath = path ?? _path;
    final fullDatabaseName = '$dbPath/$dbName';

    // ensure the connection is closed before opening
    await close();

    _database = await openDatabase(
      fullDatabaseName,
      version: version ?? _version,
      onCreate: onCreate,
    );
  }

  @override
  Future<void> close() async {
    await _database?.close();
  }
}
