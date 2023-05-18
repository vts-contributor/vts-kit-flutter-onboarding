import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  late bool isFavorite = false;
  late bool isSubscribe = false;

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

  bool fav = false;
  bool fav1 = false;
  bool fav2 = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Cards'),
        body: ListView(
          children: <Widget>[
            Container(
                child: VTSTabBar(
                    tabController: tabController,
                    content: [
                      VTSTabItem(text: 'BASIC'),
                      VTSTabItem(text: 'AVATARS'),
                      VTSTabItem(text: 'FULL IMAGE'),
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
                        SizedBox(height: 8),
                        VTSCard(
                          vtsType: VTSCardType.BASIC,
                          title: 'Card title',
                          anchorActions: [
                            VTSButton(
                              onPressed: () => setState(() {
                                isFavorite = !isFavorite;
                              }),
                              vtsSize: VTSButtonSize.SM,
                              background: VTSColors.WHITE_1,
                              vtsType: VTSButtonType.TEXT,
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: isFavorite
                                    ? VTSColors.PRIMARY_2
                                    : VTSColors.GRAY_2,
                                size: 24,
                              ),
                            ),
                          ],
                          bodyText:
                              'Lorem ipsum dolor sit amet, consectu adipis scling elit. Amet sed vel leo erati.',
                          footerButtons: [
                            VTSButton(
                              onPressed: () => {},
                              text: "Secondary",
                              vtsType: VTSButtonType.SECONDARY,
                              vtsSize: VTSButtonSize.SM,
                            ),
                            VTSButton(
                              onPressed: () => {},
                              text: "Primary",
                              vtsSize: VTSButtonSize.SM,
                            ),
                          ],
                        ),
                        VTSCard(
                          vtsType: VTSCardType.BASIC,
                          title: 'Card title',
                          bodyText:
                              'Lorem ipsum dolor sit amet, consectu adipis scling elit. Amet sed vel leo erati.',
                          footerButtons: [
                            VTSButton(
                              onPressed: () => {},
                              text: "Xem thêm",
                              vtsType: VTSButtonType.LINK,
                            )
                          ],
                        ),
                        VTSCard(
                          vtsType: VTSCardType.BASIC,
                          title: 'Card title',
                          bodyText:
                              'Lorem ipsum dolor sit amet, consectu adipis scling elit. Amet sed vel leo erati.',
                          footerButtons: [
                            VTSButton(
                              onPressed: () => {},
                              text: "Primary",
                              vtsSize: VTSButtonSize.SM,
                            )
                          ],
                        ),
                        VTSCard(
                          vtsType: VTSCardType.BASIC,
                          title: 'Card title',
                          subtitle: 'Subtitle',
                          bodyText:
                              'Lorem ipsum dolor sit amet, consectu adipis scling elit. Amet sed vel leo erati.',
                          footerActions: [
                            VTSButton(
                              onPressed: () => {},
                              text: "Button",
                              vtsType: VTSButtonType.TEXT,
                              icon: const Icon(Icons.question_answer_outlined),
                            ),
                            VTSButton(
                              onPressed: () => {},
                              text: "Button",
                              vtsType: VTSButtonType.TEXT,
                              icon: const Icon(Icons.share),
                            ),
                          ],
                        ),
                        VTSCard(
                          vtsType: VTSCardType.BASIC,
                          title: 'Card title',
                          subtitle: 'Subtitle',
                          bodyText:
                              'Lorem ipsum dolor sit amet, consectu adipis scling elit. Amet sed vel leo erati.',
                          footerButtons: [
                            VTSButton(
                              onPressed: () => {},
                              vtsSize: VTSButtonSize.MD,
                              vtsShape: VTSButtonShape.CIRCLE,
                              icon: const Icon(FontAwesomeIcons.facebookF),
                              background: const Color(0xFF3B5998),
                            ),
                            VTSButton(
                              onPressed: () => {},
                              vtsSize: VTSButtonSize.MD,
                              vtsShape: VTSButtonShape.CIRCLE,
                              icon: const Icon(FontAwesomeIcons.twitter),
                              background: const Color(0xFF00ACEE),
                            ),
                            VTSButton(
                              onPressed: () => {},
                              vtsSize: VTSButtonSize.MD,
                              vtsShape: VTSButtonShape.CIRCLE,
                              icon: const Icon(FontAwesomeIcons.whatsapp),
                              background: const Color(0xFF25D366),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: <Widget>[
                        VTSCard(
                          vtsType: VTSCardType.AVATAR,
                          title: 'Card Title',
                          subtitle: 'Sub title',
                          imageProvider: AssetImage(
                              'lib/assets/images/default-avatar-1.png'),
                          bodyText:
                              'Lorem ipsum dolor sit amet, consectu adipis scling elit. Amet sed vel leo erati.',
                          anchorActions: [
                            VTSButton(
                              onPressed: () => setState(() {
                                isFavorite = !isFavorite;
                              }),
                              vtsSize: VTSButtonSize.SM,
                              background: VTSColors.WHITE_1,
                              vtsType: VTSButtonType.TEXT,
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: isFavorite
                                    ? VTSColors.PRIMARY_2
                                    : VTSColors.GRAY_2,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        VTSCard(
                          vtsType: VTSCardType.AVATAR,
                          title: 'Card Title',
                          subtitle: 'Sub title',
                          imageProvider: AssetImage(
                              'lib/assets/images/default-avatar-2.png'),
                          bodyText:
                              'Lorem ipsum dolor sit amet, consectu adipis scling elit. Amet sed vel leo erati.',
                          anchorActions: [
                            VTSButton(
                              onPressed: () => setState(() {
                                isFavorite = !isFavorite;
                              }),
                              vtsSize: VTSButtonSize.SM,
                              background: VTSColors.WHITE_1,
                              vtsType: VTSButtonType.TEXT,
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: isFavorite
                                    ? VTSColors.PRIMARY_2
                                    : VTSColors.GRAY_2,
                                size: 24,
                              ),
                            ),
                          ],
                          footerActions: [
                            VTSButton(
                              onPressed: () => {},
                              text: "Button",
                              vtsType: VTSButtonType.TEXT,
                              icon: const Icon(Icons.question_answer_outlined),
                            ),
                            VTSButton(
                              onPressed: () => {},
                              text: "Button",
                              vtsType: VTSButtonType.TEXT,
                              icon: const Icon(Icons.share),
                            ),
                          ],
                        ),
                        VTSCard(
                          vtsType: VTSCardType.AVATAR,
                          title: 'Card Title',
                          subtitle: 'Sub title',
                          imageProvider: AssetImage(
                              'lib/assets/images/default-avatar-1.png'),
                          bodyText:
                              'Lorem ipsum dolor sit amet, consectu adipis scling elit. Amet sed vel leo erati.',
                          anchorActions: [
                            VTSButton(
                              onPressed: () => setState(() {
                                isFavorite = !isFavorite;
                              }),
                              vtsSize: VTSButtonSize.SM,
                              background: VTSColors.WHITE_1,
                              vtsType: VTSButtonType.TEXT,
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: isFavorite
                                    ? VTSColors.PRIMARY_2
                                    : VTSColors.GRAY_2,
                                size: 24,
                              ),
                            ),
                          ],
                          footerButtons: [
                            VTSButton(
                              onPressed: () => {},
                              vtsSize: VTSButtonSize.MD,
                              vtsShape: VTSButtonShape.CIRCLE,
                              icon: const Icon(FontAwesomeIcons.facebookF),
                              background: const Color(0xFF3B5998),
                            ),
                            VTSButton(
                              onPressed: () => {},
                              vtsSize: VTSButtonSize.MD,
                              vtsShape: VTSButtonShape.CIRCLE,
                              icon: const Icon(FontAwesomeIcons.twitter),
                              background: const Color(0xFF00ACEE),
                            ),
                            VTSButton(
                              onPressed: () => {},
                              vtsSize: VTSButtonSize.MD,
                              vtsShape: VTSButtonShape.CIRCLE,
                              icon: const Icon(FontAwesomeIcons.whatsapp),
                              background: const Color(0xFF25D366),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: <Widget>[
                        VTSCard(
                          vtsType: VTSCardType.FULL_IMAGE,
                          title: 'Card Title',
                          subtitle: 'Sub title',
                          imageWidthPercent: 40,
                          imageProvider:
                              AssetImage('lib/assets/images/card-image-1.png'),
                          bodyText:
                              'Lorem ipsum dolor sit amet, consectu adipis scling elit. Amet sed vel leo erati.',
                          anchorActions: [
                            VTSButton(
                              onPressed: () => setState(() {
                                isFavorite = !isFavorite;
                              }),
                              vtsSize: VTSButtonSize.SM,
                              background: VTSColors.WHITE_1,
                              vtsType: VTSButtonType.TEXT,
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: isFavorite
                                    ? VTSColors.PRIMARY_2
                                    : VTSColors.GRAY_2,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        VTSCard(
                          vtsType: VTSCardType.FULL_IMAGE,
                          title: 'Card Title',
                          subtitle: 'Sub title',
                          imageWidthPercent: 40,
                          imageProvider:
                              AssetImage('lib/assets/images/card-image-2.png'),
                          bodyText:
                              'Lorem ipsum dolor sit amet, consectu adipis scling elit. Amet sed vel leo erati.',
                          anchorActions: [
                            VTSButton(
                              onPressed: () => setState(() {
                                isFavorite = !isFavorite;
                              }),
                              vtsSize: VTSButtonSize.SM,
                              background: VTSColors.WHITE_1,
                              vtsType: VTSButtonType.TEXT,
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: isFavorite
                                    ? VTSColors.PRIMARY_2
                                    : VTSColors.GRAY_2,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        VTSCard(
                          vtsType: VTSCardType.FULL_IMAGE,
                          title: 'Card Title',
                          subtitle: 'Sub title',
                          imageWidthPercent: 40,
                          imageProvider:
                              AssetImage('lib/assets/images/card-image-3.png'),
                          bodyText:
                              'Lorem ipsum dolor sit amet, consectu adipis scling elit. Amet sed vel leo erati.',
                          anchorActions: [
                            VTSButton(
                              onPressed: () => setState(() {
                                isFavorite = !isFavorite;
                              }),
                              vtsSize: VTSButtonSize.SM,
                              background: VTSColors.WHITE_1,
                              vtsType: VTSButtonType.TEXT,
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: isFavorite
                                    ? VTSColors.PRIMARY_2
                                    : VTSColors.GRAY_2,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        VTSCard(
                          vtsType: VTSCardType.FULL_IMAGE,
                          title: 'Card Title',
                          subtitle: 'Sub title',
                          imageWidthPercent: 40,
                          imageProvider:
                              AssetImage('lib/assets/images/card-image-4.png'),
                          bodyText:
                              'Lorem ipsum dolor sit amet, consectu adipis scling elit. Amet sed vel leo erati.',
                          anchorActions: [
                            VTSButton(
                              onPressed: () => setState(() {
                                isFavorite = !isFavorite;
                              }),
                              vtsSize: VTSButtonSize.SM,
                              background: VTSColors.WHITE_1,
                              vtsType: VTSButtonType.TEXT,
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: isFavorite
                                    ? VTSColors.PRIMARY_2
                                    : VTSColors.GRAY_2,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        VTSCard(
                          vtsType: VTSCardType.FULL_IMAGE,
                          title: 'Card Title',
                          subtitle: 'Sub title',
                          imageWidthPercent: 40,
                          imageProvider:
                              AssetImage('lib/assets/images/card-image-5.png'),
                          bodyText:
                              'Lorem ipsum dolor sit amet, consectu adipis scling elit. Amet sed vel leo erati.',
                          anchorActions: [
                            VTSButton(
                              onPressed: () => setState(() {
                                isFavorite = !isFavorite;
                              }),
                              vtsSize: VTSButtonSize.SM,
                              background: VTSColors.WHITE_1,
                              vtsType: VTSButtonType.TEXT,
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: isFavorite
                                    ? VTSColors.PRIMARY_2
                                    : VTSColors.GRAY_2,
                                size: 24,
                              ),
                            ),
                          ],
                          footerActions: [
                            VTSButton(
                              onPressed: () => {},
                              text: "Button",
                              vtsType: VTSButtonType.TEXT,
                              icon: const Icon(
                                IconData(0xe907, fontFamily: 'GFSocialFonts'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
