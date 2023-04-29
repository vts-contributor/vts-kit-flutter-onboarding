import 'dart:async';
import 'package:async/async.dart';
import 'package:vts_kit_flutter_onboarding/core/client.dart';
import 'package:vts_kit_flutter_onboarding/core/types/action.dart' as Type;
import 'package:vts_kit_flutter_onboarding/core/ui/abstract.dart';
import 'package:vts_kit_flutter_onboarding/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/state.dart'
    as ClientState;

class ActionQueue {
  //#region Singleton Constructor
  static ActionQueue? _singleton;
  List<Type.Action> _queue = [];
  Type.Action? isPlaying;
  Timer? _interval;

  factory ActionQueue.create() {
    if (_singleton == null) {
      _singleton = ActionQueue._();
      _singleton!._createInterval();
      OnboardingClient.onInitialized(() => _singleton!._playAction());
      return _singleton!;
    } else {
      throw Logger.throwError('Invalid operator');
    }
  }

  ActionQueue._();

  //#region Private Methods
  void _createInterval() {
    _interval = Timer.periodic(OnboardingClient.options.actionInterval, (_) {
      if (OnboardingClient.options.debug) {
        Logger.log('ACTION INTERVAL TRIGGER');
      }
      _playAction();

      // Cancel on Authentication Failed
      if (OnboardingClient.state == ClientState.State.UNAUTHORIZED)
        _interval!.cancel();
    });
  }

  void _playAction() async {
    if (OnboardingClient.state != ClientState.State.INITIALIZED ||
        _queue.isEmpty ||
        isPlaying != null) return;

    isPlaying = _queue.first;

    // If guide is disabled, ignore and continue to next one
    final allowance = OnboardingClient.guides;
    if (!allowance.contains(isPlaying!.guideCode)) {
      isPlaying = null;
      _queue.removeAt(0);
      _playAction();
      return;
    }

    // UI Abstract Lifecycle: Initialize - Validate - Show - Destroy
    try {
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
      _queue.removeAt(0);
    }

    if (isPlaying == null) {
      // Pop current item and process the next one with no waiting
      _playAction();
    } else {
      // Play
      final completer = CancelableCompleter(onCancel: () {
        print('cancle');
      });
      isPlaying!.completer = completer;
      Future.value(true).then((_) {
        OnboardingClient.context.eventService!
            .logStartEvent(guideCode: isPlaying!.guideCode);
        completer.complete(isPlaying!.ui.show(isPlaying!));
        return completer.operation.value;
      }).then((_) async {
        OnboardingClient.context.eventService!
            .logEndEvent(guideCode: isPlaying!.guideCode);
        await isPlaying!.ui.destroy(isPlaying!);
        isPlaying = null;
        // Instantly play next action if current one ended successfully
        _playAction();
      });
    }
  }
  //#endregion

  //#region Public Methods
  void addAction(
      {required String guideCode,
      required UIAbstract ui,
      required dynamic payload,
      required BuildContext context}) {
    _queue.add(Type.Action(
        guideCode: guideCode, ui: ui, payload: payload, context: context));
  }

  void dismiss() async {
    if (isPlaying != null) {
      if (isPlaying?.completer != null) {
        await isPlaying!.completer!.operation.cancel();
      }
    }
    Future.value(true).then((_) {
      OnboardingClient.context.eventService!
          .logDismissEvent(guideCode: isPlaying!.guideCode);
      return isPlaying!.ui.dismiss(isPlaying!);
    }).then((_) async {
      await isPlaying!.ui.destroy(isPlaying!);
      isPlaying = null;
      // Instantly play next action if current one ended successfully
      _playAction();
    });
  }
  //#endregion
}
