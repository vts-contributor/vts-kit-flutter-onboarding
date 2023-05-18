import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_component/common/style/vts_color.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';

class BadgesPage extends StatefulWidget {
  @override
  _BadgesPageState createState() => _BadgesPageState();
}

class _BadgesPageState extends State<BadgesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Badge'),
        body: ListView(
          children: <Widget>[
            DemoBox(
              title: 'BADGES',
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: VTSBadge(
                          parent: SizedBox(height: 40, width: 50),
                          text: "1",
                          vtsShape: VTSBadgeShape.CIRCLE,
                          vtsType: VTSBadgeType.SOLID,
                          vtsSize: VTSBadgeSize.MD,
                          vtsPosition: VTSBadgePosition.TOP_LEFT,
                          primaryColor: VTSColors.GRAY_2,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: VTSBadge(
                          parent: SizedBox(height: 40, width: 50),
                          text: "1",
                          vtsShape: VTSBadgeShape.CIRCLE,
                          vtsType: VTSBadgeType.OUTLINE,
                          vtsSize: VTSBadgeSize.MD,
                          vtsPosition: VTSBadgePosition.TOP_LEFT,
                          primaryColor: VTSColors.GRAY_2,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: VTSBadge(
                          parent: SizedBox(height: 40, width: 50),
                          text: "1",
                          vtsShape: VTSBadgeShape.CIRCLE,
                          vtsType: VTSBadgeType.SOLID,
                          vtsSize: VTSBadgeSize.MD,
                          vtsPosition: VTSBadgePosition.TOP_LEFT,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: VTSBadge(
                          parent: SizedBox(height: 40, width: 50),
                          text: "1",
                          vtsShape: VTSBadgeShape.CIRCLE,
                          vtsType: VTSBadgeType.OUTLINE,
                          vtsSize: VTSBadgeSize.MD,
                          vtsPosition: VTSBadgePosition.TOP_LEFT,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: VTSBadge(
                          parent: SizedBox(height: 40, width: 50),
                          text: "1",
                          vtsShape: VTSBadgeShape.CIRCLE,
                          vtsType: VTSBadgeType.SOLID,
                          vtsSize: VTSBadgeSize.MD,
                          vtsPosition: VTSBadgePosition.TOP_LEFT,
                          primaryColor: VTSColors.FUNC_GREEN_2,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: VTSBadge(
                          parent: SizedBox(height: 40, width: 50),
                          text: "1",
                          vtsShape: VTSBadgeShape.CIRCLE,
                          vtsType: VTSBadgeType.OUTLINE,
                          vtsSize: VTSBadgeSize.MD,
                          vtsPosition: VTSBadgePosition.TOP_LEFT,
                          primaryColor: VTSColors.FUNC_GREEN_2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: VTSBadge(
                          parent: SizedBox(height: 40, width: 50),
                          text: "1",
                          vtsShape: VTSBadgeShape.CIRCLE,
                          vtsType: VTSBadgeType.SOLID,
                          vtsSize: VTSBadgeSize.SM,
                          vtsPosition: VTSBadgePosition.TOP_LEFT,
                          primaryColor: VTSColors.GRAY_2,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: VTSBadge(
                          parent: SizedBox(height: 40, width: 50),
                          text: "1",
                          vtsShape: VTSBadgeShape.CIRCLE,
                          vtsType: VTSBadgeType.OUTLINE,
                          vtsSize: VTSBadgeSize.SM,
                          vtsPosition: VTSBadgePosition.TOP_LEFT,
                          primaryColor: VTSColors.GRAY_2,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: VTSBadge(
                          parent: SizedBox(height: 40, width: 50),
                          text: "1",
                          vtsShape: VTSBadgeShape.CIRCLE,
                          vtsType: VTSBadgeType.SOLID,
                          vtsSize: VTSBadgeSize.SM,
                          vtsPosition: VTSBadgePosition.TOP_LEFT,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: VTSBadge(
                          parent: SizedBox(height: 40, width: 50),
                          text: "1",
                          vtsShape: VTSBadgeShape.CIRCLE,
                          vtsType: VTSBadgeType.OUTLINE,
                          vtsSize: VTSBadgeSize.SM,
                          vtsPosition: VTSBadgePosition.TOP_LEFT,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: VTSBadge(
                          parent: SizedBox(height: 40, width: 50),
                          text: "1",
                          vtsShape: VTSBadgeShape.CIRCLE,
                          vtsType: VTSBadgeType.SOLID,
                          vtsSize: VTSBadgeSize.SM,
                          vtsPosition: VTSBadgePosition.TOP_LEFT,
                          primaryColor: VTSColors.FUNC_GREEN_2,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: VTSBadge(
                          parent: SizedBox(height: 40, width: 50),
                          text: "1",
                          vtsShape: VTSBadgeShape.CIRCLE,
                          vtsType: VTSBadgeType.OUTLINE,
                          vtsSize: VTSBadgeSize.SM,
                          vtsPosition: VTSBadgePosition.TOP_LEFT,
                          primaryColor: VTSColors.FUNC_GREEN_2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            DemoBox(
              title: 'USAGE',
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      VTSBadge(
                        parent: VTSButton(
                          onPressed: () {},
                          text: "S Button",
                        ),
                        text: "1",
                        vtsShape: VTSBadgeShape.CIRCLE,
                        vtsType: VTSBadgeType.SOLID,
                        vtsSize: VTSBadgeSize.MD,
                        primaryColor: VTSColors.GRAY_2,
                      ),
                      VTSBadge(
                        parent: VTSButton(
                          onPressed: () {},
                          text: "S Button",
                          vtsType: VTSButtonType.SECONDARY,
                        ),
                        text: "1",
                        vtsShape: VTSBadgeShape.CIRCLE,
                        vtsType: VTSBadgeType.SOLID,
                        vtsSize: VTSBadgeSize.MD,
                        primaryColor: VTSColors.GRAY_2,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      VTSBadge(
                        parent: VTSButton(
                          onPressed: () {},
                          text: "S Button",
                          vtsShape: VTSButtonShape.PILL,
                        ),
                        text: "1",
                        vtsShape: VTSBadgeShape.CIRCLE,
                        vtsType: VTSBadgeType.SOLID,
                        vtsSize: VTSBadgeSize.MD,
                        primaryColor: VTSColors.GRAY_2,
                      ),
                      VTSBadge(
                        parent: VTSButton(
                          onPressed: () {},
                          text: "S Button",
                          vtsType: VTSButtonType.SECONDARY,
                          vtsShape: VTSButtonShape.PILL,
                        ),
                        text: "1",
                        vtsShape: VTSBadgeShape.CIRCLE,
                        vtsType: VTSBadgeType.SOLID,
                        vtsSize: VTSBadgeSize.MD,
                        primaryColor: VTSColors.GRAY_2,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      VTSBadge(
                        parent: VTSButton(
                          onPressed: () => {},
                          vtsSize: VTSButtonSize.SM,
                          icon: const Icon(
                            Icons.notifications,
                            size: 18,
                          ),
                        ),
                        text: "1",
                        vtsShape: VTSBadgeShape.CIRCLE,
                        vtsType: VTSBadgeType.SOLID,
                        vtsSize: VTSBadgeSize.SM,
                      ),
                      VTSBadge(
                        parent: VTSButton(
                          onPressed: () => {},
                          vtsSize: VTSButtonSize.SM,
                          background: VTSColors.WHITE_1,
                          icon: const Icon(
                            Icons.notifications,
                            color: VTSColors.GRAY_2,
                            size: 24,
                          ),
                        ),
                        text: "1",
                        vtsShape: VTSBadgeShape.CIRCLE,
                        vtsType: VTSBadgeType.SOLID,
                        vtsSize: VTSBadgeSize.SM,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      VTSBadge(
                        parent: VTSButton(
                          onPressed: () => {},
                          vtsSize: VTSButtonSize.MD,
                          icon: const Icon(
                            Icons.notifications,
                          ),
                        ),
                        text: "1",
                        vtsShape: VTSBadgeShape.CIRCLE,
                        vtsType: VTSBadgeType.SOLID,
                        vtsSize: VTSBadgeSize.MD,
                      ),
                      VTSBadge(
                        parent: VTSButton(
                          onPressed: () => {},
                          vtsSize: VTSButtonSize.MD,
                          background: VTSColors.WHITE_1,
                          icon: const Icon(
                            Icons.notifications,
                            color: VTSColors.GRAY_2,
                            size: 40,
                          ),
                        ),
                        text: "1",
                        vtsShape: VTSBadgeShape.CIRCLE,
                        vtsType: VTSBadgeType.SOLID,
                        vtsSize: VTSBadgeSize.MD,
                        offset: Offset(0.3, -0.1),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      VTSBadge(
                        parent: VTSButton(
                          onPressed: () => {},
                          vtsSize: VTSButtonSize.LG,
                          vtsShape: VTSButtonShape.CIRCLE,
                          icon: const Icon(
                            Icons.notifications,
                            size: 40,
                          ),
                        ),
                        text: "1",
                        vtsShape: VTSBadgeShape.CIRCLE,
                        vtsType: VTSBadgeType.SOLID,
                        vtsSize: VTSBadgeSize.MD,
                        offset: Offset(0.3, -0.5),
                      ),
                      VTSBadge(
                        parent: VTSButton(
                          onPressed: () => {},
                          vtsSize: VTSButtonSize.LG,
                          background: VTSColors.WHITE_1,
                          icon: const Icon(
                            Icons.notifications,
                            color: VTSColors.GRAY_2,
                            size: 50,
                          ),
                        ),
                        text: "New",
                        vtsShape: VTSBadgeShape.PILL,
                        vtsType: VTSBadgeType.SOLID,
                        vtsSize: VTSBadgeSize.MD,
                        primaryColor: VTSColors.FUNC_GREEN_2,
                        offset: Offset(0.3, -0.1),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
