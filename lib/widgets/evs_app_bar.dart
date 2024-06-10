import 'package:flutter/material.dart';

class EvsAppBar extends AppBar {
  final String titleText;
  final BuildContext context;

  EvsAppBar({
    super.key,
    required this.context,
    required this.titleText,
  });

  ThemeData get _themeContext => Theme.of(context);

  @override
  Color? get backgroundColor => _themeContext.primaryColor;

  @override
  Widget? get title => Text(
        titleText,
        style: TextStyle(
          color: _themeContext.colorScheme.inversePrimary,
        ),
      );
}
