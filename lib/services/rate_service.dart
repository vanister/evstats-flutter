import '../models/rate_type.dart';

abstract class RateService {
  Iterable<RateType> getRateTypes();
}

class EvsRateService implements RateService {
  @override
  Iterable<RateType> getRateTypes() {
    // for now, return a static list
    return [
      RateType(id: 1, name: 'Home'),
      RateType(id: 2, name: 'Work'),
      RateType(id: 3, name: 'Other'),
      RateType(id: 4, name: 'DC'),
    ];
  }
}
