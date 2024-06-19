import 'package:flutter/material.dart';

import '../widgets/evs_app_bar.dart';
import '../widgets/floating_add_button.dart';

class VehicleSelectionScreen extends StatefulWidget {
  const VehicleSelectionScreen({super.key});

  @override
  State<VehicleSelectionScreen> createState() => _VehicleSelectionScreenState();
}

class _VehicleSelectionScreenState extends State<VehicleSelectionScreen> {
  late final String title;

  @override
  void initState() {
    super.initState();

    title = 'Add a vehicle';
  }

  void handleAddVehiclePressed() {}

  // void handleFormSubmit(VehicleForm form) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EvsAppBar(
        titleText: title,
        context: context,
      ),
      body: const Placeholder(),
      floatingActionButton: FloatingAddButton(
        tooltip: 'Add Vehicle',
        onPressed: handleAddVehiclePressed,
      ),
    );
  }
}
