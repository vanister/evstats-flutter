String? notEmptyString(
  String? value, {
  String? errorMessage = 'A value is required',
}) {
  if (value == null || value.isEmpty) {
    return errorMessage;
  }

  return null;
}

String? parsableInt(
  String? value, {
  String? errorMessage = 'Invalid entry',
}) {
  if (value == null || int.tryParse(value) == null) {
    return errorMessage;
  }

  return null;
}

String? meetsLength(
  String? value, {
  int? min,
  int? max,
  String? errorMessage = 'Required length not met',
}) {
  if (value == null) {
    return errorMessage;
  }

  if (min != null && value.length < min) {
    return errorMessage;
  }

  if (max != null && value.length > max) {
    return errorMessage;
  }

  return null;
}

/// Attempts to parse a [value] in ISO 8601 format (YYYY-MM-DD).
String? parsableDate(String? value, {String? errorMessage = 'Invalid date'}) {
  if (value == null || DateTime.tryParse(value) == null) {
    return errorMessage;
  }

  return null;
}
