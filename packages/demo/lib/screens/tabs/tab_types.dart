import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_kit_flutter_onboarding/core/client.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/ui_name.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/enum.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/popup_item.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_list_tile.dart';
import 'bottom_label_tab.dart';
import 'bottom_icon_tab.dart';
import 'icon_tabs.dart';
import 'labeled_tabs.dart';
import 'segment_tabs.dart';

class TabTypes extends StatefulWidget {
  @override
  _TabTypesState createState() => _TabTypesState();
}

class _TabTypesState extends State<TabTypes> {
  final _seven = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      OnboardingClient.start(
          context: context,
          guideCode: 'SHOW_2',
          guideType: UIName.Popup,
          payload: _seven
      );
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Tabs'),
        body: ListView(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            DemoListTile(
              text: 'Segmented tabs',
              svgAssets: 'lib/assets/icons/segment_tab.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SegmentTabsPage()),
                );
              },
            ),
            DemoListTile(
              text: 'Icon tabs',
              svgAssets: 'lib/assets/icons/icon_tab.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => IconTabs()),
                );
              },
            ),
            DemoListTile(
              text: 'Labeled tabs',
              svgAssets: 'lib/assets/icons/labeled_tab.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LabeledTabs()),
                );
              },
            ),
            DemoListTile(
              text: 'Bottom icon tabs',
              svgAssets: 'lib/assets/icons/bottom_icon_tab.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => BottomIconTab()),
                );
              },
            ),
            DemoListTile(
              text: 'Bottom labeled tabs',
              svgAssets: 'lib/assets/icons/bottom_labeled_tab.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => BottomLabelTab()),
                );
              },
            ),
            PopupItem(
                key: _seven,
                backgroundColor: Colors.white,
                msg:
                'Hệ thống tiếp nhận giải quyết góp ,phản ánh hiện trường Viettel-Solution',
                title: 'Chào mừng bạn đến với Viettel-S',
                image: "images/image.png",
                popupWidth: MediaQuery.of(context).size.width,
                insetPadding: EdgeInsets.symmetric(horizontal: 20),
                modeViewport: PopupViewport.half,
                context: context,
                footerWidget: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            OnboardingClient.dismiss();
                            const snackBar = SnackBar(
                              content: Center(
                                child: Text('Bỏ qua'),
                              )
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                          style:
                          ButtonStyle(
                            backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          child: const Text( 'Bỏ qua',style:  TextStyle(color: Colors.black87)),
                        )
                      ),
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            OnboardingClient.dismiss();
                            const snackBar = SnackBar(
                              content: Center(
                                child: Text('Đăng ký')
                              ) ,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                          style:
                          ButtonStyle(
                            backgroundColor:  MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          child: const Text('Đăng ký',style:  TextStyle(color: Colors.white)),
                        ),
                      )

                    ],
                  ),
                )
            ),
          ],
        ),
      );
}
