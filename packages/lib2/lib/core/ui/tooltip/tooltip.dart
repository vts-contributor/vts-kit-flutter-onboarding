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
  late int prevStep = -100;
  late int currentStep = -100;
  late Map<int, int> totalVisit = {};
  late Map<int, int> successNext = {};

  @override
  Future<bool> validate(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('VALIDATING ${getName()} for ${action.guideCode}');
    final payload = action.payload;
    if (payload is List) {
      if (!(payload as List).every((element) => element is GlobalKey))
        return Future.value(false);
    } else
      return Future.value(false);
    return Future.value(true);
  }

  List<Map<String, dynamic>> _buildTrackEvents(Type.Action action, int idx) {
    // Store current data
    this.prevStep = this.currentStep;
    this.currentStep = idx;
    if (this.totalVisit.containsKey(this.currentStep))
      this.totalVisit[this.currentStep] =
          this.totalVisit[this.currentStep]! + 1;
    else
      this.totalVisit[this.currentStep] = 1;

    // If going back or new added
    // Reset count to 0
    this.successNext[this.currentStep] = 0;

    // If this is the transition (from lower level to higher)
    // Add 1 for previous step
    if (this.currentStep == this.prevStep + 1)
      this.successNext[this.prevStep] = this.successNext[this.prevStep]! + 1;

    List<Map<String, dynamic>> events = [];
    // If step is above 0 and it's an transition event (from lower level to higher)
    // Create an extra event for adding 'successNext' using the payload of previous step
    if (this.currentStep > 0 && this.currentStep == this.prevStep + 1) {
      Map<String, dynamic> transitionEvent = {};
      transitionEvent['current'] = this.prevStep;
      transitionEvent['successNext'] = this.successNext[this.prevStep];
      events.add(transitionEvent);
    }
    Map<String, dynamic> currentEvent = {};
    currentEvent['current'] = this.currentStep;
    currentEvent['successNext'] = this.successNext[this.currentStep];
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
    context.read<ToolTipContext>().start(payload);
    return Task.waitUtil(() =>
        context.read<ToolTipContext>().activeWidgetId == null &&
        context.read<ToolTipContext>().ids == null).then((_) {
      if (OnboardingClient.options.debug)
        Logger.logWarning('SHOWING SUCCESSFUL ${action.guideCode}');
    });
  }

  @override
  Future<void> dismiss(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('DISMISS ${getName()} for ${action.guideCode}');
    final context = action.context;
    context.read<ToolTipContext>().dismiss(notify: true);
    return Future.value(true);
  }

  @override
  Future<bool> destroy(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('DESTROY ${getName()} for ${action.guideCode}');

    // Clean temp data
    this.prevStep = -100;
    this.currentStep = -100;
    this.totalVisit = {};
    this.successNext = {};

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
