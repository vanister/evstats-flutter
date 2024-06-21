import 'package:flutter/material.dart';

import '../helpers/vehicle_helper.dart';
import '../widgets/evs_app_bar.dart';
import '../widgets/floating_add_button.dart';

class VehicleSelectionScreen extends StatefulWidget {
  const VehicleSelectionScreen({super.key});

  @override
  State<VehicleSelectionScreen> createState() => _VehicleSelectionScreenState();
}

class _VehicleSelectionScreenState extends State<VehicleSelectionScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _handleAddVehiclePressed() async {
    var result = await showVehicleForm(context: context);

    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EvsAppBar(
        titleText: 'Vehicles',
        context: context,
      ),
      body: const Placeholder(),
      floatingActionButton: FloatingAddButton(
        tooltip: 'Add Vehicle',
        onPressed: _handleAddVehiclePressed,
      ),
    );
  }
}
