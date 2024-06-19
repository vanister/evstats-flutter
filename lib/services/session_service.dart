import '../models/db/session.dart';

abstract class SessionService {
  Future<Session> get(int id);

  Future<Iterable<Session>> list();

  Future<Session> insert(Session session);

  Future<void> update(Session session);

  Future<void> delete(int id);
}

class EvsSessionService implements SessionService {
  @override
  Future<Session> insert(Session session) async {
    // todo - take in DbContext and query
    return Session(
      id: 1,
      vehicleId: 1,
      rateId: session.rateId,
      kWh: session.kWh,
      date: session.date,
    );
  }

  @override
  Future<void> delete(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Session> get(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Iterable<Session>> list() {
    throw UnimplementedError();
  }

  @override
  Future<void> update(Session session) {
    throw UnimplementedError();
  }
}
