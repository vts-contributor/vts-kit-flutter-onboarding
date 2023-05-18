import 'package:flutter/material.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_component/vts_component.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  TextEditingController controllerEn = TextEditingController();
  TextEditingController controllerDis = TextEditingController();
  GlobalKey<FormState>? viewKeyEnFirst = GlobalKey<FormState>();
  GlobalKey<FormState>? viewKeyEnSecond = GlobalKey<FormState>();
  GlobalKey<FormState>? viewKeyEnThird = GlobalKey<FormState>();
  GlobalKey<FormState>? viewKeyDisFirst = GlobalKey<FormState>();
  GlobalKey<FormState>? viewKeyDisSecond = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    controllerEn.text = 'Thiết kế';
    controllerDis.text = 'Thiết kế giao diện';
    return Scaffold(
      appBar: DemoAppbar(title: 'TextField'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Text(
                      'DEFAULT',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 17.0),
                  VTSTextField(
                    keyVTS: viewKeyEnFirst,
                  ),
                  SizedBox(height: 24.0),
                  VTSTextField(
                    keyVTS: viewKeyEnSecond,
                    controller: controllerEn,
                  ),
                  SizedBox(height: 24.0),
                  VTSTextField(
                    keyVTS: viewKeyEnThird,
                    autovalidateMode: AutovalidateMode.always,
                  ),

                  // MyCustomForm(),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: Text(
                      'DISABLE',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 17.0),
                  VTSTextField(
                    enabled: false,
                    keyVTS: viewKeyDisFirst,
                    controller: controllerDis,
                  ),
                  SizedBox(height: 24.0),
                  VTSTextField(
                    enabled: false,
                    keyVTS: viewKeyDisSecond,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
