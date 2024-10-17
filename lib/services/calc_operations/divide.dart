import 'operation.dart';

class Divide implements Operation {
  @override
  double execute(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Attempt to divide by 0');
    }

    return a / b;
  }
}
