abstract class JsonSerializable {
  JsonSerializable();

  factory JsonSerializable.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson() not implemented');
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError('toJson() not implemented');
  }
}

class ApiResponse<T extends JsonSerializable> {
  final T data;
  final String message;
  final int code;

  ApiResponse({required this.data, required this.message, required this.code});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    return ApiResponse<T>(
      data: fromJson(json['data']),
      code: json['code'],
      message: json['message'],
    );
  }
}
