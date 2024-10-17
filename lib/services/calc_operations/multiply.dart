import 'operation.dart';

class Multiply implements Operation {
  @override
  double execute(double a, double b) => a * b;
}
