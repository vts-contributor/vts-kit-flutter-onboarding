import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';

class BottomLabelTab extends StatefulWidget {
  @override
  _BottomLabelTabState createState() => _BottomLabelTabState();
}

class _BottomLabelTabState extends State<BottomLabelTab>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: DemoAppbar(title: 'Bottom labeled tabs'),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: VTSTabBarView(
            controller: tabController,
            children: <Widget>[
              Center(child: Text('Tab 1')),
              Center(child: Text('Tab 2')),
              Center(child: Text('Tab 3')),
              Center(child: Text('Tab 4')),
              Center(child: Text('Tab 5')),
            ],
          )),
      bottomNavigationBar: Container(
          child: VTSTabBar(
              tabController: tabController,
              vtsType: VTSTabType.BOTTOMBAR,
              content: [
            VTSTabItem(text: 'Caption', icon: Icon(Icons.star)),
            VTSTabItem(text: 'Caption', icon: Icon(Icons.star)),
            VTSTabItem(text: 'Caption', icon: Icon(Icons.star)),
            VTSTabItem(text: 'Caption', icon: Icon(Icons.star)),
            VTSTabItem(text: 'Caption', icon: Icon(Icons.star))
          ])));
}
