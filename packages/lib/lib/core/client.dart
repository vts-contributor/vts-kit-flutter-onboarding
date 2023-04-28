import 'package:shared_preferences/shared_preferences.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/client_option.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/http_client_option.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/state.dart'
    as ClientState;
import 'package:vts_kit_flutter_onboarding/core/services/action_queue.dart';
import 'package:vts_kit_flutter_onboarding/core/services/api.dart';
import 'package:vts_kit_flutter_onboarding/core/services/event_service.dart';
import 'package:vts_kit_flutter_onboarding/core/services/http_client.dart';
import 'package:vts_kit_flutter_onboarding/core/types/client_context.dart';
import 'package:vts_kit_flutter_onboarding/core/types/meta.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/abstract.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/tooltip/tooltip.dart';
import 'package:vts_kit_flutter_onboarding/core/utils/logger.dart';
import 'package:vts_kit_flutter_onboarding/core/utils/platform.dart';
import 'package:flutter/material.dart';

const PREF_USERID_KEY = "PREF_USERID_KEY";

class OnboardingClient {
  //#region Property
  static late ClientState.State state = ClientState.State.UNSET;
  static late Meta meta;
  static late String appId;
  static late String? userId;
  static late String sessionId;
  static late List<String> guides = [];

  static late ClientOption options;
  static late ClientContext context;
  static late Map<String, UIAbstract> _ui = {};
  static List<Function()> _onInitialized = [];
  static List<Function(ClientState.State state)> _onStateChanged = [];
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
        eventService: EventService.create(),
        actionQueue: ActionQueue.create());

    // Initialize Application
    _singleton!._setState(ClientState.State.INITIALIZATING);

    _singleton!._prepare().then((_) async {
      await _singleton!._validateApplication();
      return;
    });
    return _singleton!;
  }

  OnboardingClient._();
  //#endregion

  //#region Private Methods
  _setState(ClientState.State state) {
    OnboardingClient.state = state;
    _onStateChanged.forEach((func) {
      func.call(state);
    });
    if (state == ClientState.State.INITIALIZED) {
      _onInitialized.forEach((func) {
        func.call();
      });
    }
  }

  Future<void> _prepare() async {
    OnboardingClient.meta = await PlatformInfo.get();
    OnboardingClient.userId =
        await SharedPreferences.getInstance().then((instance) {
      return instance.getString(PREF_USERID_KEY);
    });
    OnboardingClient.registerUI(UITooltip());
  }

  Future<void> _validateApplication() async {
    try {
      final initInfo = await context.apiClient!.validateApplication();
      OnboardingClient.appId = initInfo.data.appId;
      OnboardingClient.userId = initInfo.data.userId;
      OnboardingClient.sessionId = initInfo.data.sessionId;
      OnboardingClient.guides = initInfo.data.guideResponses;
      await SharedPreferences.getInstance().then((instance) {
        instance.setString(PREF_USERID_KEY, initInfo.data.userId);
      });
      Logger.logSuccess("Success Initialized");
      _setState(ClientState.State.INITIALIZED);
    } catch (e) {
      Logger.logError("Invalid config provided");
      _setState(ClientState.State.UNAUTHORIZED);
    }
  }
  //#endregion

  //#region Public Methods
  static void registerUI(UIAbstract ui) {
    if (_ui.containsKey(ui.getName())) {
      throw Logger.throwError("${ui.getName()} already existed");
    }
    _ui[ui.getName()] = ui;
  }

  static void start(
      {required String guideCode,
      required String guideType,
      required BuildContext context,
      required dynamic payload}) async {
    if (_ui.containsKey(guideType)) {
      final ui = _ui[guideType]!;
      OnboardingClient.context.actionQueue!.addAction(
          guideCode: guideCode, ui: ui, context: context, payload: payload);
    } else {
      throw Logger.throwError("$guideType is not a valid type");
    }
  }

  static void dismiss() {
    OnboardingClient.context.actionQueue!.dismiss();
  }

  static void onInitialized(Function() func) {
    _onInitialized.add(func);
  }

  static void onStateChange(Function(ClientState.State state) func) {
    _onStateChanged.add(func);
  }
  //#endregion
}
