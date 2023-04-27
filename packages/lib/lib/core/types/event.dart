import 'dart:convert';

import 'package:vts_kit_flutter_onboarding/core/types/dto/api_response.dart';

class Event implements JsonSerializable {
  final String appId;
  final String sessionId;
  final List<Map<String, dynamic>> data;

  Event(
      {required this.appId,
      required this.sessionId,
      List<Map<String, dynamic>>? data})
      : data = data ?? [];

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        appId: json['appId'],
        sessionId: json['sessionId'],
        data: (json['data'] as List).cast<Map<String, dynamic>>());
  }

  Map<String, dynamic> toJson() {
    return {
      "appId": this.appId,
      "sessionId": this.sessionId,
      "data": this.data,
    };
  }
}
