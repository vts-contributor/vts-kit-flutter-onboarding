import 'package:vts_kit_flutter_onboarding/core/types/dto/empty_reponse.dart';
import 'package:vts_kit_flutter_onboarding/core/types/dto/json_serializable.dart';

class ApiResponse<T extends JsonSerializable> {
  final T data;
  final String message;
  final int code;

  ApiResponse({required this.data, required this.message, required this.code});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>)? fromJson) {
    return ApiResponse<T>(
      data: fromJson != null ? fromJson(json['data']) : EmptyResponse() as T,
      code: json['code'],
      message: json['message'],
    );
  }
}
