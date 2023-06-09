import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vts_kit_flutter_onboarding/core/client.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/events.dart';
import 'package:vts_kit_flutter_onboarding/core/types/dto/json_serializable.dart';
import 'package:vts_kit_flutter_onboarding/core/types/event.dart';
import 'package:vts_kit_flutter_onboarding/core/utils/logger.dart';

const PUSHING_STATE = "1";
const PREF_EVENT_KEY = "PREF_EVENT_KEY";

class EventService {
  //#region Singleton Constructor
  static EventService? _singleton;
  static List<Event> _queue = [];
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  factory EventService.create() {
    if (_singleton == null) {
      _singleton = EventService._();
      _singleton!._flushCache();
      _singleton!._createInterval();
      return _singleton!;
    } else {
      throw Logger.throwError('Invalid operator');
    }
  }

  EventService._();

  //#region Private Methods
  void _flushCache() async {
    final cache =
        await _prefs.then((pref) => pref.getStringList(PREF_EVENT_KEY));
    if (cache != null && cache.isNotEmpty) {
      _queue = cache.fromJson((item) => Event.fromJson(item));
      _doPush();
    }
  }

  void _saveCache() {
    _prefs.then((pref) => pref.setStringList(PREF_EVENT_KEY, _queue.toJson()));
  }

  void _doPush() async {
    final List<Event> toPush = [];
    _queue.forEach((event) {
      // Mark for pushing
      event.status = PUSHING_STATE;
      toPush.add(event);
    });
    if (toPush.isEmpty) return;
    if (OnboardingClient.options.debug) {
      Logger.log('PUSHING ${toPush.length} events');
    }
    try {
      await OnboardingClient.context.apiClient!.pushLog(toPush);
      _queue.removeWhere((event) => event.status == PUSHING_STATE);
      _saveCache();
    } catch (e, s) {
      if (OnboardingClient.options.debug) {
        Logger.logError('PUSHING ERROR ${e.toString()}');
        print(s);
      }
      // Rollback
      _queue.forEach((event) {
        event.status = '';
      });
    }
  }

  void _createInterval() {
    Timer.periodic(OnboardingClient.options.logInterval, (_) {
      if (OnboardingClient.options.debug) {
        Logger.log('PUSH INTERVAL TRIGGER');
      }
      _doPush();
    });
  }
  //#endregion

  //#region Public Methods
  void logEvent(
      {required String guideCode,
      required String actionType,
      String? payload}) {
    Event newItem = Event(
        appId: OnboardingClient.appId,
        sessionId: OnboardingClient.sessionId,
        userId: OnboardingClient.userId!,
        guideCode: guideCode,
        actionType: actionType,
        timeRun: DateTime.now().toIso8601String(),
        payload: payload);
    _queue.add(newItem);
    _saveCache();

    if (OnboardingClient.options.debug) {
      Logger.log('NEW EVENT ${newItem.toJson().toString()}');
    }
  }

  void logStartEvent({
    required String guideCode,
  }) {
    this.logEvent(guideCode: guideCode, actionType: Events.GUIDE_START);
  }

  void logEndEvent({
    required String guideCode,
  }) {
    this.logEvent(guideCode: guideCode, actionType: Events.GUIDE_END);
  }

  void logDismissEvent({
    required String guideCode,
  }) {
    this.logEvent(guideCode: guideCode, actionType: Events.GUIDE_DISMISS);
  }
  //#endregion
}
