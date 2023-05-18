import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vts_component/vts_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';

class TogglesPage extends StatefulWidget {
  @override
  _TogglesState createState() => _TogglesState();
}

class _TogglesState extends State<TogglesPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Toggle'),
        body: Container(
          child: Column(
            children: <Widget>[
              DemoBox(
                title: "WHITE BACKGROUND",
                background: VTSColors.TRANSPARENT,
                padding: EdgeInsets.zero,
                child: VTSCard(
                  header: SizedBox.shrink(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 34.0, vertical: 36.0),
                  body: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      VTSToggle(
                        onChanged: (val) {
                          print('toggle: $val');
                        },
                        value: false,
                        activeTrackColor: VTSColors.FUNC_GREEN_2,
                      ),
                      VTSToggle(
                        onChanged: (val) {
                          print('toggle: $val');
                        },
                        value: false,
                        enabled: false,
                      ),
                      VTSToggle(
                        onChanged: (val) {
                          print('toggle: $val');
                        },
                        value: false,
                        vtsType: VTSToggleType.MATERIAL,
                        activeTrackColor: VTSColors.FUNC_GREEN_2,
                      ),
                      VTSToggle(
                        onChanged: (val) {
                          print('toggle: $val');
                        },
                        value: false,
                        vtsType: VTSToggleType.MATERIAL,
                        enabled: false,
                      ),
                    ],
                  ),
                ),
              ),
              DemoBox(
                title: "RED BACKGROUND",
                background: VTSColors.TRANSPARENT,
                padding: EdgeInsets.zero,
                child: VTSCard(
                  background: VTSColors.PRIMARY_0,
                  header: SizedBox.shrink(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 34.0, vertical: 36.0),
                  body: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      VTSToggle(
                        onChanged: (val) {
                          print('toggle: $val');
                        },
                        value: false,
                        inactiveTrackColor: VTSColors.FUNC_RED_1,
                        activeTrackColor: VTSColors.FUNC_RED_4,
                      ),
                      VTSToggle(
                        onChanged: (val) {
                          print('toggle: $val');
                        },
                        value: false,
                        enabled: false,
                        disabledThumbColor: VTSColors.PRIMARY_2,
                        disabledTrackColor: VTSColors.FUNC_RED_2,
                      ),
                      VTSToggle(
                        onChanged: (val) {
                          print('toggle: $val');
                        },
                        value: false,
                        vtsType: VTSToggleType.MATERIAL,
                        inactiveTrackColor: VTSColors.FUNC_RED_1,
                        activeTrackColor: VTSColors.FUNC_RED_4,
                      ),
                      VTSToggle(
                        onChanged: (val) {
                          print('toggle: $val');
                        },
                        value: false,
                        vtsType: VTSToggleType.MATERIAL,
                        disabledThumbColor: VTSColors.PRIMARY_2,
                        disabledTrackColor: VTSColors.FUNC_RED_2,
                        enabled: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
