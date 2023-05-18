import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_subtitle.dart';

class IconButtons extends StatefulWidget {
  @override
  _IconButtonsState createState() => _IconButtonsState();
}

class _IconButtonsState extends State<IconButtons>
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
        appBar: DemoAppbar(title: 'Icon buttons'),
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
                            title: 'ICON & TEXT STANDARD BUTTONS',
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
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "S Button",
                                      enabled: false,
                                      vtsSize: VTSButtonSize.SM,
                                      icon: const Icon(Icons.add_box_sharp),
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
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "M Button",
                                      enabled: false,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          DemoBox(
                            title: 'BLOCK STANDARD BUTTON',
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
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "M Button",
                                      vtsSize: VTSButtonSize.MD,
                                      blockButton: true,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "S Button",
                                      vtsSize: VTSButtonSize.SM,
                                      blockButton: true,
                                      enabled: false,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "M Button",
                                      vtsSize: VTSButtonSize.MD,
                                      blockButton: true,
                                      enabled: false,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          DemoBox(
                            title: 'ICON & TEXT PILL BUTTONS',
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
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    VTSButton(
                                      // onPressed: () => {setState(() => enabled = false)},
                                      onPressed: () => {},
                                      text: "S Button",
                                      enabled: false,
                                      vtsSize: VTSButtonSize.SM,
                                      vtsShape: VTSButtonShape.PILL,
                                      icon: const Icon(Icons.add_box_sharp),
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
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    VTSButton(
                                      // onPressed: () => {setState(() => enabled = false)},
                                      onPressed: () => {},
                                      text: "M Button",
                                      enabled: false,
                                      vtsShape: VTSButtonShape.PILL,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          DemoBox(
                            title: 'BLOCK PILL BUTTON',
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
                                      vtsShape: VTSButtonShape.PILL,
                                      blockButton: true,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "M Button",
                                      vtsSize: VTSButtonSize.MD,
                                      vtsShape: VTSButtonShape.PILL,
                                      blockButton: true,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "S Button",
                                      vtsSize: VTSButtonSize.SM,
                                      vtsShape: VTSButtonShape.PILL,
                                      blockButton: true,
                                      enabled: false,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "M Button",
                                      vtsSize: VTSButtonSize.MD,
                                      vtsShape: VTSButtonShape.PILL,
                                      blockButton: true,
                                      enabled: false,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          DemoBox(
                            title: 'ONLY ICON',
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                DemoSubtitle(title: 'Size S'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.SM,
                                      icon: const Icon(Icons.delete),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.SM,
                                      icon: const Icon(Icons.delete),
                                      enabled: false,
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.SM,
                                      vtsType: VTSButtonType.TEXT,
                                      icon: const Icon(Icons.favorite),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.SM,
                                      icon: const Icon(Icons.favorite),
                                      vtsType: VTSButtonType.TEXT,
                                      enabled: false,
                                    ),
                                  ],
                                ),
                                DemoSubtitle(top: 32, title: 'Size M'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.MD,
                                      icon: const Icon(Icons.filter_alt),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.MD,
                                      icon: const Icon(Icons.filter_alt),
                                      enabled: false,
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.MD,
                                      vtsType: VTSButtonType.TEXT,
                                      icon: const Icon(Icons.favorite),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.MD,
                                      vtsType: VTSButtonType.TEXT,
                                      icon: const Icon(Icons.favorite),
                                      enabled: false,
                                    ),
                                  ],
                                ),
                                DemoSubtitle(top: 32, title: 'Size L'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.LG,
                                      icon: const Icon(Icons.filter_alt),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.LG,
                                      icon: const Icon(Icons.filter_alt),
                                      enabled: false,
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.LG,
                                      vtsShape: VTSButtonShape.CIRCLE,
                                      icon: const Icon(Icons.notifications),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                        onPressed: () => {},
                                        vtsSize: VTSButtonSize.LG,
                                        vtsShape: VTSButtonShape.CIRCLE,
                                        icon: const Icon(Icons.notifications),
                                        enabled: false),
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
                            title: 'ICON & TEXT STANDARD BUTTONS',
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                DemoSubtitle(
                                  title: 'Size S',
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "Button",
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsSize: VTSButtonSize.SM,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "Button",
                                      vtsType: VTSButtonType.SECONDARY,
                                      enabled: false,
                                      vtsSize: VTSButtonSize.SM,
                                      icon: const Icon(Icons.add_box_sharp),
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
                                      text: "Button",
                                      vtsType: VTSButtonType.SECONDARY,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "Button",
                                      vtsType: VTSButtonType.SECONDARY,
                                      enabled: false,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          DemoBox(
                            title: 'BLOCK STANDARD BUTTON',
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
                                      text: "Button",
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsSize: VTSButtonSize.SM,
                                      blockButton: true,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "Button",
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsSize: VTSButtonSize.MD,
                                      blockButton: true,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "Button",
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsSize: VTSButtonSize.SM,
                                      blockButton: true,
                                      enabled: false,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "Button",
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsSize: VTSButtonSize.MD,
                                      blockButton: true,
                                      enabled: false,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          DemoBox(
                            title: 'ICON & TEXT PILL BUTTONS',
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
                                      text: "Button",
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsSize: VTSButtonSize.SM,
                                      vtsShape: VTSButtonShape.PILL,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "Button",
                                      vtsType: VTSButtonType.SECONDARY,
                                      enabled: false,
                                      vtsSize: VTSButtonSize.SM,
                                      vtsShape: VTSButtonShape.PILL,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                  ],
                                ),
                                DemoSubtitle(title: 'Size M'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "Button",
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsShape: VTSButtonShape.PILL,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "Button",
                                      vtsType: VTSButtonType.SECONDARY,
                                      enabled: false,
                                      vtsShape: VTSButtonShape.PILL,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          DemoBox(
                            title: 'BLOCK PILL BUTTON',
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
                                      text: "Button",
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsSize: VTSButtonSize.SM,
                                      vtsShape: VTSButtonShape.PILL,
                                      blockButton: true,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "Button",
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsSize: VTSButtonSize.MD,
                                      vtsShape: VTSButtonShape.PILL,
                                      blockButton: true,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "Button",
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsSize: VTSButtonSize.SM,
                                      vtsShape: VTSButtonShape.PILL,
                                      blockButton: true,
                                      enabled: false,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      text: "Button",
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsSize: VTSButtonSize.MD,
                                      vtsShape: VTSButtonShape.PILL,
                                      blockButton: true,
                                      enabled: false,
                                      icon: const Icon(Icons.add_box_sharp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          DemoBox(
                            title: 'ONLY ICON',
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                DemoSubtitle(title: 'Size S'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.SM,
                                      vtsType: VTSButtonType.SECONDARY,
                                      icon: const Icon(Icons.delete),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                        onPressed: () => {},
                                        vtsSize: VTSButtonSize.SM,
                                        vtsType: VTSButtonType.SECONDARY,
                                        icon: const Icon(Icons.delete),
                                        enabled: false),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.SM,
                                      vtsType: VTSButtonType.TEXT,
                                      icon: const Icon(Icons.favorite_border),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                        onPressed: () => {},
                                        vtsSize: VTSButtonSize.SM,
                                        vtsType: VTSButtonType.TEXT,
                                        icon: const Icon(Icons.favorite_border),
                                        enabled: false),
                                  ],
                                ),
                                DemoSubtitle(top: 32, title: 'Size M'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.MD,
                                      vtsType: VTSButtonType.SECONDARY,
                                      icon: const Icon(Icons.filter_alt),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                        onPressed: () => {},
                                        vtsSize: VTSButtonSize.MD,
                                        vtsType: VTSButtonType.SECONDARY,
                                        icon: const Icon(Icons.filter_alt),
                                        enabled: false),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.MD,
                                      vtsType: VTSButtonType.TEXT,
                                      icon: const Icon(Icons.favorite_border),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                        onPressed: () => {},
                                        vtsSize: VTSButtonSize.MD,
                                        vtsType: VTSButtonType.TEXT,
                                        icon: const Icon(Icons.favorite_border),
                                        enabled: false),
                                  ],
                                ),
                                DemoSubtitle(top: 32, title: 'Size L'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.LG,
                                      vtsType: VTSButtonType.SECONDARY,
                                      icon: const Icon(Icons.filter_alt),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                        onPressed: () => {},
                                        vtsSize: VTSButtonSize.LG,
                                        vtsType: VTSButtonType.SECONDARY,
                                        icon: const Icon(Icons.filter_alt),
                                        enabled: false),
                                    SizedBox(height: 16),
                                    VTSButton(
                                      onPressed: () => {},
                                      vtsSize: VTSButtonSize.LG,
                                      vtsType: VTSButtonType.SECONDARY,
                                      vtsShape: VTSButtonShape.CIRCLE,
                                      icon: const Icon(Icons.filter_alt),
                                    ),
                                    SizedBox(height: 16),
                                    VTSButton(
                                        onPressed: () => {},
                                        vtsSize: VTSButtonSize.LG,
                                        vtsType: VTSButtonType.SECONDARY,
                                        vtsShape: VTSButtonShape.CIRCLE,
                                        icon: const Icon(Icons.filter_alt),
                                        enabled: false),
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
