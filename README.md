# service_provider 0.0.2

## Getting Started

```dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceProviders([
    HttpServiceProvider(),
    UserRepositoryServiceProvider(),
  ])
  .boot();

  runApp(App());
}

class CalculatorServiceProvider extends ServiceProvider {
  @override
  void register(IoC container) {
    final method = SumMethod();

    container.registerAsync<MathMethod>(() async => method);

    container.registerWithDependencies<Calculator>(
      () {
        return Calculator(
          IoC.get<MathMethod>(),
        )
      },
      dependsOn: [ MathMethod ]
    ,);
  }
}

class Calculator {
  final MathMethod method;

  Calculator(this.method);

  int calculate(int a, int b) {
    return method.calculate(a, b);
  }
}

class Sum extends MathMethod {
  @override
  int calculate(int a, int b) {
    return a + b;
  }
}

abstract class MathMethod {
  int calculate(int a, int b);
}

```
