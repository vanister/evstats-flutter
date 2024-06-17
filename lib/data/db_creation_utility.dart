import 'package:sqflite/sqflite.dart';

import 'sql/create_tables.dart';

// todo - add upgrade and downgrade for migrations, if needed

/// Handles the `onCreate` callback of the db connection. Use the [database]
/// and [version] as a reference on how to handle creation or updating.
Future<void> handleDbConnectionCreate(Database database, int version) async {
  var batch = database.batch();
  // create all of the tables for our app
  // if they don't exists yet
  batch.execute(CreateTablesSql.vehiclesTable);
  batch.execute(CreateTablesSql.ratesTable);
  batch.execute(CreateTablesSql.sessionsTable);

  batch.commit();
}
