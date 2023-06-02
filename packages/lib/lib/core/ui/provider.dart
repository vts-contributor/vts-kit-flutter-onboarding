import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/sheet/lib/context.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/context.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/context.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/tooltip/lib/context.dart';

class OnboardingProvider extends StatefulWidget {
  final Widget child;

  const OnboardingProvider({required this.child});

  @override
  OnboardingProviderState createState() => OnboardingProviderState();
}

class OnboardingProviderState extends State<OnboardingProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (context) => ToolTipContext(context: context)),
      ChangeNotifierProvider(
          create: (context) => PopupContext(context: context)),
      ChangeNotifierProvider(
          create: (context) => CarouselContext(context: context)),
      ChangeNotifierProvider(
          create: (context) => SheetContext(context: context)),
    ], child: widget.child);
  }
}
