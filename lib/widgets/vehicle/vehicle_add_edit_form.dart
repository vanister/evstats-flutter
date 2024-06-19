import 'package:flutter/material.dart';

class VehicleForm extends StatefulWidget {
  final bool isNew;

  const VehicleForm({super.key, required this.isNew});

  @override
  State<VehicleForm> createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Form(child: Text('test'));
  }
}
