import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';

class SearchbarPage extends StatefulWidget {
  @override
  _SearchbarPageState createState() => _SearchbarPageState();
}

class CustomObject {
  final String label;
  final int code;
  final double extra;

  CustomObject({required this.label, required this.code, required this.extra});
}

class _SearchbarPageState extends State<SearchbarPage> {
  List<CustomObject> list = Iterable<int>.generate(3500).map((e) {
    return CustomObject(
        label: 'Custom Option ' + e.toString(), code: e, extra: 0.0);
  }).toList();

  final listItem = VTSSelectClassicItem.fromListString([
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4",
    "Option 5",
    "Option 6",
    "Option 7",
    "Option 8",
    "Option 9",
    "Option 10",
    "Option 11",
    "Option 12",
  ]);

  late List<VTSSelectItem> listObjectItemDelayed = [];

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) => setState(() {
          listObjectItemDelayed = [...listItem];
        }));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: DemoAppbar(title: 'Search bar'),
      body: ListView(padding: EdgeInsets.zero, children: [
        DemoBox(
            title: 'BASIC SEARCH',
            child: Container(
              margin: EdgeInsets.only(top: 8.0),
              child: VTSSearchBar(
                items: list
                    .map((e) => VTSSelectObjectItem<CustomObject>(
                          object: e,
                          labelMappingFn: (item) => item.label,
                          valueMappingFn: (item) => item.code,
                        ))
                    .toList(),
                showAlways: true,
                onSubmit: (value) {
                  debugPrint(value);
                },
                placeholder: "Tìm kiếm",
                onSelectChangeReturnObject: true,
                onInputChange: (item) {
                  debugPrint(item);
                },
                onSelectChange: (item) {
                  debugPrint(item.object.extra.toString());
                },
              ),
            )),
        DemoBox(
          title: 'CUSTOMIZED SEARCH BAR',
          child: Container(
            margin: EdgeInsets.only(top: 8.0),
            child: VTSSearchBar(
              maxItemDropdown: 10,
              items: listObjectItemDelayed,
              showAlways: true,
              onSubmit: (value) {
                debugPrint(value);
              },
              placeholder: "Tìm kiếm",
              borderRadius: BorderRadius.circular(50.0),
              prefixIcon: Icon(Icons.person, color: VTSColors.PRIMARY_1),
              emptyLabel: 'Không có gợi ý',
              onFocus: ((focus) => debugPrint(focus.toString())),
              emptyLabelTextStyle: TextStyle(color: VTSColors.FUNC_RED_1),
            ),
          ),
        )
      ]));
}
