import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';

class SegmentTabsPage extends StatefulWidget {
  @override
  _SegmentTabsPageState createState() => _SegmentTabsPageState();
}

class _SegmentTabsPageState extends State<SegmentTabsPage>
    with TickerProviderStateMixin {
  TabController? tabController1;
  TabController? tabController2;
  TabController? tabController3;

  @override
  void initState() {
    super.initState();
    tabController1 = TabController(length: 2, vsync: this);
    tabController2 = TabController(length: 3, vsync: this);
    tabController3 = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController1!.dispose();
    tabController3!.dispose();
    tabController2!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Segment tabs'),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 16),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: VTSTabBar(
                  tabController: tabController1,
                  vtsType: VTSTabType.SEGMENT,
                  content: [
                    VTSTabItem(text: "Label 1"),
                    VTSTabItem(text: "Label 2"),
                  ],
                )),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              child: VTSTabBarView(
                controller: tabController1,
                children: const <Widget>[
                  Center(child: Text('Tab 1')),
                  Center(child: Text('Tab 2'))
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: VTSTabBar(
                  tabController: tabController2,
                  vtsType: VTSTabType.SEGMENT,
                  content: [
                    VTSTabItem(text: "Label 1"),
                    VTSTabItem(text: "Label 2"),
                    VTSTabItem(text: "Label 3")
                  ],
                )),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              child: VTSTabBarView(
                controller: tabController2,
                children: const <Widget>[
                  Center(child: Text('Tab 1')),
                  Center(child: Text('Tab 2')),
                  Center(child: Text('Tab 3'))
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: VTSTabBar(
                      isScrollable: true,
                      tabController: tabController3,
                      vtsType: VTSTabType.SEGMENT,
                      content: [
                        VTSTabItem(text: "Label 1"),
                        VTSTabItem(text: "Label 2"),
                        VTSTabItem(text: "Label 3"),
                        VTSTabItem(text: "Label 4"),
                      ],
                    )),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              child: VTSTabBarView(
                controller: tabController3,
                children: const <Widget>[
                  Center(child: Text('Tab 1')),
                  Center(child: Text('Tab 2')),
                  Center(child: Text('Tab 3')),
                  Center(child: Text('Tab 4'))
                ],
              ),
            )
          ],
        ),
      );
}
