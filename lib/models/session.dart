import '../widgets/session/session_form.dart';

class Session {
  final int? id;
  final int? vehicleId;
  double? rateOverride;

  DateTime date = DateTime.now();
  int kWh = 0;
  int rateId;

  Session({
    this.id,
    this.vehicleId,
    this.rateOverride,
    required this.kWh,
    required this.date,
    required this.rateId,
  });

  factory Session.fromFormEntry(SessionForm form, {int? id, int? vehicleId}) {
    return Session(
      id: id,
      vehicleId: vehicleId,
      date: form.date,
      kWh: form.kWh,
      rateId: form.rateType,
    );
  }
}
