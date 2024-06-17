import 'package:sqflite/sqflite.dart';

import 'data/db_connection.dart';
import 'data/db_context.dart';
import 'services/service_locator.dart';

abstract class AppStartup {
  /// Registers the services that are used by the app.
  static void registerServices() {
    ServiceLocator.registerLazySingletonAsync<DbContext>(() async {
      final String databasePath = await getDatabasesPath();
      final DbConnection connection = SqliteConnection(databasePath);
      final Database database = await connection.database;

      final context = SqliteDbContext(database);

      return context;
    });
  }
}
