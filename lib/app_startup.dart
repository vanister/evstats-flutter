import 'package:sqflite/sqflite.dart';

import 'data/db_connection.dart';
import 'data/db_context.dart';
import 'services/log_service.dart';
import 'services/rate_service.dart';
import 'services/service_locator.dart';
import 'services/session_service.dart';

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

    ServiceLocator.registerLazySingleton<LogService>(() => ConsoleLogService());
    ServiceLocator.registerLazySingleton<RateService>(() => EvsRateService());
    ServiceLocator.registerLazySingleton<SessionService>(
        () => EvsSessionService());
  }
}
