import 'package:flutter/material.dart';

class FloatingAddButton extends StatelessWidget {
  final String tooltip;
  final Function()? onPressed;

  const FloatingAddButton({
    super.key,
    required this.tooltip,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: tooltip,
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
