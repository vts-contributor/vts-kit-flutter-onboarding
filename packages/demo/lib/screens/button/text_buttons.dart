import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';

class TextButtons extends StatefulWidget {
  @override
  _TextButtonsState createState() => _TextButtonsState();
}

class _TextButtonsState extends State<TextButtons>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: DemoAppbar(title: 'Text buttons'),
      body: ListView(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height - 140,
          child: ListView(
            children: <Widget>[
              DemoBox(
                title: 'DEFAULT',
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        VTSButton(
                          onPressed: () => {},
                          text: "Link text",
                          vtsType: VTSButtonType.LINK,
                        ),
                        VTSButton(
                          onPressed: () => {},
                          text: "Link text",
                          enabled: false,
                          vtsType: VTSButtonType.LINK,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              DemoBox(
                title: 'ICON & TEXT',
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        VTSButton(
                          onPressed: () => {},
                          text: "Button",
                          vtsType: VTSButtonType.TEXT,
                          icon: const Icon(Icons.add_box_sharp),
                        ),
                        VTSButton(
                          onPressed: () => {},
                          text: "Button",
                          vtsType: VTSButtonType.TEXT,
                          icon: const Icon(Icons.add_box_sharp),
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
      ]));
}
