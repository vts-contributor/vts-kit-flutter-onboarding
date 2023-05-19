import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:vts_kit_flutter_onboarding/core/client.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/events.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/ui_name.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/abstract.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/tooltip/lib/context.dart';
import 'package:vts_kit_flutter_onboarding/core/utils/logger.dart';
import 'package:vts_kit_flutter_onboarding/core/utils/task.dart';
import 'package:vts_kit_flutter_onboarding/core/types/action.dart' as Type;
import 'package:flutter/material.dart';

class UITooltip implements UIAbstract {
  late Function(int?, GlobalKey) _startCb;

  // Temp state for tracking
  late int prevStep = -1;
  late int currentStep = -1;

  @override
  Future<bool> validate(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('VALIDATING ${getName()} for ${action.guideCode}');
    final payload = action.payload;
    if (payload is List) {
      if (!payload.every((element) => element is GlobalKey))
        return Future.value(false);
    } else
      return Future.value(false);
    return Future.value(true);
  }

  List<Map<String, dynamic>> _buildTrackEvents(Type.Action action, int idx) {
    // Store current data
    this.prevStep = this.currentStep;
    this.currentStep = idx;

    List<Map<String, dynamic>> events = [];

    Map<String, dynamic> currentEvent = {};
    currentEvent['current'] = this.currentStep;
    currentEvent['from'] = this.prevStep;
    events.add(currentEvent);
    return events;
  }

  @override
  Future<bool> initialize(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('INITIALIZE ${getName()} for ${action.guideCode}');

    final context = action.context;
    _startCb = (idx, key) {
      // Push events for tracking
      final _events = _buildTrackEvents(action, idx!);
      _events.forEach((element) {
        action.logEvent(
            actionType: Events.TOOLTIP_STEP_CHANGE,
            payload: JsonEncoder().convert(element));
      });
    };
    context.read<ToolTipContext>().onStart(_startCb);
    return Future.value(true);
  }

  @override
  Future<void> show(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('SHOWING ${getName()} for ${action.guideCode}');

    // Push meta data event
    final Map<String, dynamic> meta = {
      "stepNumber": (action.payload as List).length
    };
    action.logEvent(
        actionType: Events.GUIDE_INITIALIZE, payload: json.encode(meta));

    // Play
    final context = action.context;
    final payload = action.payload;
    final state = context.read<ToolTipContext>();
    context.read<ToolTipContext>().start(payload);
    return Task.waitUtil(() =>
        (state.activeWidgetId == null && state.ids == null) ||
        (state.manualDismiss == true)).then((_) {
      if (state.manualDismiss) {
        OnboardingClient.dismiss();
      }
      if (OnboardingClient.options.debug)
        Logger.logWarning('SHOWING SUCCESSFUL ${action.guideCode}');
    });
  }

  @override
  Future<void> dismiss(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('DISMISS ${getName()} for ${action.guideCode}');
    final context = action.context;
    context.read<ToolTipContext>().dismiss(manual: true);
    return Future.value(true);
  }

  @override
  Future<bool> destroy(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('DESTROY ${getName()} for ${action.guideCode}');

    // Clean temp data
    this.prevStep = -1;
    this.currentStep = -1;

    // Clean callback event binding
    final context = action.context;
    try {
      context.read<ToolTipContext>().offStart(_startCb);
    } catch (e) {}
    ;
    return Future.value(true);
  }

  @override
  String getName() {
    return UIName.Tooltip;
  }
}
