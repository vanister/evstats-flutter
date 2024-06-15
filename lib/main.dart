import 'package:flutter/material.dart';

import 'app.dart';
import 'app_services.dart';

void main() async {
  AppServices.init();

  runApp(const App());
}
