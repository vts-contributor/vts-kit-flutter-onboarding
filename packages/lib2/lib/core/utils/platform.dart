import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:vts_kit_flutter_onboarding/core/types/meta.dart';

class PlatformInfo {
  static Future<Meta> get() async {
    var info = DeviceInfoPlugin();

    if (kIsWeb) {
      return Meta(deviceId: 'Web', deviceType: 'Web');
    } else {
      if (Platform.isAndroid) {
        final androidInfo = await info.androidInfo;
        return Meta(deviceId: androidInfo.id, deviceType: 'Android');
      } else if (Platform.isIOS) {
        final iosInfo = await info.iosInfo;
        return Meta(deviceId: iosInfo.identifierForVendor!, deviceType: 'IOS');
      } else {
        return Meta(deviceId: 'Other', deviceType: 'Other');
      }
    }
  }
}
