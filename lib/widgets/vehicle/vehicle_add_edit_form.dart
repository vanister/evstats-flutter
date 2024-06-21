import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/vehicle_form.dart';
import '../evs_form_field.dart';
import '../modal_bottom_sheet_header.dart';

class VehicleAddEditForm extends StatefulWidget {
  final bool isNew;
  final VehicleForm? editingForm;
  final void Function(VehicleForm) onSubmit;
  final void Function() onCancel;

  const VehicleAddEditForm({
    super.key,
    this.editingForm,
    required this.isNew,
    required this.onSubmit,
    required this.onCancel,
  });

  @override
  State<VehicleAddEditForm> createState() => _VehicleAddEditFormState();
}

class _VehicleAddEditFormState extends State<VehicleAddEditForm> {
  final _formKey = GlobalKey<FormState>();
  final _yearController = TextEditingController();
  final _makeController = TextEditingController();
  final _modelController = TextEditingController();
  final _trimController = TextEditingController();
  final _vinController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _handleDonePressed() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    var vehicle = VehicleForm(
      year: int.parse(_yearController.text),
      make: _makeController.text,
      model: _modelController.text,
      trim: _trimController.text,
      vin: _vinController.text,
    );

    widget.onSubmit(vehicle);
  }

  void _handleCancelPressed() {
    widget.onCancel();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        ModalBottleSheetHeader(
          doneText: 'Add',
          onCancelPressed: _handleCancelPressed,
          onDonePressed: _handleDonePressed,
        ),
        Padding(
          key: _formKey,
          // padding to line up form with header buttons aboce
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth * 0.5,
                  child: EvsFormField(
                    controller: _yearController,
                    hintText: 'YYYY',
                    labelText: 'Year *',
                    inputFormatter: FilteringTextInputFormatter.digitsOnly,
                    maxLength: 4,
                  ),
                ),
                EvsFormField(
                  controller: _makeController,
                  hintText: 'Ford',
                  labelText: 'Make *',
                ),
                EvsFormField(
                  controller: _modelController,
                  hintText: 'Mustang Mach-E',
                  labelText: 'Model *',
                ),
                EvsFormField(
                  controller: _trimController,
                  hintText: 'GT',
                  labelText: 'Trim',
                ),
                EvsFormField(
                  controller: _vinController,
                  hintText: '1FMAB12C34D567890',
                  labelText: 'VIN',
                  maxLength: 17,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
