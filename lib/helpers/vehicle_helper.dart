import 'package:flutter/material.dart';

import '../models/vehicle_form.dart';
import '../widgets/vehicle/vehicle_add_edit_form.dart';

Future showVehicleForm({
  required BuildContext context,
  VehicleForm? editingForm,
}) {
  final maxHeight = MediaQuery.of(context).size.height * 0.90;

  return showModalBottomSheet(
    context: context,
    backgroundColor: Theme.of(context).dialogBackgroundColor,
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: maxHeight,
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: VehicleAddEditForm(
          isNew: false,
          onSubmit: (VehicleForm form) {
            Navigator.pop(context, form);
          },
          onCancel: () {
            Navigator.pop(context);
          },
        ),
      );
    },
  );
}
