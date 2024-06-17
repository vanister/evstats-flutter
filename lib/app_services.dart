import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import 'data/db_connection.dart';
import 'data/db_context.dart';

// todo - refactor this to be AppStartup
// todo - take in the ServiceLocator to register services here

/// The services that are used by the app.
class AppServices {
  static final _getItInstance = GetIt.instance;

  /// Gets the service [locator] instance.
  static GetIt get locator => _getItInstance;

  static void init() {
    registerServices();
  }

  // todo - invert getit deps into a ServiceLocator object
  static void registerServices() {
    _getItInstance.registerLazySingletonAsync<DbContext>(() async {
      final String databasePath = await getDatabasesPath();
      final DbConnection connection = SqliteConnection(databasePath);
      final Database database = await connection.database;

      final context = SqliteDbContext(database);

      return context;
    });
  }
}
