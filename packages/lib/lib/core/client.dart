import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/http_client_option.dart';
import 'package:vts_kit_flutter_onboarding/core/services/action_queue.dart';
import 'package:vts_kit_flutter_onboarding/core/services/api.dart';
import 'package:vts_kit_flutter_onboarding/core/services/event_service.dart';
import 'package:vts_kit_flutter_onboarding/core/services/http_client.dart';
import 'package:vts_kit_flutter_onboarding/core/types/client_context.dart';
import 'package:vts_kit_flutter_onboarding/core/types/meta.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/abstract.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/carousel.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/sheet/sheet.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/popup.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/tooltip/tooltip.dart';
import 'package:vts_kit_flutter_onboarding/core/utils/logger.dart';
import 'package:vts_kit_flutter_onboarding/core/utils/platform.dart';
import 'package:flutter/material.dart';
import 'package:vts_kit_flutter_onboarding/index.dart';

const PREF_USERID_KEY = "PREF_USERID_KEY";

class OnboardingClient {
  //#region Property
  static late ClientState state = ClientState.UNSET;
  static late Meta meta;
  static late String appId;
  static late String? userId;
  static late String sessionId;
  static late List<String> guides = [];
  static OnboardingRouteObserver? routeObserver;

  static late ClientOption options;
  static late ClientContext context;
  static late Map<String, UIAbstract> _ui = {};
  static List<Function()> _onInitialized = [];
  static List<Function(ClientState state)> _onStateChanged = [];
  //#endregion

  //#region Singleton Constructor
  static OnboardingClient? _singleton;

  factory OnboardingClient.initialize(ClientOption options) {
    if (_singleton != null) {
      throw Logger.throwError("OnboardingClient can only initialized once");
    }
    ;
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
    _singleton!._setState(ClientState.INITIALIZATING);

    _singleton!._prepare().then((_) async {
      await _singleton!._validateApplication(options.offline);
      OnboardingClient.context.eventService!.createPushTask();
      OnboardingClient.context.actionQueue!.createActionTask();
    });
    return _singleton!;
  }

  OnboardingClient._();
  //#endregion

  //#region Private Methods
  _setState(ClientState state) {
    OnboardingClient.state = state;
    _onStateChanged.forEach((func) {
      func.call(state);
    });
    if (state == ClientState.INITIALIZED) {
      _onInitialized.forEach((func) {
        func.call();
      });
    }
  }

  Future<void> _prepare() async {
    // Register UI Components
    OnboardingClient.registerUI(UITooltip());
    OnboardingClient.registerUI(UIPopup());
    OnboardingClient.registerUI(UICarousel());
    OnboardingClient.registerUI(UISheet());

    // Fetch cache
    OnboardingClient.meta = await PlatformInfo.get();
    OnboardingClient.userId =
        await SharedPreferences.getInstance().then((instance) {
      return instance.getString(PREF_USERID_KEY);
    });
  }

  Future<void> _validateApplication(bool offline) async {
    if (offline) {
      OnboardingClient.appId = '';
      OnboardingClient.userId = '';
      OnboardingClient.sessionId = '';
      OnboardingClient.guides = [];
      Logger.logSuccess("Success Initialized");
      _setState(ClientState.INITIALIZED);
      return;
    }

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
      _setState(ClientState.INITIALIZED);
    } catch (e) {
      Logger.logError(
          "Unable to initialize. Please recheck internet connection and identity provided");
      _setState(ClientState.UNAUTHORIZED);
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
      required dynamic payload,
      Duration? delayBeforePlay,
      Duration? delayUntilNext}) async {
    // If mounting, retry later
    if (!context.mounted) {
      Timer(Duration(milliseconds: 200), () {
        start(
            guideCode: guideCode,
            guideType: guideType,
            context: context,
            payload: payload,
            delayBeforePlay: delayBeforePlay,
            delayUntilNext: delayUntilNext);
        return;
      });
    }

    // Check if UI is registered
    if (!_ui.containsKey(guideType)) {
      throw Logger.throwError("$guideType is not a valid type");
    }

    // Check if route observer is created
    if (OnboardingClient.options.routeTracking &&
        OnboardingClient.routeObserver == null) {
      throw Logger.throwError(
          "[routeObserver] is being use but no instance of [OnboardingRouteObserver] found. Please provide [OnboardingRouteObserver] inside [navigatorObservers] of [MaterialApp].");
    }

    final ui = _ui[guideType]!;
    OnboardingClient.context.actionQueue!.addAction(
        guideCode: guideCode,
        ui: ui,
        context: context,
        payload: payload,
        delayBeforePlay: delayBeforePlay,
        delayUntilNext: delayUntilNext);
  }

  static void dismiss() {
    OnboardingClient.context.actionQueue!.dismiss();
  }

  static void onInitialized(Function() func) {
    _onInitialized.add(func);
  }

  static void onStateChange(Function(ClientState state) func) {
    _onStateChanged.add(func);
  }
  //#endregion
}
