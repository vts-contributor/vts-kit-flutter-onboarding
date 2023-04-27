import 'package:vts_kit_flutter_onboarding/core/types/dto/api_response.dart';

class EmptyResponse extends JsonSerializable {
  EmptyResponse();

  factory EmptyResponse.fromJson(Map<String, dynamic> json) {
    return EmptyResponse();
  }
}
