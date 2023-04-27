import 'package:vts_kit_flutter_onboarding/core/configs/client_option.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/http_client_option.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/state.dart';
import 'package:vts_kit_flutter_onboarding/core/services/api.dart';
import 'package:vts_kit_flutter_onboarding/core/services/event_service.dart';
import 'package:vts_kit_flutter_onboarding/core/services/http_client.dart';
import 'package:vts_kit_flutter_onboarding/core/types/client_context.dart';
import 'package:vts_kit_flutter_onboarding/core/utils/logger.dart';
import 'package:vts_kit_flutter_onboarding/core/utils/platform.dart';

class OnboardingClient {
  //#region Property
  static late State state;
  static late Map<String, dynamic> meta;
  static late String appId;
  static late String userId;
  static late String sessionId;

  static late ClientOption options;
  static late ClientContext context;
  static List<Function()> _onInitialized = [];
  static List<Function(State state)> _onStateChanged = [];
  //#endregion

  //#region Singleton Constructor
  static OnboardingClient? _singleton;

  factory OnboardingClient.initialize(ClientOption options) {
    if (_singleton != null) return _singleton!;
    _singleton = OnboardingClient._();

    // Cache options
    OnboardingClient.options = options;

    //// Create Context
    // Create Http Client
    // HttpClient must be created first to pass to other contexts
    HttpClientOption httpOptions =
        HttpClientOption(serverUrl: options.serverUrl, debug: options.debug);

    // HttpClient must be created first to pass to other contexts
    OnboardingClient.context =
        ClientContext(httpClient: HttpClient.create(httpOptions));

    // Create Rest Contexts
    OnboardingClient.context = ClientContext(
        httpClient: OnboardingClient.context.httpClient,
        apiClient: ApiClient.create(),
        eventService: EventService.create());

    // Initialize Application
    _singleton!._setState(State.INITIALIZATING);

    new Future.value().then((_) async => {
          await _singleton!._prepare(),
          await _singleton!._validateApplication()
        });
    return _singleton!;
  }

  OnboardingClient._();
  //#endregion

  //#region Private Methods
  _setState(State state) {
    state = state;
    _onStateChanged.forEach((func) {
      func.call(state);
    });
    if (state == State.INITIALIZED) {
      _onInitialized.forEach((func) {
        func.call();
      });
    }
  }

  Future<void> _prepare() async {
    OnboardingClient.meta = await PlatformInfo.get();
  }

  Future<void> _validateApplication() async {
    try {
      final initInfo = await context.apiClient!.validateApplication();
      OnboardingClient.appId = initInfo.data.appId;
      OnboardingClient.userId = initInfo.data.userId;
      OnboardingClient.sessionId = initInfo.data.sessionId;
      Logger.logSuccess("Success Initialized");
      _setState(State.INITIALIZED);
    } catch (e) {
      Logger.logError("Invalid config provided");
      _setState(State.UNAUTHORIZED);
    }
  }
  //#endregion

  //#region Public Methods
  static OnboardingClient getClient() {
    if (_singleton != null)
      return _singleton!;
    else {
      throw new Exception('Client must be initialized before being accessed');
    }
  }

  static void onInitialized(Function() func) {
    _onInitialized.add(func);
  }

  static void onStateChange(Function(State state) func) {
    _onStateChanged.add(func);
  }
  //#endregion

}
