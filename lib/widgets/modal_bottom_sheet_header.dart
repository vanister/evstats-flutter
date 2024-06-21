import 'package:flutter/material.dart';

class ModalBottleSheetHeader extends StatelessWidget {
  final String? cancelText;
  final String? doneText;

  final void Function()? onCancelPressed;
  final void Function()? onDonePressed;

  const ModalBottleSheetHeader({
    super.key,
    this.cancelText = 'Cancel',
    this.doneText = 'Done',
    required this.onCancelPressed,
    required this.onDonePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onCancelPressed,
          child: Text(cancelText!),
        ),
        TextButton(
          onPressed: onDonePressed,
          child: Text(doneText!),
        ),
      ],
    );
  }
}
