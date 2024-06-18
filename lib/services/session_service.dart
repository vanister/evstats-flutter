import '../models/session.dart';

abstract class SessionService {
  Future<Session> get(int id);

  Future<Iterable<Session>> list();

  Future<Session> add(Session session);

  Future<void> update(Session session);

  Future<void> delete(int id);
}

class EvsSessionService implements SessionService {
  @override
  Future<Session> add(Session session) async {
    return Session(
      id: 1,
      vehicleId: 1,
      rateId: session.rateId ?? 1,
      kWh: session.kWh,
      date: session.date,
    );
  }

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Session> get(int id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Iterable<Session>> list() {
    // TODO: implement list
    throw UnimplementedError();
  }

  @override
  Future<void> update(Session session) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
