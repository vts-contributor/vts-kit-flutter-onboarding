import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'dart:async';

import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';

class ToastsPage extends StatefulWidget {
  @override
  _ToastsState createState() => _ToastsState();
}

class _ToastsState extends State<ToastsPage> {
  bool showFloatingToast = false;
  Timer? autoTimer;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: DemoAppbar(title: 'Toast'),
      body: ListView(
        children: [
          DemoBox(
              title: 'BASIC TOASTS',
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  VTSToast(
                    text: 'Paired succesfully!',
                    cancelText: 'OK',
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  VTSToast(
                    text:
                        'Lorem ipsum dolor sit amet libary, conseo ctu adipis scling elit.',
                    autoDismiss: true,
                    dismissDuration: Duration(seconds: 3),
                    cancelText: 'OK',
                  )
                ],
              )),
          DemoBox(
              title: 'FULL WIDTH TOASTS',
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  VTSToast(
                    text: 'Paired succesfully!',
                    vtsType: VTSToastType.FULL_WIDTH,
                    cancelText: 'OK',
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  VTSToast(
                    text:
                        'Lorem ipsum dolor sit amet libary, conseo ctu adipis scling elit.',
                    vtsType: VTSToastType.FULL_WIDTH,
                    cancelText: 'OK',
                  )
                ],
              ))
        ],
      ));
}
