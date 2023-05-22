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
  late Function(int) _stepChangeCb;

  @override
  Future<bool> validate(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('VALIDATING ${getName()} for ${action.guideCode}');
    return Future.value(true);
  }

  @override
  Future<bool> initialize(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('INITIALIZE ${getName()} for ${action.guideCode}');

    final context = action.context;
    _stepChangeCb = (idx) {
      print(idx);
      action.logEvent(
          actionType: Events.CAROUSEL_STEP_CHANGE, payload: idx?.toString());
    };
    context.read<CarouselContext>().onStepChange(_stepChangeCb);
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
    context.read<CarouselContext>().start(payload);
    return Task.waitUtil(() =>
    context.read<CarouselContext>().activeWidgetId == null &&
        context.read<CarouselContext>().ids == null).then((_) {
      if (OnboardingClient.options.debug)
        Logger.logWarning('SHOWING SUCCESSFUL ${action.guideCode}');
    });
  }

  @override
  Future<void> dismiss(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('DISMISS ${getName()} for ${action.guideCode}');
    final context = action.context;
    context.read<CarouselContext>().dismiss(notify: true);
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
