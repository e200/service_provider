library service_provider;

import 'ioc.dart';

abstract class ServiceProvider {
  void register(IoC container);
}
