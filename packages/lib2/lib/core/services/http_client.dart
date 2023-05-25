import 'package:dio/dio.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/http_client_option.dart';
import 'package:vts_kit_flutter_onboarding/core/types/dto/api_response.dart';
import 'package:vts_kit_flutter_onboarding/core/types/dto/json_serializable.dart';
import 'package:vts_kit_flutter_onboarding/core/utils/logger.dart';

class HttpClient {
  //#region Singleton Constructor
  static HttpClient? _singleton;

  late Dio _dioClient;
  factory HttpClient.create(HttpClientOption options) {
    if (_singleton == null) {
      _singleton = HttpClient._();
      final dio = Dio();
      dio
        ..options.baseUrl = options.serverUrl
        ..options.connectTimeout = options.connectionTimeout
        ..options.receiveTimeout = options.receiveTimeout
        ..options.headers = options.headers;

      if (options.debug) dio.interceptors.add(DebugInterceptors());

      _singleton!._dioClient = dio;
      return _singleton!;
    } else {
      throw Logger.throwError('Invalid operator');
    }
  }

  Dio getClient() {
    if (_singleton != null)
      return _singleton!._dioClient;
    else
      throw new Exception('HttpClient is not created');
  }

  HttpClient._();
  //#endregion

  //#region Private Methods
  _mappingResponse<T extends JsonSerializable>(
      Map<String, dynamic> json, T Function(Map<String, dynamic>)? fromJson) {
    return ApiResponse.fromJson(json, fromJson);
  }
  //#endregion

  //#region Public Methods
  Future<ApiResponse<T>> get<T extends JsonSerializable>(
    String path,
    T Function(Map<String, dynamic>)? fromJson, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await this.getClient().get(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
    return _mappingResponse(response.data, fromJson);
  }

  Future<ApiResponse<T>> post<T extends JsonSerializable>(
    String path,
    T Function(Map<String, dynamic>)? fromJson, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await this.getClient().post(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    return _mappingResponse(response.data, fromJson);
  }
  //#endregion
}

class DebugInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logger.log('REQUEST[${options.method}] ${options.path}');
    Logger.log('=> PARAM: ${options.queryParameters}');
    Logger.log('=> BODY: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger.log(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Logger.logError(
        'ERROR[${err.requestOptions.method}] ${err.requestOptions.path}');
    Logger.logError('=> CODE: ${err.response?.statusCode}');
    Logger.logError('=> MESSAGE: ${err.response?.statusMessage}');
    super.onError(err, handler);
  }
}
