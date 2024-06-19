/// A session from entry
class SessionForm {
  final int kWh;
  final DateTime date;
  final int rateType;

  const SessionForm({
    required this.kWh,
    required this.date,
    required this.rateType,
  });
}
