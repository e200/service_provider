part of 'service_provider.dart';

class IoC {
  static IoC container = IoC();

  static final _getIt = GetIt.I;

  T get<T>() {
    return _getIt.get<T>();
  }

  void register<T>(instance) {
    _getIt.registerSingleton<T>(instance);
  }

  void registerAsync<T>(Future<T> Function() factoryFunction) {
    _getIt.registerSingletonAsync<T>(factoryFunction);
  }

  void registerWithDependence<T>(
    Function() factoryFunction, {
    Iterable<Type> dependsOn,
  }) {
    _getIt.registerSingletonWithDependencies<T>(
      factoryFunction,
      dependsOn: dependsOn,
    );
  }

  void registerFactory<T>(T Function() factoryFunction) {
    _getIt.registerFactory<T>(factoryFunction);
  }

  void registerFactoryAsync<T>(Future<T> Function() factoryFunction) {
    _getIt.registerFactoryAsync<T>(factoryFunction);
  }

  static void onReady(Function callback) {
    _getIt.allReady().then(callback);
  }
}
