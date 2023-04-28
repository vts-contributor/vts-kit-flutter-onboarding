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
  late Function(int?, GlobalKey) _completeCb;
  late VoidCallback _finishCb;

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
    _startCb = (idx, key) => {
          OnboardingClient.context.eventService!.logEvent(
              guideCode: action.guideCode,
              actionType: Events.TOOLTIP_STEP_START,
              payload: idx?.toString())
        };
    _completeCb = (idx, key) => {
          OnboardingClient.context.eventService!.logEvent(
              guideCode: action.guideCode,
              actionType: Events.TOOLTIP_STEP_COMPLETE,
              payload: idx?.toString())
        };
    _finishCb = () => {
          OnboardingClient.context.eventService!.logEvent(
              guideCode: action.guideCode,
              actionType: Events.TOOLTIP_STEP_FINISH)
        };
    context.read<ToolTipContext>().onStart(_startCb);
    context.read<ToolTipContext>().onComplete(_completeCb);
    context.read<ToolTipContext>().onFinish(_finishCb);
    return Future.value(true);
  }

  @override
  Future<void> show(Type.Action action) {
    if (OnboardingClient.options.debug)
      Logger.logWarning('SHOWING ${getName()} for ${action.guideCode}');
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

    final context = action.context;
    try {
      context.read<ToolTipContext>().offStart(_startCb);
      context.read<ToolTipContext>().offComplete(_completeCb);
      context.read<ToolTipContext>().offFinish(_finishCb);
    } catch (e) {}
    ;
    return Future.value(true);
  }

  @override
  String getName() {
    return UIName.Tooltip;
  }
}
