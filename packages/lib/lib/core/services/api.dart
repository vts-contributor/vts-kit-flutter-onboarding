import 'package:vts_kit_flutter_onboarding/core/client.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/api_url.dart';
import 'package:vts_kit_flutter_onboarding/core/services/http_client.dart';
import 'package:vts_kit_flutter_onboarding/core/types/dto/api_response.dart';
import 'package:vts_kit_flutter_onboarding/core/types/dto/empty_reponse.dart';
import 'package:vts_kit_flutter_onboarding/core/types/dto/init_info.dart';
import 'package:vts_kit_flutter_onboarding/core/utils/logger.dart';

class ApiClient {
  //#region Singleton Constructor
  static ApiClient? _singleton;
  static late HttpClient _httpClient;

  factory ApiClient.create() {
    if (_singleton == null) {
      _singleton = ApiClient._();
      _httpClient = OnboardingClient.context.httpClient;
      return _singleton!;
    } else {
      throw Logger.throwError('Invalid operator');
    }
  }

  ApiClient._();
  //#endregion

  //#region Public Methods
  Future<ApiResponse<InitInfo>> validateApplication() async {
    final info = await _httpClient
        .post(ApiUrl.VALIDATE, (data) => InitInfo.fromJson(data), data: {
      "appId": OnboardingClient.options.applicationId,
      "deviceType": OnboardingClient.meta.deviceType,
      "deviceId": OnboardingClient.meta.deviceId,
      "userId": OnboardingClient.userId
    });
    return info;
  }

  Future<ApiResponse> pushLog(String logs) async {
    return await _httpClient.post('http://phucnh.free.beeceptor.com/',
        (data) => EmptyResponse.fromJson(data),
        data: logs);
  }
  //#endregion
}
