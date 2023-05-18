import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_subtitle.dart';

class PillsButtons extends StatefulWidget {
  @override
  _PillsButtonsState createState() => _PillsButtonsState();
}

class _PillsButtonsState extends State<PillsButtons>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Pill buttons'),
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
                                      // onPressed: () => {setState(() => enabled = false)},
                                      onPressed: () => {},
                                      text: "S Button",
                                      vtsSize: VTSButtonSize.SM,
                                      vtsShape: VTSButtonShape.PILL,
                                    ),
                                    VTSButton(
                                      // onPressed: () => {setState(() => enabled = false)},
                                      onPressed: () => {},
                                      text: "S Button",
                                      enabled: false,
                                      vtsSize: VTSButtonSize.SM,
                                      vtsShape: VTSButtonShape.PILL,
                                    ),
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
                                      vtsShape: VTSButtonShape.PILL,
                                    ),
                                    VTSButton(
                                      // onPressed: () => {setState(() => enabled = false)},
                                      onPressed: () => {},
                                      text: "M Button",
                                      vtsShape: VTSButtonShape.PILL,
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
                                      vtsShape: VTSButtonShape.PILL,
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "M Button",
                                      vtsSize: VTSButtonSize.MD,
                                      blockButton: true,
                                      vtsShape: VTSButtonShape.PILL,
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "S Button",
                                      vtsSize: VTSButtonSize.SM,
                                      vtsShape: VTSButtonShape.PILL,
                                      blockButton: true,
                                      enabled: false,
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "M Button",
                                      vtsSize: VTSButtonSize.MD,
                                      blockButton: true,
                                      vtsShape: VTSButtonShape.PILL,
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
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsShape: VTSButtonShape.PILL,
                                    ),
                                    VTSButton(
                                      // onPressed: () => {setState(() => enabled = false)},
                                      onPressed: () => {},
                                      text: "S Button",
                                      enabled: false,
                                      vtsSize: VTSButtonSize.SM,
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsShape: VTSButtonShape.PILL,
                                    ),
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
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsShape: VTSButtonShape.PILL,
                                    ),
                                    VTSButton(
                                      // onPressed: () => {setState(() => enabled = false)},
                                      onPressed: () => {},
                                      text: "M Button",
                                      enabled: false,
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsShape: VTSButtonShape.PILL,
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
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsShape: VTSButtonShape.PILL,
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "M Button",
                                      vtsSize: VTSButtonSize.MD,
                                      blockButton: true,
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsShape: VTSButtonShape.PILL,
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "S Button",
                                      vtsSize: VTSButtonSize.SM,
                                      blockButton: true,
                                      enabled: false,
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsShape: VTSButtonShape.PILL,
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "M Button",
                                      vtsSize: VTSButtonSize.MD,
                                      blockButton: true,
                                      enabled: false,
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsShape: VTSButtonShape.PILL,
                                    ),
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
