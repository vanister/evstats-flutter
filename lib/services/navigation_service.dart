import 'package:flutter/material.dart';

abstract class NavigationService {
  /// Navigates to a [screen] and remove the back button.
  /// This is a one-way navigation.
  ///
  /// Per flutter lint warning. If used in a stateful widget's async function, check
  /// if the state is `mounted` before calling this function.
  ///
  /// https://dart-lang.github.io/linter/lints/use_build_context_synchronously.html
  Future navigateTo(BuildContext context, Widget screen);
}

class EvsNavigationService implements NavigationService {
  @override
  Future navigateTo(BuildContext context, Widget screen) {
    return Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (_) => screen), (route) => false);
  }
}
