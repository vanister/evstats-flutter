import 'package:flutter/material.dart';

import 'app.dart';
import 'app_startup.dart';

void main() async {
  AppStartup.registerServices();

  runApp(const App());
}
