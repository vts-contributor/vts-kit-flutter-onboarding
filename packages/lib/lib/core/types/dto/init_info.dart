import 'dart:convert';

import 'package:vts_kit_flutter_onboarding/core/types/dto/api_response.dart';

class InitInfo extends JsonSerializable {
  final String userId;
  final String appId;
  final String sessionId;
  final List<String> guideResponses;

  InitInfo(
      {required this.userId,
      required this.appId,
      required this.sessionId,
      required this.guideResponses});

  factory InitInfo.fromJson(Map<String, dynamic> json) {
    return InitInfo(
        userId: json['userId'],
        appId: json['appId'],
        sessionId: json['sessionId'],
        guideResponses: (json['guideResponses'] as List).cast<String>());
  }
}
