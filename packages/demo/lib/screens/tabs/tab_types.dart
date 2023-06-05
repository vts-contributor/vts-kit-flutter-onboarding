import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding/index.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_list_tile.dart';
import 'bottom_label_tab.dart';
import 'bottom_icon_tab.dart';
import 'icon_tabs.dart';
import 'labeled_tabs.dart';
import 'segment_tabs.dart';

class TabTypes extends StatefulWidget {
  @override
  _TabTypesState createState() => _TabTypesState();
}

class _TabTypesState extends State<TabTypes> {
  final _seven = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      OnboardingClient.start(
          context: context,
          guideCode: 'SHOW_3',
          guideType: UIName.Popup,
          payload: _seven);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Tabs'),
        body: ListView(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            DemoListTile(
              text: 'Segmented tabs',
              svgAssets: 'lib/assets/icons/segment_tab.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SegmentTabsPage()),
                );
              },
            ),
            DemoListTile(
              text: 'Icon tabs',
              svgAssets: 'lib/assets/icons/icon_tab.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => IconTabs()),
                );
              },
            ),
            DemoListTile(
              text: 'Labeled tabs',
              svgAssets: 'lib/assets/icons/labeled_tab.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LabeledTabs()),
                );
              },
            ),
            DemoListTile(
              text: 'Bottom icon tabs',
              svgAssets: 'lib/assets/icons/bottom_icon_tab.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => BottomIconTab()),
                );
              },
            ),
            DemoListTile(
              text: 'Bottom labeled tabs',
              svgAssets: 'lib/assets/icons/bottom_labeled_tab.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => BottomLabelTab()),
                );
              },
            ),
            Popup(
              key: _seven,
              body:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled",
              title: 'Chào mừng bạn đến với Viettel-S',
              image: const VTSImage(
                height: 200,
                boxFit: BoxFit.contain,
                imageProvider: AssetImage('images/anh1.png'),
              ),
              okText: "I know",
              cancelText: "Skip",
            ),
          ],
        ),
      );
}
