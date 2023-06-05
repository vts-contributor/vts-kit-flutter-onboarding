import 'dart:async';
import 'package:async/async.dart';
import 'package:vts_kit_flutter_onboarding/core/client.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/state.dart';
import 'package:vts_kit_flutter_onboarding/core/types/action.dart' as Type;
import 'package:vts_kit_flutter_onboarding/core/ui/abstract.dart';
import 'package:vts_kit_flutter_onboarding/core/utils/logger.dart';
import 'package:flutter/material.dart';

class ActionQueue {
  //#region Singleton Constructor
  static ActionQueue? _singleton;
  List<Type.Action> _queue = [];
  Type.Action? isPlaying;
  Timer? _interval; // For non route-tracking user

  factory ActionQueue.create() {
    if (_singleton == null) {
      _singleton = ActionQueue._();
      return _singleton!;
    } else {
      throw Logger.throwError('Invalid operator');
    }
  }

  ActionQueue._();

  //#region Private Methods
  void createActionTask() {
    final delayBeforeCreate = OnboardingClient.options.actionDelayAfterInit;
    if (OnboardingClient.options.routeTracking) {
      // Use route traking to notify when to play action
      Timer(delayBeforeCreate, () {
        _playAction();
      });
      try {
        OnboardingClient.context.routeObserver!
            .onRouteChanged(_handleRouteChanged);
      } catch (e) {}
    } else {
      final intervalCallBack = (_) {
        if (OnboardingClient.options.debug) {
          Logger.log('ACTION INTERVAL TRIGGER');
        }
        _playAction();
      };

      // Create interval
      Timer(delayBeforeCreate, () {
        _interval = Timer.periodic(
            OnboardingClient.options.actionInterval, intervalCallBack);
        // Start once after created
        intervalCallBack(null);
      });
    }
  }

  void _handleRouteChanged(String? current, String? prev) {
    _playAction();
    final currentRoute = OnboardingClient.context.routeObserver!.currentRoute;
    this._queue.forEach((element) {
      if (element.routeName == currentRoute)
        // Replace context of Widget where this is added with navigator context
        // so it will exist
        element.context =
            OnboardingClient.context.routeObserver!.navigatorContext ??
                element.context;
    });
    if (isPlaying != null && isPlaying?.routeName != currentRoute)
      this.dismiss();
  }

  void _playAction() async {
    if (OnboardingClient.state != ClientState.INITIALIZED ||
        _queue.isEmpty ||
        isPlaying != null) return;

    if (OnboardingClient.options.routeTracking) {
      // Only display action related to current screen route
      final currentRoute = OnboardingClient.context.routeObserver!.currentRoute;
      final sortedQueue =
          _queue.where((element) => element.routeName == currentRoute).toList();

      if (sortedQueue.isEmpty) return;
      isPlaying = sortedQueue.first;
    } else {
      // Use default behavior, FIFO
      isPlaying = _queue.first;
    }

    // If guide is disabled, ignore and continue to next one
    final enabled = OnboardingClient.options.offline ||
        OnboardingClient.guides.contains(isPlaying!.guideCode);
    if (!enabled) {
      _queue.removeWhere((element) => element == isPlaying);
      isPlaying = null;
      _playAction();
      return;
    }

    // UI Abstract Lifecycle: Initialize - Validate - Show - Destroy
    try {
      // Try initializing and validating
      await isPlaying!.ui.initialize(isPlaying!);
      final playable = await isPlaying!.ui.validate(isPlaying!);
      if (playable) {
      } else {
        Logger.logError("Payload for ${isPlaying!.guideCode} is not valid");
        isPlaying = null;
      }
    } catch (e, s) {
      print(s);
      Logger.logError("Payload for ${isPlaying!.guideCode} is not valid");
      isPlaying = null;
    } finally {
      _queue.removeWhere((element) => element == isPlaying);
    }

    // If guide is not valid
    // Play the next one
    if (isPlaying == null) {
      // Pop current item and process the next one with no waiting
      _playAction();
    } else {
      // Ready to play
      if (isPlaying!.delayBeforePlay != null) {
        final duration = isPlaying!.delayBeforePlay!;
        Timer(duration, () {
          _startAndWaitUntilSuccess();
        });
      } else
        _startAndWaitUntilSuccess();
    }
  }

  void _startAndWaitUntilSuccess() {
    final completer = CancelableCompleter();
    isPlaying!.completer = completer;
    Future.value(true).then((_) {
      // Create shorthand logger
      isPlaying!.logEvent = (({required actionType, payload}) =>
          OnboardingClient.context.eventService!.logEvent(
              guideCode: isPlaying!.guideCode,
              actionType: actionType,
              guideType: isPlaying!.ui.getName(),
              payload: payload));

      // Push start event
      OnboardingClient.context.eventService!.logStartEvent(
          guideCode: isPlaying!.guideCode, guideType: isPlaying!.ui.getName());

      // Start guide
      completer.complete(isPlaying!.ui.show(isPlaying!));
      return completer.operation.value;
    }).then((_) async {
      // Successfully played
      // Push end event
      OnboardingClient.context.eventService!.logEndEvent(
          guideCode: isPlaying!.guideCode, guideType: isPlaying!.ui.getName());
      // Clean
      await isPlaying!.ui.destroy(isPlaying!);

      // Make a delay and start next action
      _delayUntilNextAction();
    });
  }

  void _delayUntilNextAction() {
    Duration delayUntilNext = isPlaying?.delayUntilNext ??
        OnboardingClient.options.actionDelayBetween;
    Timer(delayUntilNext, () {
      isPlaying = null;
      _playAction();
    });
  }
  //#endregion

  //#region Public Methods
  void addAction(
      {required String guideCode,
      required UIAbstract ui,
      required dynamic payload,
      required BuildContext context,
      Duration? delayBeforePlay,
      Duration? delayUntilNext}) {
    final action = Type.Action(
        guideCode: guideCode,
        ui: ui,
        payload: payload,
        context: context,
        delayBeforePlay: delayBeforePlay,
        delayUntilNext: delayUntilNext);
    if (OnboardingClient.options.routeTracking) {
      final routeName = ModalRoute.of(context)?.settings.name;
      action.routeName = routeName;
      _queue.add(action);
      _playAction(); // Manual trigger play because routeTracking doesn't use interval
    } else {
      _queue.add(action);
    }
  }

  void dismiss() async {
    if (isPlaying != null) {
      // Cancel any playing guide
      if (isPlaying?.completer != null) {
        await isPlaying!.completer!.operation.cancel();
      }

      Future.value(true).then((_) {
        // Push dismiss event
        OnboardingClient.context.eventService!.logDismissEvent(
            guideCode: isPlaying!.guideCode,
            guideType: isPlaying!.ui.getName());
        // Dismiss lifecycle
        return isPlaying!.ui.dismiss(isPlaying!);
      }).then((_) async {
        // Clean
        await isPlaying!.ui.destroy(isPlaying!);
        // Make a delay and start next action
        _delayUntilNextAction();
      });
    }
  }
  //#endregion
}
