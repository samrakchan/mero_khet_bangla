
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'admob_service.dart';

class About extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('আমাদের সম্পর্কে', style: TextStyle(height: 3, fontWeight: FontWeight.bold),),
          Text('ভূমি পরিমাপ একটি সহজ অ্যাপ্লিকেশন যা ইউনিটকে রূপান্তর করে। এই অ্যাপ্লিকেশনটি ব্যবহার করে আপনি সহজেই প্রায় সমস্ত অঞ্চল ইউনিট রূপান্তর করতে পারেন।', style: TextStyle(height: 1.5,), textAlign: TextAlign.justify,),
          Text(''),
          Text('আমরা কীভাবে এই অ্যাপটিকে উন্নত করতে পারি সে সম্পর্কে আপনার পরামর্শগুলি সর্বদা প্রয়োজন। পরামর্শের জন্য samroid.ghimire@gmail.com এ যোগাযোগ করতে পারেন।', style: TextStyle(height: 1.5,), textAlign: TextAlign.justify),
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
    );
  }

}