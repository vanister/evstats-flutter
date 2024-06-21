import 'package:flutter/material.dart';

import '../widgets/modal_bottom_sheet_header.dart';
import '../widgets/vehicle/vehicle_add_edit_form.dart';

Future showVehicleForm({
  required BuildContext context,
  Map<String, dynamic>? form,
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
        child: Column(
          children: [
            // header row
            ModalBottleSheetHeader(
              doneText: 'Add',
              onCancelPressed: () {},
              onDonePressed: () {},
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: VehicleAddEditForm(
                isNew: false,
              ),
            ),
          ],
        ),
      );
    },
  );
}
