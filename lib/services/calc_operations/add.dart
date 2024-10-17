import 'operation.dart';

class Add implements Operation {
  @override
  double execute(double a, double b) => a + b;
}
