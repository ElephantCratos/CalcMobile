import 'operation.dart';
import 'dart:math';

class Exponintation implements Operation {
  @override
  double execute(double a, double b) => pow(a, b).toDouble();
}
