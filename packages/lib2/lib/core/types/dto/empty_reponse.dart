import 'package:vts_kit_flutter_onboarding/core/types/dto/json_serializable.dart';

class EmptyResponse extends JsonSerializable {
  EmptyResponse();

  factory EmptyResponse.fromJson(Map<String, dynamic> json) {
    return EmptyResponse();
  }
}
