import 'package:get_it/get_it.dart';

/// Wraps the functionality of GetIt that's only used by the app
abstract class ServiceLocator {
  static final _instance = GetIt.instance;

  /// Gets a registered service of type T.
  static T get<T extends Object>() {
    return _instance.get<T>();
  }

  /// Registers a singleton that is lazily instantiated using the provided
  /// [factory] function.
  static void registerLazySingleton<T extends Object>(T Function() factory) {
    _instance.registerLazySingleton(factory);
  }

  /// Registers a singleton that is lazily instantiated using the provided
  /// asynchronous [factory] function.
  static void registerLazySingletonAsync<T extends Object>(
    Future<T> Function() factory,
  ) {
    _instance.registerLazySingletonAsync(factory);
  }
}
