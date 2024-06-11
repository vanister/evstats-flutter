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

    group('WHEN validating', () {
      test('should return false when kwh or rate id is null', () {
        final model = Session(vehicleId: 1);

        model.kWh = 0;
        model.rateId = null;

        expect(model.isValid, equals(false));
      });

      test(
        'should return true when kwh, rate override and rate id are set',
        () {
          final model = Session(vehicleId: 1);

          model.kWh = 14;
          model.rateId = 1; // home

          expect(model.isValid, equals(true));
        },
      );

      group('AND overriding a rate', () {
        test('should return true if rate is valid', () {
          final model = Session(vehicleId: 1);

          model.kWh = 14;
          model.rateId = 1; // home
          model.rateOverride = 0.45;

          expect(model.isValid, equals(true));
        });

        test('should return false if rate is less than 1', () {
          final model = Session(vehicleId: 1);

          model.kWh = 14;
          model.rateId = 1; // home
          model.rateOverride = 0;

          expect(model.isValid, equals(false));
        });
      });
    });
  });
}
