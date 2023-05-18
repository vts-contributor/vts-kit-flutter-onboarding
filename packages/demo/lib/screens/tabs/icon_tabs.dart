import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';

class IconTabs extends StatefulWidget {
  @override
  _IconTabsState createState() => _IconTabsState();
}

class _IconTabsState extends State<IconTabs> with TickerProviderStateMixin {
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
    tabController2!.dispose();
    tabController3!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Icon tabs'),
        body: ListView(
          children: <Widget>[
            Container(
                child: VTSTabBar(
                    tabController: tabController1,
                    vtsType: VTSTabType.TOPBAR,
                    content: [
                  VTSTabItem(icon: Icon(Icons.favorite)),
                  VTSTabItem(icon: Icon(Icons.star)),
                ])),
            Container(
              height: MediaQuery.of(context).size.height / 5,
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
                    vtsType: VTSTabType.TOPBAR,
                    content: [
                  VTSTabItem(icon: Icon(Icons.home)),
                  VTSTabItem(icon: Icon(Icons.favorite)),
                  VTSTabItem(icon: Icon(Icons.star)),
                ])),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              child: VTSTabBarView(
                controller: tabController2,
                children: <Widget>[
                  Center(child: Text('Tab 1')),
                  Center(child: Text('Tab 2')),
                  Center(child: Text('Tab 3')),
                ],
              ),
            ),
            Container(
                child: VTSTabBar(
                    tabController: tabController3,
                    vtsType: VTSTabType.TOPBAR,
                    content: [
                  VTSTabItem(icon: Icon(Icons.home)),
                  VTSTabItem(icon: Icon(Icons.favorite)),
                  VTSTabItem(icon: Icon(Icons.star)),
                  VTSTabItem(icon: Icon(Icons.person)),
                ])),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              child: VTSTabBarView(
                controller: tabController3,
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
