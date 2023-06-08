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
  late int _prevStep = -1;
  late int _currentStep = -1;
  late bool _initialized = false;
  late Function(int page, int pageLength, bool forward) _stepChangeCb;
  late VoidCallback _dismissCb;
  late VoidCallback _finishCb;

  @override
  Future<bool> validate(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('VALIDATING ${getName()} for ${action.guideCode}');

    final payload = action.payload;
    return Future.value(payload is GlobalKey);
  }

  List<Map<String, dynamic>> _buildTrackEvents(Type.Action action, int idx) {
    // Store current data
    this._prevStep = this._currentStep;
    this._currentStep = idx;

    List<Map<String, dynamic>> events = [];
    Map<String, dynamic> currentEvent = {};
    currentEvent['current'] = this._currentStep;
    currentEvent['from'] = this._prevStep;
    events.add(currentEvent);
    return events;
  }

  @override
  Future<bool> initialize(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('INITIALIZE ${getName()} for ${action.guideCode}');

    final context = action.context;
    _initialized = false;
    _stepChangeCb = (page, pageLength, forward) {
      if (!_initialized) {
        final Map<String, dynamic> meta = {"stepNumber": pageLength};
        action.logEvent(
            actionType: Events.GUIDE_INITIALIZE, payload: json.encode(meta));
        _initialized = true;
      }

      final _events = _buildTrackEvents(action, page);
      _events.forEach((element) {
        action.logEvent(
            actionType: Events.CAROUSEL_STEP_CHANGE,
            payload: JsonEncoder().convert(element));
      });
    };

    // This will dispatch GUIDE_DISMISS before GUIDE_END happened
    _dismissCb = () {
      OnboardingClient.dismiss();
      action.logEvent(actionType: Events.GUIDE_DISMISS);
    };

    _finishCb = () {
      OnboardingClient.dismiss();
      action.logEvent(actionType: Events.GUIDE_END);
    };

    context.read<CarouselContext>().onStepChange(_stepChangeCb);
    context.read<CarouselContext>().onDismiss(_dismissCb);
    context.read<CarouselContext>().onFinish(_finishCb);
    return Future.value(true);
  }

  @override
  Future<void> show(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('SHOWING ${getName()} for ${action.guideCode}');

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
    context.read<CarouselContext>().dismiss(notify: true);
    return Future.value(true);
  }

  @override
  Future<bool> destroy(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('DESTROY ${getName()} for ${action.guideCode}');

    // Clean temp data
    this._prevStep = -1;
    this._currentStep = -1;

    // Clean callback event binding
    final context = action.context;
    try {
      context.read<CarouselContext>().offStepChange(_stepChangeCb);
      context.read<CarouselContext>().offDismiss(_dismissCb);
      context.read<CarouselContext>().offFinish(_finishCb);
    } catch (e) {}
    ;
    return Future.value(true);
  }

  @override
  String getName() {
    return UIName.Carousel;
  }

  @override
  bool useManualDismiss() {
    return true;
  }
}
