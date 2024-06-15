class CreateTablesSql {
  static const vehiclesTable = '''
    CREATE TABLE Vehicles (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      year INTEGER NOT NULL,
      make TEXT NOT NULL,
      model TEXT NOT NULL
    );
  ''';

  static const ratesTable = '''
    CREATE TABLE Rates (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      amount TEXT NOT NULL,
      type INTEGER NOT NULL
    );
  ''';

  static const sessionsTable = '''
    CREATE TABLE Sessions (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      vehicle_id INTEGER NOT NULL,
      rate_id INTEGER NOT NULL,
      rate_override DOUBLE,
      date TEXT NOT NULL,
      kwh INTEGER NOT NULL,
      FOREIGN KEY (vehicle_id) REFERENCES Vehicles(id),
      FOREIGN KEY (rate_id) REFERENCES Rates(id)
    );
  ''';
}
