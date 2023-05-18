import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';

class BottomIconTab extends StatefulWidget {
  @override
  _BottomIconTabState createState() => _BottomIconTabState();
}

class _BottomIconTabState extends State<BottomIconTab>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: DemoAppbar(title: 'Bottom tabs'),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: VTSTabBarView(
            controller: tabController,
            children: <Widget>[
              Center(child: Text('Tab 1')),
              Center(child: Text('Tab 2')),
              Center(child: Text('Tab 3')),
            ],
          )),
      bottomNavigationBar: Container(
          child: VTSTabBar(
              tabController: tabController,
              vtsType: VTSTabType.BOTTOMBAR,
              content: [
            VTSTabItem(icon: Icon(Icons.star)),
            VTSTabItem(icon: Icon(Icons.star)),
            VTSTabItem(icon: Icon(Icons.star))
          ])));
}
