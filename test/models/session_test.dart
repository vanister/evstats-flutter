import 'package:evstats/models/db/session.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Session Model', () {
    test('should create a model', () {
      final now = DateTime.now();
      final model = Session(vehicleId: 1, rateId: 1, kWh: 42, date: now);

      expect(model, isNotNull);
      expect(model.id, isNull);
      expect(model.vehicleId, equals(1));
      expect(model.kWh, equals(42));
      expect(model.date, equals(now));
      expect(model.rateId, equals(1));
    });
  });
}
