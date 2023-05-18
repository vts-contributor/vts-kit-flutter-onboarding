import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';

class TilesPage extends StatefulWidget {
  @override
  _TilesPageState createState() => _TilesPageState();
}

class _TilesPageState extends State<TilesPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Tiles'),
        body: ListView(
          children: <Widget>[
            DemoBox(
              title: 'WITH LABEL',
            ),
            VTSTile(
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
              titleText: 'Card title',
              subTitleText: 'Lorem ipsum dolor sit.',
              description: Icon(Icons.favorite),
              descriptionAlignment: Alignment.centerRight,
            ),
            VTSTile(
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
              titleText: 'Card title',
              titleIcon: Icon(Icons.notifications),
              descriptionText: 'Lorem Ipsum',
              descriptionAlignment: Alignment.centerRight,
            ),
            DemoBox(
              title: 'WITH AVATAR',
            ),
            VTSTile(
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
              titleText: 'Card title',
              subTitleText: 'Sub Title',
              imageProvider:
                  AssetImage('lib/assets/images/default-avatar-1.png'),
            ),
            VTSTile(
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
              titleText: 'Card title',
              imageProvider:
                  AssetImage('lib/assets/images/default-avatar-2.png'),
              imageShape: VTSAvatarShape.STANDARD,
              descriptionText: 'Lorem Ipsum',
              descriptionAlignment: Alignment.centerRight,
            ),
          ],
        ),
      );
}
