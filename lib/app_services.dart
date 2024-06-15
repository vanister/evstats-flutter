import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import 'data/db_context.dart';

/// The services that are used by the app.
class AppServices {
  static final _getItInstance = GetIt.instance;
  static bool _initialized = false;

  /// Gets the service [locator] instance.
  static GetIt get locator => _getItInstance;

  /// Call [init] at app startup to setup and register the services
  /// that are used in the app globally.
  ///
  /// See the `_registerServices` function in this class to add more
  /// services to the locator.
  static void init() {
    if (_initialized) {
      return;
    }

    _registerServices();
    _initialized = true;
  }

  // todo - consider making this public
  static void _registerServices() {
    _getItInstance.registerLazySingletonAsync<DbContext>(() async {
      final String databasePath = await getDatabasesPath();
      final context = SqliteDbContext(databasePath);
      // open the connection to the database
      await context.open();

      return context;
    });
  }
}
