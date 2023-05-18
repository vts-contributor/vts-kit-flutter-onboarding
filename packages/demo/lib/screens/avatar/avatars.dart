import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';

class AvatarPage extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<AvatarPage> {
  bool showToast = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Avatar'),
        body: Column(
          children: <Widget>[
            DemoBox(
              title: 'BASIC AVATAR',
              child: Column(
                children: <Widget>[
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      VTSAvatar(
                        imageProvider: AssetImage(
                            'lib/assets/images/default-avatar-1.png'),
                        vtsShape: VTSAvatarShape.CIRCLE,
                      ),
                      VTSAvatar(
                        imageProvider: AssetImage(
                            'lib/assets/images/default-avatar-2.png'),
                        vtsShape: VTSAvatarShape.CIRCLE,
                      ),
                      VTSAvatar(
                        imageProvider:
                            AssetImage('lib/assets/images/exam-avatar-1.png'),
                        vtsShape: VTSAvatarShape.CIRCLE,
                      ),
                      VTSAvatar(
                        imageProvider:
                            AssetImage('lib/assets/images/exam-avatar-2.png'),
                        vtsShape: VTSAvatarShape.CIRCLE,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      VTSAvatar(
                        imageProvider: AssetImage(
                            'lib/assets/images/default-avatar-1.png'),
                      ),
                      VTSAvatar(
                        imageProvider: AssetImage(
                            'lib/assets/images/default-avatar-2.png'),
                      ),
                      VTSAvatar(
                        imageProvider:
                            AssetImage('lib/assets/images/exam-avatar-3.png'),
                      ),
                      VTSAvatar(
                        imageProvider:
                            AssetImage('lib/assets/images/exam-avatar-4.png'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      VTSAvatar(
                          imageProvider: AssetImage(
                              'lib/assets/images/default-avatar-1.png'),
                          vtsShape: VTSAvatarShape.SQUARE),
                      VTSAvatar(
                          imageProvider: AssetImage(
                              'lib/assets/images/default-avatar-2.png'),
                          vtsShape: VTSAvatarShape.SQUARE),
                      VTSAvatar(
                          imageProvider:
                              AssetImage('lib/assets/images/exam-avatar-5.png'),
                          vtsShape: VTSAvatarShape.SQUARE),
                      VTSAvatar(
                          imageProvider:
                              AssetImage('lib/assets/images/exam-avatar-6.png'),
                          vtsShape: VTSAvatarShape.SQUARE),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
