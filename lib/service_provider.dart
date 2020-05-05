library service_provider;

import 'package:get_it/get_it.dart';

part 'ioc.dart';

class ServiceProviders {
  static final _providers = [];

  static final _container = IoC.container;

  ServiceProviders add(ServiceProvider serviceProvider) {
    _providers.add(serviceProvider);

    return this;
  }

  static boot() async {
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
