import 'general_validator.dart';

@Deprecated('Use notEmptyString(...) from general_validator.dart')
String? validateKwhField(String? value) {
  return notEmptyString(value, errorMessage: 'kWh is required');
}

String? validateDateField(String? value) {
  if (notEmptyString(value) != null) {
    return 'Date is required';
  }

  if (parsableDate(value) != null) {
    return 'Invalid date';
  }

  return null;
}
