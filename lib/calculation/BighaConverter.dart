import 'package:mero_khet/calculation/Converter.dart';
import 'package:sprintf/sprintf.dart';

class BighaConverter extends Converter{
  double valInMeterSquare;
  //acre, bigha, kattha respectively
  var abkArray = [4013.412, 1337.804, 66.8902];

  BighaConverter(double valInMeterSquare){
    this.valInMeterSquare = valInMeterSquare;
  }

  @override
  String convert() {
    var result = List<int>(3);

    for(var i = 0; i < abkArray.length; i++){
      print(valInMeterSquare.toString()+" "+abkArray[i].toString());
      var value = roundToDecimals( valInMeterSquare / abkArray[i], 1);
      result[i] = value.toInt();
      valInMeterSquare -=result[i]*abkArray[i];
    }
    var remainingArea = roundToDecimals(valInMeterSquare, 2)<0 ? 0.0 : roundToDecimals(valInMeterSquare, 2);

    return sprintf('%d একর, %d বিঘা, %d কাঠা, এবং '+remainingArea.toString()+'বর্গ মিটার', result) ;
  }
  
}