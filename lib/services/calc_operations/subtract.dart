import 'operation.dart';

class Subtract implements Operation {
  @override
  double execute(double a, double b) => a - b;
}
