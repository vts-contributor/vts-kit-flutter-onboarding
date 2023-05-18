import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';

class ImagesPage extends StatefulWidget {
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<ImagesPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Images'),
        body: ListView(
          children: <Widget>[
            Container(
                child: VTSTabBar(
                    tabController: tabController,
                    content: [
                      VTSTabItem(text: 'BASIC'),
                      VTSTabItem(text: 'CIRCULAR'),
                      VTSTabItem(text: 'OVERLAYS'),
                    ],
                    vtsType: VTSTabType.TOPBAR,
                    isScrollable: true)),
            Container(
              height: MediaQuery.of(context).size.height - 140,
              child: VTSTabBarView(
                controller: tabController,
                children: <Widget>[
                  ListView(
                    children: [
                      VTSImage(
                        height: 209,
                        margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                        boxFit: BoxFit.fitWidth,
                        imageProvider:
                            AssetImage('lib/assets/images/image-1.png'),
                      ),
                      VTSImage(
                        height: 209,
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        boxFit: BoxFit.fitWidth,
                        imageProvider:
                            AssetImage('lib/assets/images/image-2.png'),
                      ),
                      VTSImage(
                        height: 209,
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        boxFit: BoxFit.fitWidth,
                        imageProvider:
                            AssetImage('lib/assets/images/image-3.png'),
                      ),
                    ],
                  ),
                  ListView(
                    children: [
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          VTSImage(
                            height: 93,
                            vtsShape: VTSImageShape.CIRCLE,
                            imageProvider:
                                AssetImage('lib/assets/images/image-4.png'),
                          ),
                          VTSImage(
                            height: 93,
                            vtsShape: VTSImageShape.CIRCLE,
                            imageProvider:
                                AssetImage('lib/assets/images/image-5.png'),
                          ),
                          VTSImage(
                            height: 93,
                            vtsShape: VTSImageShape.CIRCLE,
                            imageProvider:
                                AssetImage('lib/assets/images/image-6.png'),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          VTSImage(
                            height: 72,
                            vtsShape: VTSImageShape.CIRCLE,
                            imageProvider:
                                AssetImage('lib/assets/images/image-7.png'),
                          ),
                          VTSImage(
                            height: 72,
                            vtsShape: VTSImageShape.CIRCLE,
                            imageProvider:
                                AssetImage('lib/assets/images/image-8.png'),
                          ),
                          VTSImage(
                            height: 72,
                            vtsShape: VTSImageShape.CIRCLE,
                            imageProvider:
                                AssetImage('lib/assets/images/image-9.png'),
                          ),
                          VTSImage(
                            height: 72,
                            vtsShape: VTSImageShape.CIRCLE,
                            imageProvider:
                                AssetImage('lib/assets/images/image-10.png'),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          VTSImage(
                            height: 164,
                            vtsShape: VTSImageShape.CIRCLE,
                            imageProvider:
                                AssetImage('lib/assets/images/image-11.png'),
                          ),
                          VTSImage(
                            height: 164,
                            vtsShape: VTSImageShape.CIRCLE,
                            imageProvider:
                                AssetImage('lib/assets/images/image-12.png'),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          VTSImage(
                            height: 128,
                            vtsShape: VTSImageShape.CIRCLE,
                            imageProvider:
                                AssetImage('lib/assets/images/image-13.png'),
                          ),
                          VTSImage(
                            height: 128,
                            vtsShape: VTSImageShape.CIRCLE,
                            imageProvider:
                                AssetImage('lib/assets/images/image-14.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ListView(
                    children: [
                      VTSImage(
                        height: 209,
                        margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                        boxFit: BoxFit.fitWidth,
                        imageProvider:
                            AssetImage('lib/assets/images/image-15.png'),
                        child: Text('Light Overlay',
                            style: TextStyle(
                                color: VTSColors.WHITE_1,
                                fontFamily: 'Sarabun',
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal)),
                        alignment: Alignment.center,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.20), BlendMode.darken),
                      ),
                      VTSImage(
                        height: 209,
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        boxFit: BoxFit.fitWidth,
                        imageProvider:
                            AssetImage('lib/assets/images/image-16.png'),
                        child: Text('Medium Overlay',
                            style: TextStyle(
                                color: VTSColors.WHITE_1,
                                fontFamily: 'Sarabun',
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal)),
                        alignment: Alignment.center,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.50), BlendMode.darken),
                      ),
                      VTSImage(
                        height: 209,
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        boxFit: BoxFit.fitWidth,
                        imageProvider:
                            AssetImage('lib/assets/images/image-17.png'),
                        child: Text('Dark Overlay',
                            style: TextStyle(
                                color: VTSColors.WHITE_1,
                                fontFamily: 'Sarabun',
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal)),
                        alignment: Alignment.center,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.70), BlendMode.darken),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
