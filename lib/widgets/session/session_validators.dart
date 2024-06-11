String? validateKwhField(String? value) {
  if (value == null || value.isEmpty) {
    return 'kWh is required';
  }

  return null;
}

String? validateDateField(String? value) {
  if (value == null || value.isEmpty) {
    return 'Date is required';
  }

  if (DateTime.tryParse(value) == null) {
    return 'Invalid date';
  }

  return null;
}
