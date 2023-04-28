import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vts_kit_flutter_onboarding/core/client.dart';
import 'package:vts_kit_flutter_onboarding/core/types/event.dart';
import 'package:vts_kit_flutter_onboarding/core/utils/logger.dart';
import 'package:collection/src/iterable_extensions.dart';

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
      // _singleton!._createInterval();
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
      _queue = cache.map((item) => Event.fromJson(json.decode(item))).toList();
      _doPush();
    }
  }

  void _saveCache() {
    final caching = _queue.map((e) => json.encode(e.toJson())).toList();
    _prefs.then((pref) => pref.setStringList(PREF_EVENT_KEY, caching));
  }

  void _doPush() async {
    if (OnboardingClient.options.debug) {
      Logger.log('DO PUSH');
    }
    final toPush = [];
    _queue.forEach((event) {
      // Mark for pushing
      event.status = PUSHING_STATE;
      toPush.add(json.encode(event.toJson()));
    });
    final logs = '[${toPush.join(",")}]';
    if (OnboardingClient.options.debug) {
      Logger.log('PUSHING: $logs');
    }
    try {
      await OnboardingClient.context.apiClient!.pushLog(logs);
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
  void addMessage(String guideCode, String actionType, String? payload) {
    final existed = _queue.firstWhereOrNull((element) =>
        element.appId == OnboardingClient.appId &&
        element.sessionId == OnboardingClient.sessionId);
    if (existed == null) {
      Event newItem = Event(
          appId: OnboardingClient.appId,
          sessionId: OnboardingClient.sessionId,
          userId: OnboardingClient.userId!,
          guideCode: guideCode,
          actionType: actionType,
          timeRun: timeRun);
      newItem.data.add(message);
      _queue.add(newItem);
    } else {
      existed.data.add(message);
    }

    _saveCache();
  }
  //#endregion
}
