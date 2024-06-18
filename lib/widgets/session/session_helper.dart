import 'package:flutter/material.dart';

import '../../models/rate_type.dart';

Iterable<DropdownMenuEntry<int>> getRateTypes(Iterable<RateType> rateTypes) {
  final entries = rateTypes.map(
    (rateType) => DropdownMenuEntry(
      value: rateType.id,
      label: rateType.name,
    ),
  );

  return entries;
}
