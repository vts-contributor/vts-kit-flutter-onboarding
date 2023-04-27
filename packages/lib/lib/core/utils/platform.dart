import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class PlatformInfo {
  static Future<Map<String, dynamic>> get() async {
    var info = DeviceInfoPlugin();
    var platformData = <String, dynamic>{};

    if (kIsWeb) {
      platformData['platform'] = 'Web';
      platformData['deviceId'] = 'Web';
    } else {
      if (Platform.isAndroid) {
        final androidInfo = await info.androidInfo;
        platformData['platform'] = 'Android';
        platformData['deviceId'] = androidInfo.id;
      } else if (Platform.isIOS) {
        final iosInfo = await info.iosInfo;
        platformData['platform'] = 'IOS';
        platformData['deviceId'] = iosInfo.identifierForVendor;
      } else {
        platformData['platform'] = 'Other';
        platformData['deviceId'] = 'Other';
      }
    }

    return platformData;
  }
}
