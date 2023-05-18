import 'package:flutter/material.dart';
import 'package:vts_component/common/style/vts_color.dart';
import 'package:vts_component/components/radio_button/typings.dart';
import 'package:vts_component/components/radio_button/vts_radio_button.dart';

import '../../components/demo_appbar.dart';
import '../../components/demo_box.dart';

class RadioButtonPage extends StatefulWidget{
  const RadioButtonPage({Key? key}) : super(key: key);


  @override
  State<RadioButtonPage> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButtonPage>{
  bool checkValidate = false;
  int groupValue = 0;
  int requireSelect = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DemoAppbar(title: 'RadioButton'),
        body: DemoBox(
          title: 'BASIC RADIO BUTTON',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: VTSRadioButton(
                      vtsType: VTSRadioButtonType.BASIC,
                      size: VTSRadioButtonSize.MD,
                      value: 0,
                      groupValue: groupValue,
                      onChanged: (dynamic val) {
                        setState(() {
                          groupValue = val;
                        });
                      },
                    ),
                  ),
                  Container(
                    child: VTSRadioButton(
                      vtsType: VTSRadioButtonType.BASIC,
                      size: VTSRadioButtonSize.MD,
                      value: 1,
                      groupValue: groupValue,
                      onChanged: (dynamic val) {
                        setState(() {
                          groupValue = val;
                        });
                      },
                    ),
                  ),
                  Container(
                    child: VTSRadioButton(
                      vtsType: VTSRadioButtonType.BASIC,
                      size: VTSRadioButtonSize.MD,
                      value: 2,
                      groupValue: groupValue,
                      onChanged: (dynamic val) {
                        setState(() {
                          groupValue = val;
                        });
                      },
                    ),
                  ),
                  Container(
                    child: VTSRadioButton(
                      vtsType: VTSRadioButtonType.BASIC,
                      size: VTSRadioButtonSize.MD,
                      value: 3,
                      groupValue: groupValue,
                      onChanged: (dynamic val) {
                        setState(() {
                          groupValue = val;
                        });
                      },
                    ),
                  ),
                  Container(
                    child: VTSRadioButton(
                      vtsType: VTSRadioButtonType.BASIC,
                      size: VTSRadioButtonSize.MD,
                      value: 4,
                      groupValue: groupValue,
                      onChanged: (dynamic val) {
                        setState(() {
                          checkValidate = false;
                          groupValue = val;
                        });
                      },
                    ),
                  ),
                  Container(
                    child: VTSRadioButton(
                      vtsType: VTSRadioButtonType.BASIC,
                      size: VTSRadioButtonSize.MD,
                      value: 5,
                      validate: checkValidate,
                      groupValue: groupValue,
                      onChanged: (dynamic val) {
                        setState(() {
                          checkValidate = false;
                          groupValue = val;
                        });
                      },
                    ),
                  ),

                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: VTSColors.PRIMARY_1
                    ),
                    onPressed: (){
                      setState(() {
                        checkValidate = requireSelect != groupValue;
                      });
                    }, child: const Text("Check validate",style: TextStyle(fontSize: 15),)),)
            ],
          ),
        )
    );
  }

}