import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/ui_name.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/carousel_item.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/carousel_model.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/page_indicator_style_model.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/tooltip/lib/tooltip_item.dart';

import 'package:vts_kit_flutter_onboarding/index.dart';

void main() {
  runApp(MyApp());
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
        applicationId: '8a9df2bc-f837-4814-bc4c-b64c3d753d98',
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
  final PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // OnboardingClient.start(
      //     guideCode: "SHOW_1",
      //     guideType: UIName.Tooltip,
      //     context: context,
      //     payload: [_three]);
      OnboardingClient.start(
          guideCode: "SHOW_2",
          guideType: UIName.CAROUSEL,
          context: context,
          payload: _five);

      // OnboardingClient.start(
      //     guideCode: "SHOW_1",
      //     guideType: UIName.CAROUSEL,
      //     context: context,
      //     payload: [_seven]);

      // OnboardingClient.start(
      //     guideCode: "SHOW_1",
      //     guideType: UIName.Tooltip,
      //     context: context,
      //     payload: [_six]);
    });
  }

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TooltipItem(
            //     key: _three,
            //     description: "hehe",
            //     child: const Text(
            //       'Ban nang 55 can:',
            //     )),
            // TooltipItem(
            //     key: _four,
            //     description: "hehe",
            //     child: const Text(
            //       'Ban nang 55 can:',
            //     )),
            Expanded(
                child: CarouselItem(
              key: _five,
              pageController: _pageController,
              onSkip: () {
                // print('12312');
              },
              action: () {
                print('123123123123');
              },
              carouselData: carouselData,
              titleStyles: const TextStyle(
                color: Colors.redAccent,
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.15,
              ),
              descriptionStyles: TextStyle(
                fontSize: 16,
                color: Colors.brown.shade300,
              ),
              pageIndicatorStyle: const PageIndicatorStyle(
                width: 100,
                inactiveColor: Colors.grey,
                activeColor: Colors.red,
                inactiveSize: Size(8, 8),
                activeSize: Size(12, 12),
              ),
              // okWidget: BtnWidget(onClick: (){
              //
              // },
              // ),
              // cancelWidget: BtnWidget(onClick: (){
              //
              // },
              // ),
            )),

            // PopupItem(
            //   key: _three,
            //   backgroundColor: Colors.white,
            //   msg: 'Hệ thống tiếp nhận giải quyết góp ,phản ánh hiện trường Viettel-Solution',
            //   title: 'Chào mừng bạn đến với Viettel-S',
            //   image: "images/image.png",
            //   popupWidth: kIsWeb ? 0.3 : null,
            //   context: context,
            //   actions: [
            //     IconsButton(
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       },
            //       text: 'Bỏ qua',
            //       color: Colors.white,
            //       textStyle: const TextStyle(color: Colors.black),
            //       iconColor: Colors.white,
            //     ),
            //     IconsButton(
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       },
            //       text: 'Đăng ký',
            //       color: Colors.black,
            //       textStyle: const TextStyle(color: Colors.white),
            //       iconColor: Colors.white,
            //     ),
            //   ],
            // ),
            // PopupItem(
            //   key: _four,
            //   backgroundColor: Colors.white,
            //   msg: 'Viettel Solutions',
            //   title: 'Chào mừng bạn đến với Viettel-SS',
            //   image: "images/image.png",
            //   popupWidth: kIsWeb ? 0.3 : null,
            //   context: context,
            //   actions: [
            //     IconsButton(
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       },
            //       text: 'Bỏ qua',
            //       color: Colors.white,
            //       textStyle: const TextStyle(color: Colors.black),
            //       iconColor: Colors.white,
            //     ),
            //     IconsButton(
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       },
            //       text: 'Đăng ký',
            //       color: Colors.black,
            //       textStyle: const TextStyle(color: Colors.white),
            //       iconColor: Colors.white,
            //     ),
            //   ],
            // ),
            // TooltipItem(
            //     key: _four,
            //     description: "haha",
            //     child: const Text(
            //       'Ban cao 1m8:',
            //     )),
            // TooltipItem(
            //     key: _six,
            //     description: "haha",
            //     child: const Text(
            //       'Second:',
            //     )),

            Text(
              '',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _showDialog,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

final List<CarouselModel> carouselData = [
  const CarouselModel(
    title: "Chào mừng bạn đến với Viettel-S",
    description:
        "Hệ thống tiếp nhận giải quyết góp ý, phản ánh hiện trường Viettel Solution.",
    imgUrl: "images/anh1.png",
  ),
  const CarouselModel(
    title: "Gửi phản ánh nhanh chóng",
    description:
        "Cho phép cá nhân, đơn vị gửi phản ánh, kiến nghị tới các phòng, trung tâm TCT phụ trách xử lý",
    imgUrl: 'images/anh2.png',
  ),
  const CarouselModel(
    title: "Thông tin truyền thông",
    description:
        "Cho phép xem tư liệu, ấn phẩm về các sản phẩm, dịch vụ nổi bật của TCT",
    imgUrl: 'images/anh3.png',
  ),
];
