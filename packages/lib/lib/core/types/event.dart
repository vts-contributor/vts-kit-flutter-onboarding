import 'dart:convert';

import 'package:vts_kit_flutter_onboarding/core/types/dto/api_response.dart';

class Event implements JsonSerializable {
  final String appId;
  final String sessionId;
  final String userId;
  final String guideCode;
  final String actionType;
  final String timeRun;
  final String? payload;
  late String? status;

  Event(
      {required this.appId,
      required this.sessionId,
      required this.userId,
      required this.guideCode,
      required this.actionType,
      required this.timeRun,
      this.payload,
      this.status});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        appId: json['appId'],
        sessionId: json['sessionId'],
        userId: json['userId'],
        guideCode: json['guideCode'],
        actionType: json['actionType'],
        timeRun: json['timeRun'],
        payload: json['payload']);
  }

  Map<String, dynamic> toJson() {
    return {
      "appId": this.appId,
      "sessionId": this.sessionId,
      "userId": this.userId,
      "guideCode": this.guideCode,
      "actionType": this.actionType,
      "timeRun": this.timeRun,
      "payload": this.payload ?? "",
    };
  }
}
