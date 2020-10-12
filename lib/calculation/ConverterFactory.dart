import 'package:mero_khet/calculation/BighaConverter.dart';
import 'package:mero_khet/calculation/ConvertTo.dart';
import 'package:mero_khet/calculation/RopaniConverter.dart';

class ConverterFactory{

  static String convert(ConvertTo convertTo, double value){
    String converter;
    switch(convertTo){
      case ConvertTo.ACRE_BIGHA_KATTHA: converter = BighaConverter(value).convert(); break;
      case ConvertTo.ROPANI_ANA_PAISA_DAM: converter = RopaniConverter(value).convert(); break;
    }
    return converter;
  }
}