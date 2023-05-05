import 'package:vts_kit_flutter_onboarding/core/ui/abstract.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';

class Action {
  final String guideCode;
  final UIAbstract ui;
  final dynamic payload;
  final BuildContext context;
  late CancelableCompleter? completer;
  late Function({required String actionType, String? payload}) logEvent =
      ({required actionType, payload}) => {};

  Action(
      {required this.guideCode,
      required this.ui,
      required this.payload,
      required this.context});
}
