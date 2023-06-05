import 'package:flutter/material.dart';
import 'package:vts_kit_flutter_onboarding/core/client.dart';

class OnboardingRouteObserver extends NavigatorObserver {
  static OnboardingRouteObserver? _singleton;

  String? prevRoute = null;
  String? currentRoute = null;
  BuildContext? navigatorContext = null;
  List<Function(String? current, String? prev)> routeChangedCb = [];

  factory OnboardingRouteObserver() {
    if (_singleton == null) {
      _singleton = OnboardingRouteObserver._();
    }

    OnboardingClient.routeObserver = _singleton;
    OnboardingClient.context.routeObserver = _singleton;
    return _singleton!;
  }

  OnboardingRouteObserver._();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    this.prevRoute = previousRoute?.settings.name;
    this.currentRoute = route.settings.name;
    this.routeChangedCb.forEach((element) {
      element.call(currentRoute, prevRoute);
    });
    this.navigatorContext = route.navigator?.context;
  }

  onRouteChanged(Function(String?, String?) func) {
    this.routeChangedCb.add(func);
    if (this.currentRoute != null) func.call(this.currentRoute, this.prevRoute);
  }

  offRouteChanged(Function(String, String) func) {
    this.routeChangedCb.removeWhere((element) => element == func);
  }
}
