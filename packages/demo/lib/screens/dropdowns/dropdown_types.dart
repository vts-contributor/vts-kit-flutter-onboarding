import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_list_tile.dart';
import 'package:vts_kit_flutter_onboarding_demo/screens/dropdowns/dropdown_multiple_select.dart';
import 'package:vts_kit_flutter_onboarding_demo/screens/dropdowns/dropdown_single_select.dart';

class DropdownTypes extends StatefulWidget {
  @override
  _DropdownTypesState createState() => _DropdownTypesState();
}

class _DropdownTypesState extends State<DropdownTypes> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Dropdowns'),
        body: ListView(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            DemoListTile(
              text: 'Standard dropdown',
              svgAssets: 'lib/assets/icons/standard_button.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          DropDownSingleSelect()),
                );
              },
            ),
            DemoListTile(
              text: 'Multiple select',
              svgAssets: 'lib/assets/icons/icon_button.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          DropDownMultipleSelect()),
                );
              },
            ),
          ],
        ),
      );
}
