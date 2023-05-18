import 'package:flutter/material.dart';
import 'package:vts_component/common/style/vts_color.dart';
import 'package:vts_component/components/button/index.dart';
import 'package:vts_component/components/checkbox/typings.dart';
import 'package:vts_component/components/checkbox/vts_checkbox.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';

import '../../components/demo_appbar.dart';

class CheckBoxPage extends StatefulWidget {
  const CheckBoxPage({Key? key}) : super(key: key);

  @override
  State<CheckBoxPage> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxPage> {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool checkValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DemoAppbar(title: 'Checkbox'),
        body: DemoBox(
            title: 'BASIC CHECKBOX',
            child: Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: VTSCheckBox(
                        vtsType: VTSCheckboxType.BASIC,
                        icon: Icons.add,
                        // errorMargin : 50,
                        title: "Checkbox",
                        errorMessage: "Error message",
                        onChanged: (bool value) {
                          setState(() {
                            value1 = value;
                            if (value1) {
                              checkValidate = false;
                            }
                          });
                        },
                        activeBgColor: Colors.blue,
                        inactiveBgColor: Colors.white,
                        alertColor: Colors.red,
                        value: value1,
                        size: VTSCheckboxSize.MD,
                        validate: checkValidate,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: VTSCheckBox(
                        vtsType: VTSCheckboxType.BASIC,
                        title: "Checkbox",
                        onChanged: (bool value) {
                          setState(() {
                            value2 = value;
                            // alert = !value;
                          });
                        },
                        value: value2,
                        size: VTSCheckboxSize.MD,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: VTSCheckBox(
                        vtsType: VTSCheckboxType.BASIC,
                        title: "Checkbox",
                        onChanged: (bool value) {
                          setState(() {
                            value3 = value;
                          });
                        },
                        value: value3,
                        size: VTSCheckboxSize.MD,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: VTSCheckBox(
                        vtsType: VTSCheckboxType.BASIC,
                        title: "Checkbox",
                        onChanged: (bool value) {
                          setState(() {
                            value4 = value;
                            // alert = !value;
                          });
                        },
                        value: value4,
                        size: VTSCheckboxSize.MD,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: VTSCheckBox(
                        vtsType: VTSCheckboxType.BASIC,
                        title: "Checkbox",
                        onChanged: (bool value) {
                          setState(() {
                            value5 = value;
                          });
                        },
                        value: value5,
                        size: VTSCheckboxSize.MD,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: VTSCheckBox(
                        vtsType: VTSCheckboxType.BASIC,
                        title: "Checkbox",
                        onChanged: (bool value) {
                          setState(() {
                            value6 = value;
                          });
                        },
                        value: value6,
                        size: VTSCheckboxSize.MD,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: VTSColors.PRIMARY_1),
                          onPressed: () {
                            if (value1 == false) {
                              setState(() {
                                checkValidate = true;
                              });
                            }
                          },
                          child: Text(
                            "Check validate",
                            style: TextStyle(fontSize: 15),
                          )),
                    )
                  ],
                ),
              ),
            )));
  }
}
