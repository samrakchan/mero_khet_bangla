import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mero_khet/calculation/ConvertTo.dart';
import 'package:mero_khet/calculation/ConverterFactory.dart';
import 'package:mero_khet/widgets/my_chips.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'admob_service.dart';

class LengthBreadthPage extends StatefulWidget {
  @override
  _LengthBreadthPageState createState() => _LengthBreadthPageState();
}

class _LengthBreadthPageState extends State<LengthBreadthPage> {
  List<String> _inputUnitChoices;
  List<String> _outputUnitChoices;
  int _inputSelectedUnit;
  int _outputSelectedUnit;
  String _outputText = "দৈর্ঘ্য এবং প্রস্থ লিখুন দয়া করে";
  double _inputValue1 = -1;
  double _inputValue2 = -1;


  final double FOOT = 0.092903;


  /*final textEditOneController = TextEditingController();
  final textEditTwoController = TextEditingController();*/

  @override
  void initState() {
    super.initState();
    _inputUnitChoices = [
      'মিটার',//meter
      'ফুট', //foot
    ];
    _outputUnitChoices = ['একর - বিঘা - কাঠা'];
    _inputSelectedUnit = 0;
    _outputSelectedUnit = 0;
  }

  void updateText() {
    if (_inputValue1 == -1 || _inputValue2 == -1) {
      setState(() {
        _outputText = "দৈর্ঘ্য এবং প্রস্থ লিখুন দয়া করে";
      });
      return;
    }

    double inputValueToSqMeter;

    if (_inputSelectedUnit == 0) {
      //वर्ग मीटर
      inputValueToSqMeter = _inputValue1 * _inputValue2;
    } else if (_inputSelectedUnit == 1) {
      //वर्ग फुट
      inputValueToSqMeter = _inputValue1 * _inputValue2 * FOOT;
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
                decoration: InputDecoration(labelText: 'দৈর্ঘ্য'),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r"^\d+\.?\d{0,2}")),
                ],
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                //controller: textEditOneController,
                onChanged: (text) async {
                  if (!isNumeric(text)) {
                    _inputValue1 = -1;
                    setState(() {
                      _outputText = 'উপরে সংখ্যার মান লিখুন';
                    });

                    return;
                  }

                  if (text.trim() == '') {
                    _inputValue1 = -1;
                    setState(() {
                      _outputText = 'উপরে সংখ্যার মান লিখুন';
                    });
                  } else {
                    _inputValue1 = double.parse(text.trim());
                  }
                  updateText();
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'প্রস্থ'),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r"^\d+\.?\d{0,2}")),
                ],
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                //controller: textEditTwoController,
                onChanged: (text) async {
                  if (!isNumeric(text)) {
                    _inputValue2 = -1;
                    setState(() {
                      _outputText = 'উপরে সংখ্যার ইনপুট প্রবেশ করুন';
                    });

                    return;
                  }

                  if (text.trim() == '') {
                    _inputValue2 = -1;
                    setState(() {
                      _outputText = 'উপরে সংখ্যার ইনপুট প্রবেশ করুন';
                    });
                  } else {
                    _inputValue2 = double.parse(text.trim());
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
                  setState(() {
                    _inputSelectedUnit = val;
                  });

                  updateText();
                },
              ),
              Text("রূপান্তরিত করতে ইউনিট"),
              MyChips(
                items: _outputUnitChoices,
                onItemSelected: (int val) {
                  setState(() {
                    _outputSelectedUnit = val;
                  });

                  updateText();
                },
              ),
              /*SizedBox(
                width: 200.0,
                child: FlatButton(
                  onPressed: () {
                    var inputValue1 = double.parse(textEditOneController.text.trim());
                    var inputValue2 = double.parse(textEditTwoController.text.trim());

                    _inputValue = inputValue1*inputValue2;
                    updateText();
                  },
                  color: Theme.of(context).primaryColor,
                  child: Text("रुपान्तरण गर्नुस्", style: TextStyle(color: Colors.white),),
                  //borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  shape: StadiumBorder(),
                ),
              ),*/
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

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }
}
