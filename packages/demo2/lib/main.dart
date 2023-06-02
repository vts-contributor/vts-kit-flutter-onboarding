import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/ui_name.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/carousel_item.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/carousel_model.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/enum.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/icon_button.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/popup_item.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/sheet/lib/enum.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/sheet/lib/sheet_item.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/tooltip/lib/tooltip_item.dart';

import 'package:vts_kit_flutter_onboarding/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    ClientOption options = ClientOption(
        serverUrl: 'http://vtskit.atviettelsolutions.com/gateway/onboarding',
        applicationId: '54aaeb8f-eebb-4070-83ad-75bad2690e4b',
        debug: true,
        offline: false);
    OnboardingClient.initialize(options);
    OnboardingClient.onStateChange((state) => {print(state)});
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingProvider(
          child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();
  final GlobalKey _five = GlobalKey();
  final GlobalKey _six = GlobalKey();
  final GlobalKey _seven = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner : false,
        home: Scaffold(
            body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                OnboardingClient.start(
                    guideCode: "SHOW_1",
                    guideType: UIName.Popup,
                    context: context,
                    payload: _one);
              },
              child: const Text('Popup')),
          ElevatedButton(
              onPressed: () {
                OnboardingClient.start(
                    guideCode: "SHOW_2",
                    guideType: UIName.CAROUSEL,
                    context: context,
                    payload: _two);
              },
              child: const Text('Carousel')),

          ElevatedButton(onPressed: (){
            OnboardingClient.start(
                guideCode: "SHOW_3",
                guideType: UIName.Sheet,
                context: context,
                payload: _three);

          }, child: const Text('Sheet')),
          ElevatedButton(
              onPressed: () {
                OnboardingClient.start(
                    guideCode: "SHOW_3",
                    guideType: UIName.Tooltip,
                    context: context,
                    payload: [_four,_five,_six]);
              },
              child: const Text('ToolTip')),

          CarouselItem(
              key: _two,
              carouselData: const [
                CarouselModel(
                  title: 'Chào mừng bạn đến với Viettel-S',
                  description: 'Hệ thống tiếp nhận giải quyết góp ý,phản ánh hiện trường Viettel Solution',
                  imgUrl: 'images/anh1.png',
                ),
                CarouselModel(
                  title: 'Gửi phản ánh nhanh chóng',
                  description: 'Cho phép cá nhân, đơn vị gửi phản ánh, kiến nghị tới các phòng, trung tâm TCT phụ trách xử lý',
                  imgUrl: 'images/anh2.png',
                ),
                CarouselModel(
                  title: 'Thông tin truyền thông',
                  description: 'Cho phép xem tư liệu, ấn phẩm về các sản phẩm, dịch vụ nổi bật của TCT',
                  imgUrl: 'images/anh3.png',
                )
              ],
              footerWidget:Padding(
                padding: const EdgeInsets.only(top: 40,bottom: 30,left: 10,right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 350,
                      height: 40,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(color: Colors.red)
                                )
                            )
                          ),
                          onPressed: (){
                          },
                          child: const Text(
                              "Đăng nhập",style: TextStyle(color: Colors.white),
                          )
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: 350,
                      height: 40,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(color: Colors.red)
                                )
                            )
                          ),
                          onPressed: (){
                          },
                          child: const Text(
                              "Bỏ qua",style: TextStyle(color: Colors.red),
                          )
                      ),
                    ),
                  ],
                )
              ) ,
              skipButton: IconButton(
                  onPressed: () {
                    OnboardingClient.dismiss();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                )
          ),
          TooltipItem(
              key: _four,
              description: "hehe",
              child: const Text(
                'Ban nang 55 can:',
              )),
          TooltipItem(
              key: _five,
              description: "hehe",
              child: const Text(
                'Ban nang 55 can:',
              )),

          SheetItem(
              key: _three,
              animationDuration: const Duration(seconds: 1),
              direction: SheetDirection.bottom,
          ),
          PopupItem(
            key: _one,
            backgroundColor: Colors.white,
            msg:
                'Hệ thống tiếp nhận giải quyết góp ,phản ánh hiện trường Viettel-Solution',
            title: 'Chào mừng bạn đến với Viettel-S',
            image: "images/image.png",
            popupWidth: MediaQuery.of(context).size.width,
            insetPadding: EdgeInsets.zero,
            modeViewport: PopupViewport.half,
            context: context,
            footerWidget: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: IconsButton(
                      onPressed: () {
                        OnboardingClient.dismiss();
                      },
                      text: 'Bỏ qua',
                      color: Colors.white,
                      textStyle: const TextStyle(color: Colors.black),
                      iconColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: IconsButton(
                      onPressed: () {
                        OnboardingClient.dismiss();
                      },
                      text: 'Đăng ký',
                      color: Colors.black,
                      textStyle: const TextStyle(color: Colors.white),
                      iconColor: Colors.white,
                    ),
                  )

                ],
              ),
            )
            // actions: [
            //   IconsButton(
            //     onPressed: () {
            //       OnboardingClient.dismiss();
            //     },
            //     text: 'Test Bỏ qua',
            //     color: Colors.white,
            //     textStyle: const TextStyle(color: Colors.black),
            //     iconColor: Colors.white,
            //   ),
            //   IconsButton(
            //     onPressed: () {
            //       OnboardingClient.dismiss();
            //     },
            //     text: 'Test Đăng ký',
            //     color: Colors.black,
            //     textStyle: const TextStyle(color: Colors.white),
            //     iconColor: Colors.white,
            //   ),
            // ],
          ),
          TooltipItem(
              key: _six,
              description: "haha",
              child: const Text(
                'Ban cao 1m8:',
              )),
          TooltipItem(
              key: _seven,
              description: "haha",
              child: const Text(
                'Second:',
              )),

          // Text(
          //   '',
          //   style: Theme.of(context).textTheme.headline4,
          // ),
        ],
      ),
    )
            ));
  }
}
