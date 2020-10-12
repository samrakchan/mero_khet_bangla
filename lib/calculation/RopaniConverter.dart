import 'package:mero_khet/calculation/Converter.dart';
import 'package:sprintf/sprintf.dart';

class RopaniConverter extends Converter{
  double valInMeterSquare;
  //Ropani, ana, paisa, dam respectively
  var rapdArray = [508.72, 31.80, 7.95, 1.99];

  RopaniConverter(double valInMeterSquare){
    this.valInMeterSquare = valInMeterSquare;
  }

  @override
  String convert() {
    var result = List<int>(4);

    for(var i = 0; i < rapdArray.length; i++){
      var value = roundToDecimals( valInMeterSquare/ rapdArray[i], 1);
      result[i] = value.toInt();
      valInMeterSquare -=result[i]*rapdArray[i];
    }
    var remainingArea = roundToDecimals(valInMeterSquare, 2)<0 ? 0.0 : roundToDecimals(valInMeterSquare, 2);

    return sprintf('%d रोपनी, %d आना, %d पैसा, %d दाम, र '+remainingArea.toString()+' वर्ग मीटर', result) ;
  }

}