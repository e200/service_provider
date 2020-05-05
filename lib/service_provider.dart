library service_provider;

import 'ioc.dart';

class ServiceProvider {
  static final _providers = [];

  ServiceProvider add(ServiceProviderContract serviceProvider, [String name]) {
    _providers.add(serviceProvider);

    return this;
  }

  void dispose() {}
}

abstract class ServiceProviderContract {
  void register(IoC container);
}
