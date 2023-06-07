import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding/core/client.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/ui_name.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/carousel_widget.dart';
import 'package:vts_kit_flutter_onboarding/index.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_list_tile.dart';
import 'icon_buttons.dart';
import 'pill_buttons.dart';
import 'social_buttons.dart';
import 'standard_buttons.dart';
import 'text_buttons.dart';

class ButtonTypes extends StatefulWidget {
  @override
  _ButtonTypesState createState() => _ButtonTypesState();
}

class _ButtonTypesState extends State<ButtonTypes> {
  final _six = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      OnboardingClient.start(
          context: context,
          guideCode: 'SHOW_2',
          guideType: UIName.Carousel,
          payload: _six);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Button'),
        body: ListView(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            DemoListTile(
              text: 'Standard buttons',
              svgAssets: 'lib/assets/icons/standard_button.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => StandardButtons()),
                );
              },
            ),
            DemoListTile(
              text: 'Pill buttons',
              svgAssets: 'lib/assets/icons/pill_button.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PillsButtons()),
                );
              },
            ),
            DemoListTile(
              text: 'Icon buttons',
              svgAssets: 'lib/assets/icons/icon_button.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => IconButtons()),
                );
              },
            ),
            DemoListTile(
              text: 'Text buttons',
              svgAssets: 'lib/assets/icons/social_button.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => TextButtons()),
                );
              },
            ),
            DemoListTile(
              text: 'Social buttons',
              svgAssets: 'lib/assets/icons/link_button.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SocialButtons()),
                );
              },
            ),
          ],
        ),
      );
}
