import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vts_component/common/style/vts_common.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_box.dart';

class DropDownSingleSelect extends StatefulWidget {
  @override
  _DropDownSingleSelectState createState() => _DropDownSingleSelectState();
}

class CustomObject {
  final String label;
  final int code;
  final double extra;

  CustomObject({required this.label, required this.code, required this.extra});
}

class _DropDownSingleSelectState extends State<DropDownSingleSelect>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  List<CustomObject> list = [
    CustomObject(label: 'Option 1', code: 1, extra: 5.2),
    CustomObject(label: 'Option 2', code: 2, extra: 5.2),
    CustomObject(label: 'Option 3', code: 3, extra: 5.2),
    CustomObject(label: 'Option 4', code: 4, extra: 5.2),
    CustomObject(label: 'Option 5', code: 5, extra: 5.2),
    CustomObject(label: 'Option 6', code: 6, extra: 5.2),
    CustomObject(label: 'Option 7', code: 7, extra: 5.2),
    CustomObject(label: 'Option 8', code: 8, extra: 5.2),
  ];

  late List<VTSSelectItem> listObjectItem;
  late List<VTSSelectItem> listObjectItemDelayed = [];

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

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);

    listObjectItem = list
        .map((item) => VTSSelectObjectItem<CustomObject>(
            object: item,
            labelMappingFn: (i) => i.label,
            valueMappingFn: (i) => i.code))
        .toList();

    Future.delayed(Duration(seconds: 2)).then((value) => setState(() {
          listObjectItemDelayed = [...listObjectItem];
        }));

    value2 = listObjectItem[0];
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  int? value = 1;
  late VTSSelectItem value2;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: DemoAppbar(title: "Standard dropdown"),
      body: ListView(children: <Widget>[
        Container(
            child: VTSTabBar(
                tabController: tabController,
                content: [
                  VTSTabItem(text: 'BASIC'),
                  VTSTabItem(text: 'BOTTOM'),
                ],
                vtsType: VTSTabType.TOPBAR,
                isScrollable: true)),
        Container(
            height: MediaQuery.of(context).size.height - 140,
            child: VTSTabBarView(
                controller: tabController,
                height: 400,
                children: <Widget>[
                  ListView(
                    children: [
                      DemoBox(
                          margin: EdgeInsets.only(top: 8.0),
                          title: 'DEFAULT',
                          child: Column(children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 8.0),
                              child: Text('Label Name',
                                  style: VTSCommon.TEXT_STYLE_BODY_1_16),
                            ),
                            VTSSelect(
                              maxItemDropdown: 10,
                              items: listItem,
                              vtsSize: VTSFieldControlSize.SM,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 8.0, top: 24.0),
                              child: Text('Label Name',
                                  style: VTSCommon.TEXT_STYLE_BODY_1_16),
                            ),
                            VTSSelect(
                              maxItemDropdown: 10,
                              items: listObjectItemDelayed,
                              // value: value,
                              // onChange: (item) {setState(() {value = item; debugPrint(item.toString());});},
                            ),
                          ])),
                      DemoBox(
                          margin: EdgeInsets.only(top: 8.0),
                          title: 'DISABLE',
                          child: Column(children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 8.0),
                              child: Text('Label Name',
                                  style: VTSCommon.TEXT_STYLE_BODY_1_16),
                            ),
                            VTSSelect(
                              onChange: (item) {
                                debugPrint(item.toString());
                              },
                              maxItemDropdown: 10,
                              items: listItem,
                              vtsSize: VTSFieldControlSize.SM,
                              enabled: false,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 8.0, top: 24.0),
                              child: Text('Label Name',
                                  style: VTSCommon.TEXT_STYLE_BODY_1_16),
                            ),
                            VTSSelect(
                              onChange: (item) {
                                debugPrint(item.toString());
                              },
                              maxItemDropdown: 10,
                              items: listItem,
                              enabled: false,
                              vtsSize: VTSFieldControlSize.MD,
                            ),
                          ])),
                    ],
                  ),
                  ListView(
                    children: [
                      DemoBox(
                          margin: EdgeInsets.only(top: 8.0),
                          title: 'DEFAULT',
                          child: Column(children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 8.0),
                              child: Text('Label Name',
                                  style: VTSCommon.TEXT_STYLE_BODY_1_16),
                            ),
                            VTSSelect(
                              onChange: (item) {
                                debugPrint(item.toString());
                              },
                              maxItemDropdown: 20,
                              items: listItem,
                              vtsSize: VTSFieldControlSize.SM,
                              vtsType: VTSSelectType.BOTTOMSHEET,
                              bottomSheetLabel: "Label name",
                              searchPlaceholder: "Tìm kiếm",
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 8.0, top: 24.0),
                              child: Text('Label Name',
                                  style: VTSCommon.TEXT_STYLE_BODY_1_16),
                            ),
                            VTSSelect(
                              onChange: (item) {
                                debugPrint(item.toString());
                              },
                              maxItemDropdown: 10,
                              items: listItem,
                              vtsType: VTSSelectType.BOTTOMSHEET,
                              bottomSheetLabel: "Label name",
                              searchPlaceholder: "Tìm kiếm",
                            ),
                          ])),
                      DemoBox(
                          margin: EdgeInsets.only(top: 8.0),
                          title: 'DISABLE',
                          child: Column(children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 8.0),
                              child: Text('Label Name',
                                  style: VTSCommon.TEXT_STYLE_BODY_1_16),
                            ),
                            VTSSelect(
                              onChange: (item) {
                                debugPrint(item.toString());
                              },
                              maxItemDropdown: 10,
                              items: listItem,
                              vtsSize: VTSFieldControlSize.SM,
                              vtsType: VTSSelectType.BOTTOMSHEET,
                              bottomSheetLabel: "Label name",
                              searchPlaceholder: "Tìm kiếm",
                              enabled: false,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 8.0, top: 24.0),
                              child: Text('Label Name',
                                  style: VTSCommon.TEXT_STYLE_BODY_1_16),
                            ),
                            VTSSelect(
                              onChange: (item) {
                                debugPrint(item.toString());
                              },
                              maxItemDropdown: 10,
                              items: listItem,
                              vtsType: VTSSelectType.BOTTOMSHEET,
                              bottomSheetLabel: "Label name",
                              searchPlaceholder: "Tìm kiếm",
                              enabled: false,
                            ),
                          ])),
                    ],
                  ),
                ]))
      ]));
}
