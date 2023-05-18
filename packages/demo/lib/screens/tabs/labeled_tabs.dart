import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';

class LabeledTabs extends StatefulWidget {
  @override
  _LabeledTabsState createState() => _LabeledTabsState();
}

class _LabeledTabsState extends State<LabeledTabs>
    with TickerProviderStateMixin {
  TabController? tabController1;
  TabController? tabController2;
  TabController? tabController3;
  TabController? tabController4;
  TabController? tabController5;
  TabController? tabController6;

  @override
  void initState() {
    super.initState();
    tabController1 = TabController(length: 2, vsync: this);
    tabController2 = TabController(length: 2, vsync: this);
    tabController3 = TabController(length: 3, vsync: this);
    tabController4 = TabController(length: 3, vsync: this);
    tabController5 = TabController(length: 4, vsync: this);
    tabController6 = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController1!.dispose();
    tabController2!.dispose();
    tabController3!.dispose();
    tabController4!.dispose();
    tabController5!.dispose();
    tabController6!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Labeled tabs'),
        body: ListView(
          children: <Widget>[
            Container(
                child: VTSTabBar(
                    tabController: tabController1,
                    content: [
                      VTSTabItem(text: 'LABEL 1'),
                      VTSTabItem(text: 'LABEL 2'),
                    ],
                    vtsType: VTSTabType.TOPBAR)),
            Container(
              height: 50,
              child: VTSTabBarView(
                controller: tabController1,
                children: <Widget>[
                  Center(child: Text('Tab 1')),
                  Center(child: Text('Tab 2')),
                ],
              ),
            ),
            Container(
                child: VTSTabBar(
                    tabController: tabController2,
                    content: [
                      VTSTabItem(text: 'LABEL 1', icon: Icon(Icons.favorite)),
                      VTSTabItem(text: 'LABEL 2', icon: Icon(Icons.star)),
                    ],
                    vtsType: VTSTabType.TOPBAR)),
            Container(
              height: 50,
              child: VTSTabBarView(
                controller: tabController2,
                children: <Widget>[
                  Center(child: Text('Tab 1')),
                  Center(child: Text('Tab 2')),
                ],
              ),
            ),
            Container(
                child: VTSTabBar(
                    tabController: tabController3,
                    content: [
                      VTSTabItem(text: 'LABEL 1'),
                      VTSTabItem(text: 'LABEL 2'),
                      VTSTabItem(text: 'LABEL 3'),
                    ],
                    vtsType: VTSTabType.TOPBAR)),
            Container(
              height: 50,
              child: VTSTabBarView(
                controller: tabController3,
                children: <Widget>[
                  Center(child: Text('Tab 1')),
                  Center(child: Text('Tab 2')),
                  Center(child: Text('Tab 3')),
                ],
              ),
            ),
            Container(
                child: VTSTabBar(
                    tabController: tabController4,
                    content: [
                      VTSTabItem(text: 'LABEL 1', icon: Icon(Icons.home)),
                      VTSTabItem(text: 'LABEL 2', icon: Icon(Icons.favorite)),
                      VTSTabItem(text: 'LABEL 3', icon: Icon(Icons.star)),
                    ],
                    vtsType: VTSTabType.TOPBAR)),
            Container(
              height: 50,
              child: VTSTabBarView(
                controller: tabController4,
                children: <Widget>[
                  Center(child: Text('Tab 1')),
                  Center(child: Text('Tab 2')),
                  Center(child: Text('Tab 3')),
                ],
              ),
            ),
            Container(
                child: VTSTabBar(
                    tabController: tabController5,
                    content: [
                      VTSTabItem(text: 'LABEL 1'),
                      VTSTabItem(text: 'LABEL 2'),
                      VTSTabItem(text: 'LABEL 3'),
                      VTSTabItem(text: 'LABEL 4'),
                    ],
                    vtsType: VTSTabType.TOPBAR)),
            Container(
              height: 50,
              child: VTSTabBarView(
                controller: tabController5,
                children: <Widget>[
                  Center(child: Text('Tab 1')),
                  Center(child: Text('Tab 2')),
                  Center(child: Text('Tab 3')),
                  Center(child: Text('Tab 4')),
                ],
              ),
            ),
            Container(
                child: VTSTabBar(
                    tabController: tabController6,
                    content: [
                      VTSTabItem(text: 'LABEL 1', icon: Icon(Icons.home)),
                      VTSTabItem(text: 'LABEL 2', icon: Icon(Icons.favorite)),
                      VTSTabItem(text: 'LABEL 3', icon: Icon(Icons.star)),
                      VTSTabItem(text: 'LABEL 4', icon: Icon(Icons.person)),
                    ],
                    vtsType: VTSTabType.TOPBAR)),
            Container(
              height: 50,
              child: VTSTabBarView(
                controller: tabController6,
                children: <Widget>[
                  Center(child: Text('Tab 1')),
                  Center(child: Text('Tab 2')),
                  Center(child: Text('Tab 3')),
                  Center(child: Text('Tab 4')),
                ],
              ),
            ),
          ],
        ),
      );
}
