import 'package:flutter/material.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/tooltip/tooltip.dart';

class OnboardingWidget extends StatefulWidget {
  final Builder builder;

  const OnboardingWidget({required this.builder});

  @override
  OnboardingWidgetState createState() => OnboardingWidgetState();
}

class OnboardingWidgetState extends State<OnboardingWidget> {
  @override
  Widget build(BuildContext context) {
    return VtsTooltip(builder: widget.builder);
  }
}
