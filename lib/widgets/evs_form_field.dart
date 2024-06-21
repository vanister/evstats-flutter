import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EvsFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final int? maxLength;
  final TextInputFormatter? inputFormatter;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final double? bottomPadding;

  const EvsFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.maxLength,
    this.inputFormatter,
    this.validator,
    this.controller,
    this.keyboardType,
    this.bottomPadding = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          counterText: null,
        ),
        controller: controller,
        inputFormatters: inputFormatter != null ? [inputFormatter!] : null,
        keyboardType: keyboardType,
        maxLength: maxLength,
        validator: validator,
      ),
    );
  }
}
