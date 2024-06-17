class Session {
  final int? id;
  final int? vehicleId;

  late DateTime date;
  int kWh = 0;
  int? rateId;
  double? rateOverride;

  Session({
    this.id,
    this.vehicleId,
    DateTime? date,
    int kWh = 0,
    int rateId = 1, // home
    this.rateOverride,
  }) {
    var now = DateTime.now();

    date = DateTime(now.year, now.month, now.day);
  }

  bool get isValid => _validate();

  bool _validate() {
    if (kWh <= 0) {
      return false;
    }

    if (rateId == null) {
      return false;
    }

    if (rateOverride != null && rateOverride! <= 0) {
      return false;
    }

    return true;
  }
}
