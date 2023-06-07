import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/tooltip/lib/context.dart';
import 'package:vts_kit_flutter_onboarding/index.dart';
import 'package:vts_kit_flutter_onboarding_demo/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    ClientOption options = ClientOption(
        serverUrl: 'http://vtskit.atviettelsolutions.com/gateway/onboarding/',
        applicationId: 'c189b058-42f0-4e65-9d96-e89e13f82e94',
        routeTracking: true,
        debug: true,
        offline: false);
    OnboardingClient.initialize(options);
    OnboardingClient.onStateChange((state) => {print(state)});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingProvider(
        child: MaterialApp(
      title: 'Flutter Demo',
      navigatorObservers: [OnboardingRouteObserver()],
      theme: ThemeData(
          scaffoldBackgroundColor: VTSColors.ILUS_GRAY_7,
          fontFamily: 'Sarabun',
          textTheme:
              TextTheme(bodyMedium: TextStyle(fontWeight: FontWeight.w500)),
          scrollbarTheme: ScrollbarThemeData(
            isAlwaysShown: true,
            thickness: MaterialStateProperty.all(5),
            thumbColor: MaterialStateProperty.all(Color(0xFF8F9294)),
            radius: Radius.circular(8),
          )),
      initialRoute: '/',
      routes: AppRoute.Pages,
    ));
  }
}
