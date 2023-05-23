import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:vts_kit_flutter_onboarding/core/client.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/events.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/ui_name.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/abstract.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/context.dart';
import 'package:vts_kit_flutter_onboarding/core/utils/logger.dart';
import 'package:vts_kit_flutter_onboarding/core/utils/task.dart';
import 'package:vts_kit_flutter_onboarding/core/types/action.dart' as Type;
import 'package:flutter/material.dart';

class UICarousel implements UIAbstract {
  late int prevStep = -1;
  late int currentStep = -1;
  late Function(int, int, bool) _stepChangeCb;

  @override
  Future<bool> validate(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('VALIDATING ${getName()} for ${action.guideCode}');

    final payload = action.payload;
    return Future.value(payload is GlobalKey);
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
    _stepChangeCb = (page, pageLength, forward) {
      final _events = _buildTrackEvents(action, page);
      _events.forEach((element) {
        action.logEvent(
            actionType: Events.TOOLTIP_STEP_CHANGE,
            payload: JsonEncoder().convert(element));
      });
    };
    context.read<CarouselContext>().onStepChange(_stepChangeCb);
    return Future.value(true);
  }

  @override
  Future<void> show(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('SHOWING ${getName()} for ${action.guideCode}');

    // Push meta data event
    // final Map<String, dynamic> meta = {
    //   "stepNumber": (action.payload as List).length
    // };
    // action.logEvent(
    //     actionType: Events.GUIDE_INITIALIZE, payload: json.encode(meta));

    // Play
    final context = action.context;
    final payload = action.payload;
    context.read<CarouselContext>().start(payload);
    return Task.waitUtil(
            () => context.read<CarouselContext>().activeWidgetKey == null)
        .then((_) {
      if (OnboardingClient.options.debug)
        Logger.logWarning('SHOWING SUCCESSFUL ${action.guideCode}');
    });
  }

  @override
  Future<void> dismiss(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('DISMISS ${getName()} for ${action.guideCode}');
    final context = action.context;
    context.read<CarouselContext>().dismiss(manual: true);
    return Future.value(true);
  }

  @override
  Future<bool> destroy(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('DESTROY ${getName()} for ${action.guideCode}');

    // Clean callback event binding
    final context = action.context;
    try {
      context.read<CarouselContext>().offStepChange(_stepChangeCb);
    } catch (e) {}
    ;
    return Future.value(true);
  }

  @override
  String getName() {
    return UIName.CAROUSEL;
  }
}
