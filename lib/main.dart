import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mero_khet/about.dart';
import 'package:mero_khet/land_converter.dart';
import 'package:mero_khet/land_converter_two.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  // Initialize without device test ids.
  Admob.initialize(testDeviceIds: ['C71BC203BE9549A705F242C831352459']);
  // Or add a list of test ids.
  // Admob.initialize(testDeviceIds: ['YOUR DEVICE ID']);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(180, 28, 131, 1.0),
        accentColor: Color.fromRGBO(243, 211, 4, 1.0),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ভূমি পরিমাপ"),
          bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(MaterialIcons.crop_din),
                  text: 'অঞ্চল রূপান্তর',
                ),
                Tab(
                  icon: Icon(MaterialIcons.crop_free),
                  text: 'দৈর্ঘ্য প্রস্থ রূপান্তর',
                ),
                Tab(
                  icon: Icon(SimpleLineIcons.info),
                  text: 'আমাদের সম্পর্কে',
                ),
              ]
          ),
        ),
        body: TabBarView(
          children: [
            LandConverterPage(),
            LengthBreadthPage(),
            About(),
          ],
        ),
      ),
    );
  }



}


