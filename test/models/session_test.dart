import 'package:evstats/models/session.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Session Model', () {
    test('should create a model', () {
      final now = DateTime.now();
      final model = Session(vehicleId: 1);

      expect(model, isNotNull);
      expect(model.id, isNull);
      expect(model.vehicleId, equals(1));
      expect(model.kWh, equals(0));
      expect(model.date, equals(DateTime(now.year, now.month, now.day)));
    });
  });
}
