library service_provider;

import 'package:get_it/get_it.dart';

part 'ioc.dart';

class ServiceProviders {
  final List<ServiceProvider> _providers;

  ServiceProviders(this._providers);

  static final _container = IoC.container;

  Future<void> boot() async {
    _providers.forEach((_provider) {
      _provider.register(_container);
    });
  }

  void dispose() {
    _providers.clear();
  }
}

abstract class ServiceProvider {
  void register(IoC container);
}
