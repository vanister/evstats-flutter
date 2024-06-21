import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../evs_form_field.dart';

class VehicleAddEditForm extends StatefulWidget {
  final bool isNew;

  const VehicleAddEditForm({super.key, required this.isNew});

  @override
  State<VehicleAddEditForm> createState() => _VehicleAddEditFormState();
}

class _VehicleAddEditFormState extends State<VehicleAddEditForm> {
  final _yearController = TextEditingController();
  final _makeController = TextEditingController();
  final _modelController = TextEditingController();
  final _trimController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: screenWidth * 0.5,
            child: EvsFormField(
              hintText: 'YYYY',
              labelText: 'Year *',
              inputFormatter: FilteringTextInputFormatter.digitsOnly,
              maxLength: 4,
            ),
          ),
          const EvsFormField(
            hintText: 'Ex. Ford',
            labelText: 'Make *',
          ),
          const EvsFormField(
            hintText: 'Mustang Mach-E',
            labelText: 'Model *',
          ),
          const EvsFormField(
            hintText: 'GT',
            labelText: 'Trim',
          ),
          const EvsFormField(
            hintText: '1FMAB12C34D567890',
            labelText: 'VIN',
            maxLength: 17,
          ),
        ],
      ),
    );
  }
}
