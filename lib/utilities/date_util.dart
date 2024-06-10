/// Gets a [date] string in the format of `YYYY-MM-DD`. If the [date]
/// is `null`, now will be used.
String getFormattedDate({DateTime? date}) {
  final dateToFormat = date ?? DateTime.now();
  final year = dateToFormat.year.toString();
  final month = dateToFormat.month.toString().padLeft(2, '0');
  final day = dateToFormat.day.toString().padLeft(2, '0');

  final formatted = '$year-$month-$day';

  return formatted;
}
