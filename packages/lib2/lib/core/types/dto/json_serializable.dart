import 'dart:convert';

abstract class JsonSerializable {
  JsonSerializable();

  factory JsonSerializable.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson() not implemented');
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError('toJson() not implemented');
  }
}

extension ListToJson<T extends JsonSerializable> on List<T> {
  List<String> toJson<T>() {
    return this.map((item) => json.encode(item.toJson())).toList();
  }
}

extension ListFromJson<T extends JsonSerializable> on List<String> {
  List<T> fromJson<T>(T Function(Map<String, dynamic>) fromJson) {
    return this.map((item) => fromJson(json.decode(item))).toList();
  }
}
