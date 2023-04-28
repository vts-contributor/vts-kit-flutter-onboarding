import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    ], child: widget.child);
  }
}
