import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_subtitle.dart';

class SocialButtons extends StatefulWidget {
  @override
  _SocialButtonsState createState() => _SocialButtonsState();
}

class _SocialButtonsState extends State<SocialButtons> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Social buttons'),
        body: ListView(
          children: <Widget>[
            DemoBox(
                title: 'SOCIAL BUTTONS FULL',
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DemoSubtitle(title: 'Size S'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          VTSButton(
                            background: const Color(0xFF3B5998),
                            onPressed: () {},
                            child: const Text('Facebook'),
                            icon: const Icon(FontAwesomeIcons.facebookF),
                            vtsSize: VTSButtonSize.SM,
                            width: 147,
                          ),
                          VTSButton(
                            background: const Color(0xFF00ACEE),
                            onPressed: () {},
                            child: const Text('Tweeter'),
                            icon: const Icon(FontAwesomeIcons.twitter),
                            vtsSize: VTSButtonSize.SM,
                            width: 147,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          VTSButton(
                            background: const Color(0xFF25D366),
                            onPressed: () {},
                            child: const Text('Whatsapp'),
                            icon: const Icon(FontAwesomeIcons.whatsapp),
                            vtsSize: VTSButtonSize.SM,
                            width: 147,
                          ),
                          VTSButton(
                            boxDecoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Color(0xFFE8002A),
                              Color(0xFFC2009C)
                            ])),
                            background: VTSColors.TRANSPARENT,
                            onPressed: () {},
                            child: const Text('Instagram'),
                            icon: const Icon(FontAwesomeIcons.instagram),
                            vtsSize: VTSButtonSize.SM,
                            width: 147,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          VTSButton(
                            background: const Color(0xFF0E76A8),
                            onPressed: () {},
                            child: const Text('LinkedIn'),
                            icon: const Icon(FontAwesomeIcons.linkedinIn),
                            vtsSize: VTSButtonSize.SM,
                            width: 147,
                          ),
                          VTSButton(
                            background: const Color(0xFFDD4B39),
                            onPressed: () {},
                            child: const Text('Google+'),
                            icon: const Icon(FontAwesomeIcons.google),
                            vtsSize: VTSButtonSize.SM,
                            width: 147,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          VTSButton(
                            background: const Color(0xFFC4302B),
                            onPressed: () {},
                            child: const Text('Youtube'),
                            icon: const Icon(FontAwesomeIcons.youtube),
                            vtsSize: VTSButtonSize.SM,
                            width: 147,
                          ),
                          VTSButton(
                            background: const Color(0xFF00AFF0),
                            onPressed: () {},
                            child: const Text('Skype'),
                            icon: const Icon(FontAwesomeIcons.skype),
                            vtsSize: VTSButtonSize.SM,
                            width: 147,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          VTSButton(
                            background: const Color(0xFF4B144B),
                            onPressed: () {},
                            child: const Text('Slack'),
                            icon: const Icon(FontAwesomeIcons.slack),
                            vtsSize: VTSButtonSize.SM,
                            width: 147,
                          ),
                          VTSButton(
                            background: const Color(0xFF7B549C),
                            onPressed: () {},
                            child: const Text('Viber'),
                            icon: const Icon(FontAwesomeIcons.viber),
                            vtsSize: VTSButtonSize.SM,
                            width: 147,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          VTSButton(
                            background: const Color(0xFFE30B2C),
                            onPressed: () {},
                            child: const Text('Pinterest'),
                            icon: const Icon(FontAwesomeIcons.pinterest),
                            vtsSize: VTSButtonSize.SM,
                            width: 147,
                          ),
                          VTSButton(
                            background: const Color(0xFFEA4C89),
                            onPressed: () {},
                            child: const Text('Dribble'),
                            icon: const Icon(FontAwesomeIcons.dribbble),
                            vtsSize: VTSButtonSize.SM,
                            width: 147,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: VTSButton(
                              background: const Color(0xFFDD4B39),
                              onPressed: () {},
                              child: const Text('Google+'),
                              icon: const Icon(FontAwesomeIcons.google),
                              vtsSize: VTSButtonSize.SM,
                              blockButton: true,
                            ))
                          ]),
                      const SizedBox(
                        height: 16,
                      ),
                      DemoSubtitle(top: 32, title: 'Size M'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          VTSButton(
                            background: const Color(0xFF3B5998),
                            onPressed: () {},
                            child: const Text('Facebook'),
                            icon: const Icon(FontAwesomeIcons.facebookF),
                            width: 164,
                          ),
                          VTSButton(
                            background: const Color(0xFF00ACEE),
                            onPressed: () {},
                            child: const Text('Tweeter'),
                            icon: const Icon(FontAwesomeIcons.twitter),
                            width: 164,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          VTSButton(
                            background: const Color(0xFF25D366),
                            onPressed: () {},
                            child: const Text('Whatsapp'),
                            icon: const Icon(FontAwesomeIcons.whatsapp),
                            width: 164,
                          ),
                          VTSButton(
                            boxDecoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Color(0xFFE8002A),
                              Color(0xFFC2009C)
                            ])),
                            background: VTSColors.TRANSPARENT,
                            onPressed: () {},
                            child: const Text('Instagram'),
                            icon: const Icon(FontAwesomeIcons.instagram),
                            width: 164,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          VTSButton(
                            background: const Color(0xFF0E76A8),
                            onPressed: () {},
                            child: const Text('LinkedIn'),
                            icon: const Icon(FontAwesomeIcons.linkedinIn),
                            width: 164,
                          ),
                          VTSButton(
                            background: const Color(0xFFDD4B39),
                            onPressed: () {},
                            child: const Text('Google+'),
                            icon: const Icon(FontAwesomeIcons.google),
                            width: 164,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          VTSButton(
                            background: const Color(0xFFC4302B),
                            onPressed: () {},
                            child: const Text('Youtube'),
                            icon: const Icon(FontAwesomeIcons.youtube),
                            width: 164,
                          ),
                          VTSButton(
                            background: const Color(0xFF00AFF0),
                            onPressed: () {},
                            child: const Text('Skype'),
                            icon: const Icon(FontAwesomeIcons.skype),
                            width: 164,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          VTSButton(
                            background: const Color(0xFF4B144B),
                            onPressed: () {},
                            child: const Text('Slack'),
                            icon: const Icon(FontAwesomeIcons.slack),
                            width: 164,
                          ),
                          VTSButton(
                            background: const Color(0xFF7B549C),
                            onPressed: () {},
                            child: const Text('Viber'),
                            icon: const Icon(FontAwesomeIcons.viber),
                            width: 164,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          VTSButton(
                            background: const Color(0xFFE30B2C),
                            onPressed: () {},
                            child: const Text('Pinterest'),
                            icon: const Icon(FontAwesomeIcons.pinterest),
                            width: 164,
                          ),
                          VTSButton(
                            background: const Color(0xFFEA4C89),
                            onPressed: () {},
                            child: const Text('Dribble'),
                            icon: const Icon(FontAwesomeIcons.dribbble),
                            width: 164,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: VTSButton(
                              background: const Color(0xFFDD4B39),
                              onPressed: () {},
                              child: const Text('Google+'),
                              icon: const Icon(FontAwesomeIcons.google),
                              blockButton: true,
                            ))
                          ]),
                    ])),
            DemoBox(
              title: 'SOCIAL BUTTONS ICON',
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        icon: const Icon(FontAwesomeIcons.facebookF),
                        background: const Color(0xFF3B5998),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        icon: const Icon(FontAwesomeIcons.twitter),
                        background: const Color(0xFF00ACEE),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        icon: const Icon(FontAwesomeIcons.whatsapp),
                        background: const Color(0xFF25D366),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        icon: const Icon(FontAwesomeIcons.instagram),
                        background: VTSColors.TRANSPARENT,
                        boxDecoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFFE8002A), Color(0xFFC2009C)]),
                            shape: BoxShape.rectangle),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        icon: const Icon(FontAwesomeIcons.linkedinIn),
                        background: const Color(0xFF0E76A8),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        icon: const Icon(FontAwesomeIcons.google),
                        background: const Color(0xFFDD4B39),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        icon: const Icon(FontAwesomeIcons.youtube),
                        background: const Color(0xFFFB0D1B),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        icon: const Icon(FontAwesomeIcons.skype),
                        background: const Color(0xFF00AFF0),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        icon: const Icon(FontAwesomeIcons.slack),
                        background: const Color(0xFF4B144B),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        icon: const Icon(FontAwesomeIcons.viber),
                        background: const Color(0xFF7B549C),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        icon: const Icon(FontAwesomeIcons.pinterest),
                        background: const Color(0xFFE30B2C),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        icon: const Icon(FontAwesomeIcons.dribbble),
                        background: const Color(0xFFEA4C89),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        vtsShape: VTSButtonShape.CIRCLE,
                        icon: const Icon(FontAwesomeIcons.facebookF),
                        background: const Color(0xFF3B5998),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        vtsShape: VTSButtonShape.CIRCLE,
                        icon: const Icon(FontAwesomeIcons.twitter),
                        background: const Color(0xFF00ACEE),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        vtsShape: VTSButtonShape.CIRCLE,
                        icon: const Icon(FontAwesomeIcons.whatsapp),
                        background: const Color(0xFF25D366),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        vtsShape: VTSButtonShape.CIRCLE,
                        icon: const Icon(FontAwesomeIcons.instagram),
                        background: VTSColors.TRANSPARENT,
                        boxDecoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFFE8002A), Color(0xFFC2009C)]),
                            shape: BoxShape.circle),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        vtsShape: VTSButtonShape.CIRCLE,
                        icon: const Icon(FontAwesomeIcons.linkedinIn),
                        background: const Color(0xFF0E76A8),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        vtsShape: VTSButtonShape.CIRCLE,
                        icon: const Icon(FontAwesomeIcons.google),
                        background: const Color(0xFFDD4B39),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        vtsShape: VTSButtonShape.CIRCLE,
                        icon: const Icon(FontAwesomeIcons.youtube),
                        background: const Color(0xFFFB0D1B),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        vtsShape: VTSButtonShape.CIRCLE,
                        icon: const Icon(FontAwesomeIcons.skype),
                        background: const Color(0xFF00AFF0),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        vtsShape: VTSButtonShape.CIRCLE,
                        icon: const Icon(FontAwesomeIcons.slack),
                        background: const Color(0xFF4B144B),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        vtsShape: VTSButtonShape.CIRCLE,
                        icon: const Icon(FontAwesomeIcons.viber),
                        background: const Color(0xFF7B549C),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        vtsShape: VTSButtonShape.CIRCLE,
                        icon: const Icon(FontAwesomeIcons.pinterest),
                        background: const Color(0xFFE30B2C),
                      ),
                      SizedBox(height: 8),
                      VTSButton(
                        onPressed: () => {},
                        vtsSize: VTSButtonSize.MD,
                        vtsShape: VTSButtonShape.CIRCLE,
                        icon: const Icon(FontAwesomeIcons.dribbble),
                        background: const Color(0xFFEA4C89),
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
