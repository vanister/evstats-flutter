class DatePickerRange {
  late final DateTime? initial;
  final DateTime start;
  final DateTime end;

  DatePickerRange({
    required this.start,
    required this.end,
    this.initial,
  });
}
