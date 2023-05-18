import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_subtitle.dart';

class StandardButtons extends StatefulWidget {
  @override
  _StandardButtonsState createState() => _StandardButtonsState();
}

class _StandardButtonsState extends State<StandardButtons>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late bool enabled = true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Standard buttons'),
        body: ListView(
          children: <Widget>[
            Container(
                child: VTSTabBar(
                    tabController: tabController,
                    content: [
                      VTSTabItem(text: 'PRIMARY BUTTON'),
                      VTSTabItem(text: 'SECONDARY BUTTON'),
                    ],
                    vtsType: VTSTabType.TOPBAR,
                    isScrollable: true)),
            Container(
              height: MediaQuery.of(context).size.height - 140,
              child: VTSTabBarView(
                  controller: tabController,
                  height: 400,
                  children: <Widget>[
                    Container(
                      child: ListView(
                        children: <Widget>[
                          DemoBox(
                            title: 'DEFAULT',
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                DemoSubtitle(title: 'Size S'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "S Button",
                                      vtsSize: VTSButtonSize.SM,
                                    ),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "S Button",
                                      enabled: false,
                                      vtsSize: VTSButtonSize.SM,
                                    ),
                                  ],
                                ),
                                DemoSubtitle(top: 32, title: 'Size M'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "M Button",
                                    ),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "M Button",
                                      enabled: false,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          DemoBox(
                            title: 'BLOCK BUTTON',
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(height: 8),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "S Button",
                                      vtsSize: VTSButtonSize.SM,
                                      blockButton: true,
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "M Button",
                                      vtsSize: VTSButtonSize.MD,
                                      blockButton: true,
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "S Button",
                                      vtsSize: VTSButtonSize.SM,
                                      blockButton: true,
                                      enabled: false,
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "M Button",
                                      vtsSize: VTSButtonSize.MD,
                                      blockButton: true,
                                      enabled: false,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView(
                        children: <Widget>[
                          DemoBox(
                            title: 'DEFAULT',
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                DemoSubtitle(title: 'Size S'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    VTSButton(
                                        // onPressed: () => {setState(() => enabled = false)},
                                        onPressed: () => {},
                                        text: "S Button",
                                        vtsSize: VTSButtonSize.SM,
                                        vtsType: VTSButtonType.SECONDARY),
                                    VTSButton(
                                        // onPressed: () => {setState(() => enabled = false)},
                                        onPressed: () => {},
                                        text: "S Button",
                                        enabled: false,
                                        vtsSize: VTSButtonSize.SM,
                                        vtsType: VTSButtonType.SECONDARY),
                                  ],
                                ),
                                DemoSubtitle(top: 32, title: 'Size M'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    VTSButton(
                                        // onPressed: () => {setState(() => enabled = false)},
                                        onPressed: () => {},
                                        text: "M Button",
                                        vtsType: VTSButtonType.SECONDARY),
                                    VTSButton(
                                        // onPressed: () => {setState(() => enabled = false)},
                                        onPressed: () => {},
                                        text: "M Button",
                                        enabled: false,
                                        vtsType: VTSButtonType.SECONDARY),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          DemoBox(
                            title: 'BLOCK BUTTON',
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(height: 8),
                                    VTSButton(
                                        onPressed: () => {},
                                        text: "S Button",
                                        vtsSize: VTSButtonSize.SM,
                                        blockButton: true,
                                        vtsType: VTSButtonType.SECONDARY),
                                    SizedBox(height: 16),
                                    VTSButton(
                                        onPressed: () => {},
                                        text: "M Button",
                                        vtsSize: VTSButtonSize.MD,
                                        blockButton: true,
                                        vtsType: VTSButtonType.SECONDARY),
                                    SizedBox(height: 16),
                                    VTSButton(
                                        onPressed: () => {},
                                        text: "S Button",
                                        vtsSize: VTSButtonSize.SM,
                                        blockButton: true,
                                        enabled: false,
                                        vtsType: VTSButtonType.SECONDARY),
                                    SizedBox(height: 16),
                                    VTSButton(
                                        onPressed: () => {},
                                        text: "M Button",
                                        vtsSize: VTSButtonSize.MD,
                                        blockButton: true,
                                        enabled: false,
                                        vtsType: VTSButtonType.SECONDARY),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            )
          ],
        ),
      );
}
