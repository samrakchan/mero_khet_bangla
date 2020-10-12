import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mero_khet/calculation/ConvertTo.dart';
import 'package:mero_khet/calculation/ConverterFactory.dart';
import 'package:mero_khet/widgets/my_chips.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'admob_service.dart';

class LandConverterPage extends StatefulWidget {
  @override
  _LandConverterPageState createState() => _LandConverterPageState();
}

class _LandConverterPageState extends State<LandConverterPage> {
  List<String> _inputUnitChoices;
  List<String> _outputUnitChoices;
  int _inputSelectedUnit;
  int _outputSelectedUnit;
  String _outputText = "উপরের অঞ্চলটি প্রবেশ করান";
  double _inputValue = -1;

  final double ACRE = 4013.412;
  final double BIGHA = 1337.804;
  final double KATTHA = 66.8902;
  final double FOOT = 0.092903;
  final double HECTARE = 10000;


  @override
  void initState() {
    super.initState();
    _inputUnitChoices = [
      'বর্গ মিটার', //sq meter
      'বর্গফুট', //sq foot
      'একর', //Acre
      "বিঘা", //bigha
      'কাঠা', //kattha
      'হেক্টর' //hectare
    ];
    _outputUnitChoices = ['একর - বিঘা - কাঠা'];
    _inputSelectedUnit = 0;
    _outputSelectedUnit = 0;
  }

  void updateText() {
    if (_inputValue == -1) {
      setState(() {
        _outputText = "উপরের অঞ্চলটি প্রবেশ করান";
      });
      return;
    }

    double inputValueToSqMeter;

    if (_inputSelectedUnit == 0) {
      //वर्ग मीटर
      inputValueToSqMeter = _inputValue;
    } else if (_inputSelectedUnit == 1) {
      //वर्ग फुट
      inputValueToSqMeter = _inputValue * FOOT;
    } else if (_inputSelectedUnit == 2) {
      //बिघा
      inputValueToSqMeter = _inputValue * ACRE;
    } else if (_inputSelectedUnit == 3) {
      //कठ्ठा
      inputValueToSqMeter = _inputValue * BIGHA;
    } else if (_inputSelectedUnit == 4) {
      //धुर
      inputValueToSqMeter = _inputValue * KATTHA;

    } else if (_inputSelectedUnit == 5) {
      //धुर
      inputValueToSqMeter = _inputValue * HECTARE;
    }

    if (_outputSelectedUnit == 0) {
      setState(() {
        _outputText = ConverterFactory.convert(
            ConvertTo.ACRE_BIGHA_KATTHA, inputValueToSqMeter);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'ক্ষেত্রফল'),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r"^\d+\.?\d{0,2}")),
                ],
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                onChanged: (text) async {
                  if (!isNumeric(text)) {
                    _inputValue = -1;
                    setState(() {
                      _outputText = 'উপরে সংখ্যার মান লিখুন';
                    });

                    return;
                  }

                  if (text.trim() == '') {
                    _inputValue = -1;
                    setState(() {
                      _outputText = 'উপরে সংখ্যার মান লিখুন';
                    });
                  } else {
                    _inputValue = double.parse(text.trim());
                  }
                  updateText();
                },
              ),
              Text(
                "ইনপুট ইউনিট",
                style: TextStyle(height: 2),
              ),
              MyChips(
                items: _inputUnitChoices,
                onItemSelected: (int val) {
                  _inputSelectedUnit = val;
                  updateText();
                },
              ),
              Text("রূপান্তরিত করতে ইউনিট"),
              MyChips(
                items: _outputUnitChoices,
                onItemSelected: (int val) {
                  _outputSelectedUnit = val;
                  updateText();
                },
              ),
              Text("ফলাফল", style: TextStyle(height: 2)),
              Text(
                '$_outputText',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                    height: 2),
              ),
              //AD Here
              Container(
                margin: EdgeInsets.only(top: 20),
                child: AdmobBanner(
                  adUnitId: AdMobService.bannerAdUnitId,
                  adSize: AdmobBannerSize.BANNER,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }
}
