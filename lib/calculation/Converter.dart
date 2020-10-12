import 'dart:math';

abstract class Converter{

  String convert();

  double roundToDecimals(double value, int numberOfDecimalPlaces){
    var factor = pow(10.0, 2);
    return (value * factor).round() / factor;
  }
}