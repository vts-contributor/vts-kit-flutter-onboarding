import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';

final List<String> imageList = [
  'lib/assets/images/card5.png',
  'lib/assets/images/image.png',
  'lib/assets/images/image1.png',
  'lib/assets/images/image2.png',
  'lib/assets/images/card4.png',
];

final List<String> assetImg = [
  'lib/assets/images/red.png',
  'lib/assets/images/purple.png',
  'lib/assets/images/orange.png',
  'lib/assets/images/red.png',
];

final List<Color> gradientColor = [
  const Color(0xffF0417C),
  const Color(0xFFFF3636),
];

final List<Color> gradientColors = [
  const Color(0xffFFD633),
  const Color(0xFFFF8F33),
];

class CarouselPage extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<CarouselPage>
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
        appBar: DemoAppbar(title: 'Carousel'),
        body: ListView(
          children: <Widget>[
            Container(
                child: VTSTabBar(
                    tabController: tabController,
                    content: [
                      VTSTabItem(text: 'GRADIENT'),
                      VTSTabItem(text: 'IMAGE'),
                    ],
                    vtsType: VTSTabType.TOPBAR,
                    isScrollable: true)),
            Container(
              height: MediaQuery.of(context).size.height - 140,
              child: VTSTabBarView(
                controller: tabController,
                children: <Widget>[
                  Container(
                    child: ListView(
                      children: <Widget>[
                        DemoBox(
                          title: "FULL WIDTH",
                          padding: EdgeInsets.only(top: 16.0, bottom: 0.0),
                          child: VTSCarousel(
                            autoPlay: true,
                            pagination: true,
                            viewportFraction: 0.7,
                            height: 184,
                            items: [
                              VTSCard(
                                  title: "Card Title",
                                  subtitle: "Sub Title",
                                  bodyText:
                                      "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                  margin:
                                      EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
                                  background: VTSColors.FUNC_RED_2,
                                  fontColor: VTSColors.WHITE_1,
                                  bodyMaxLine: 2),
                              VTSCard(
                                  title: "Card Title",
                                  subtitle: "Sub Title",
                                  bodyText:
                                      "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                  margin:
                                      EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
                                  background: VTSColors.GRAY_1,
                                  fontColor: VTSColors.WHITE_1,
                                  bodyMaxLine: 2),
                              VTSCard(
                                  title: "Card Title",
                                  subtitle: "Sub Title",
                                  bodyText:
                                      "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                  margin:
                                      EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
                                  background: VTSColors.ILUS_BLUE_GRAY_5,
                                  fontColor: VTSColors.WHITE_1,
                                  bodyMaxLine: 2),
                            ],
                          ),
                        ),
                        DemoBox(
                          title: "MULTIPLE ITEMS",
                          padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                          child: VTSItemsCarousel(
                              itemPerPage: 2,
                              height: 202,
                              items: [
                                VTSCard(
                                    title: "Card Title",
                                    subtitle: "Sub Title",
                                    bodyText:
                                        "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                    margin:
                                        EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                                    background: VTSColors.FUNC_RED_2,
                                    fontColor: VTSColors.WHITE_1,
                                    bodyMaxLine: 4),
                                VTSCard(
                                    title: "Card Title",
                                    subtitle: "Sub Title",
                                    bodyText:
                                        "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                    margin:
                                        EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                                    background: VTSColors.GRAY_1,
                                    fontColor: VTSColors.WHITE_1,
                                    bodyMaxLine: 4),
                                VTSCard(
                                    title: "Card Title",
                                    subtitle: "Sub Title",
                                    bodyText:
                                        "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                    margin:
                                        EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                                    background: VTSColors.FUNC_RED_2,
                                    fontColor: VTSColors.WHITE_1,
                                    bodyMaxLine: 4),
                                VTSCard(
                                    title: "Card Title",
                                    subtitle: "Sub Title",
                                    bodyText:
                                        "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                    margin:
                                        EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                                    background: VTSColors.GRAY_1,
                                    fontColor: VTSColors.WHITE_1,
                                    bodyMaxLine: 4),
                                VTSCard(
                                    title: "Card Title",
                                    subtitle: "Sub Title",
                                    bodyText:
                                        "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                    margin:
                                        EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                                    background: VTSColors.FUNC_RED_2,
                                    fontColor: VTSColors.WHITE_1,
                                    bodyMaxLine: 4),
                                VTSCard(
                                    title: "Card Title",
                                    subtitle: "Sub Title",
                                    bodyText:
                                        "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                    margin:
                                        EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                                    background: VTSColors.GRAY_1,
                                    fontColor: VTSColors.WHITE_1,
                                    bodyMaxLine: 4),
                              ]),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: <Widget>[
                        DemoBox(
                          title: "FULL WIDTH",
                          padding: EdgeInsets.only(top: 16.0, bottom: 0.0),
                          child: VTSCarousel(
                            autoPlay: true,
                            pagination: true,
                            viewportFraction: 0.7,
                            height: 184,
                            items: [
                              VTSCard(
                                  title: "Card Title",
                                  subtitle: "Sub Title",
                                  bodyText:
                                      "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                  margin:
                                      EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
                                  backgroundImg: AssetImage(
                                      'lib/assets/images/carousel-image-1.png'),
                                  fontColor: VTSColors.WHITE_1,
                                  bodyMaxLine: 2),
                              VTSCard(
                                  title: "Card Title",
                                  subtitle: "Sub Title",
                                  bodyText:
                                      "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                  margin:
                                      EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
                                  backgroundImg: AssetImage(
                                      'lib/assets/images/carousel-image-2.png'),
                                  fontColor: VTSColors.WHITE_1,
                                  bodyMaxLine: 2),
                              VTSCard(
                                  title: "Card Title",
                                  subtitle: "Sub Title",
                                  bodyText:
                                      "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                  margin:
                                      EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
                                  backgroundImg: AssetImage(
                                      'lib/assets/images/carousel-image-3.png'),
                                  fontColor: VTSColors.WHITE_1,
                                  bodyMaxLine: 2),
                            ],
                          ),
                        ),
                        DemoBox(
                          title: "MULTIPLE ITEMS",
                          padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                          child: VTSItemsCarousel(
                              itemPerPage: 2,
                              height: 202,
                              items: [
                                VTSCard(
                                    title: "Card Title",
                                    subtitle: "Sub Title",
                                    bodyText:
                                        "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                    margin:
                                        EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                                    backgroundImg: AssetImage(
                                        'lib/assets/images/carousel-image-4.png'),
                                    fontColor: VTSColors.WHITE_1,
                                    bodyMaxLine: 4),
                                VTSCard(
                                    title: "Card Title",
                                    subtitle: "Sub Title",
                                    bodyText:
                                        "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                    margin:
                                        EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                                    backgroundImg: AssetImage(
                                        'lib/assets/images/carousel-image-5.png'),
                                    fontColor: VTSColors.WHITE_1,
                                    bodyMaxLine: 4),
                                VTSCard(
                                    title: "Card Title",
                                    subtitle: "Sub Title",
                                    bodyText:
                                        "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                    margin:
                                        EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                                    backgroundImg: AssetImage(
                                        'lib/assets/images/carousel-image-6.png'),
                                    fontColor: VTSColors.WHITE_1,
                                    bodyMaxLine: 4),
                                VTSCard(
                                    title: "Card Title",
                                    subtitle: "Sub Title",
                                    bodyText:
                                        "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                    margin:
                                        EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                                    backgroundImg: AssetImage(
                                        'lib/assets/images/carousel-image-1.png'),
                                    fontColor: VTSColors.WHITE_1,
                                    bodyMaxLine: 4),
                                VTSCard(
                                    title: "Card Title",
                                    subtitle: "Sub Title",
                                    bodyText:
                                        "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                    margin:
                                        EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                                    backgroundImg: AssetImage(
                                        'lib/assets/images/carousel-image-2.png'),
                                    fontColor: VTSColors.WHITE_1,
                                    bodyMaxLine: 4),
                                VTSCard(
                                    title: "Card Title",
                                    subtitle: "Sub Title",
                                    bodyText:
                                        "Lorem ipsum dolor sit amet, conseo ctu adipis scling elit.",
                                    margin:
                                        EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                                    backgroundImg: AssetImage(
                                        'lib/assets/images/carousel-image-3.png'),
                                    fontColor: VTSColors.WHITE_1,
                                    bodyMaxLine: 4),
                              ]),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
}
