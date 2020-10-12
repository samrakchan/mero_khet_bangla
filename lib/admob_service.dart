import 'dart:io';

class AdMobService {

  static String get addMobAppId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7283160224626949~2950498796";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7283160224626949/3476595485";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

}