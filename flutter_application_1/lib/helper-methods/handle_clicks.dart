import 'package:flutter/foundation.dart';

class HandleClicks {
  
  static void printCatFace({String text = ':3'}) {
  // Got a warning when trying just print('thanks') because it won't work well in production. 
    if(kDebugMode) {
      debugPrint(text);
    }
  }

}