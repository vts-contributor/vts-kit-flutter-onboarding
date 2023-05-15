import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/ui_name.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/icon_button.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/popup_item.dart';
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
        debug: true);
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
      home: OnboardingProvider(
          child: const MyHomePage(title: 'Flutter Demo Home Page 1111')),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      OnboardingClient.start(
          guideCode: "TOAN",
          guideType: UIName.Popup,
          context: context,
          payload: [_three,_four]);
      OnboardingClient.start(
          guideCode: "TOAN",
          guideType: UIName.Tooltip,
          context: context,
          payload: [_one]);
      // OnboardingClient.start(
      //     guideCode: "SHOW_4",
      //     guideType: UIName.Popup,
      //     context: context,
      //     payload: [_five, _six]);

      OnboardingClient.start(
          guideCode: "TOAN",
          guideType: UIName.Tooltip,
          context: context,
          payload: [_six]);
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

            // TooltipItem.withWidget(
            //     key: _two,
            //     container: Container(
            //       decoration: BoxDecoration(color: Colors.white),
            //       child: TextButton(
            //         child: Text('Dismiss'),
            //         onPressed: () {
            //           OnboardingClient.dismiss();
            //         },
            //       ),
            //     ),
            //     targetShapeBorder: CircleBorder(),
            //     height: 40,
            //     width: 200,
            //     child: const Text(
            //       'You have pushed the button this many times:',
            //     )),
            TooltipItem(
                key: _one,
                description: "hehe",
                child: const Text(
                  'Ban nang 55 can:',
                )),
            PopupItem(
              key: _three,
              backgroundColor: Colors.white,
              msg: 'Hệ thống tiếp nhận giải quyết góp ,phản ánh hiện trường Viettel-Solution',
              title: 'Chào mừng bạn đến với Viettel-S',
              image: "images/image.png",
              popupWidth: kIsWeb ? 0.3 : null,
              context: context,
              actions: [
                IconsButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Bỏ qua',
                  color: Colors.white,
                  textStyle: const TextStyle(color: Colors.black),
                  iconColor: Colors.white,
                ),
                IconsButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Đăng ký',
                  color: Colors.black,
                  textStyle: const TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              ],
            ),
            PopupItem(
              key: _four,
              backgroundColor: Colors.white,
              msg: 'Viettel Solutions',
              title: 'Chào mừng bạn đến với Viettel-SS',
              image: "images/image.png",
              popupWidth: kIsWeb ? 0.3 : null,
              context: context,
              actions: [
                IconsButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Bỏ qua',
                  color: Colors.white,
                  textStyle: const TextStyle(color: Colors.black),
                  iconColor: Colors.white,
                ),
                IconsButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Đăng ký',
                  color: Colors.black,
                  textStyle: const TextStyle(color: Colors.white),
                  iconColor: Colors.white,
                ),
              ],
            ),
            TooltipItem(
                key: _two,
                description: "haha",
                child: const Text(
                  'Ban cao 1m8:',
                )),
            TooltipItem(
                key: _six,
                description: "haha",
                child: const Text(
                  'Second:',
                )),


            Text(
              '$_counter',
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
//
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/icon_button.dart';
// import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/dialogs.dart';
//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Material design Dialogs',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: SafeArea(
//           child: Scaffold(
//               backgroundColor: Colors.white,
//               appBar: AppBar(
//                 title: Text("Material design Dialogs"),
//               ),
//               body: TestPage()),
//         ));
//   }
// }
//
// class TestPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return TestState();
//   }
// }
//
// class TestState extends State<TestPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           btn3(context),
//         ],
//       ),
//     );
//   }
//
//   Widget btn3(BuildContext context) {
//     return MaterialButton(
//       minWidth: 300,
//       color: Colors.grey[300],
//       onPressed: () => Dialogs.materialDialog(
//         color: Colors.white,
//         msg: 'Hệ thống tiếp nhận giải quyết góp ,phản ánh hiện trường Viettel-Solution',
//         title: 'Chào mừng bạn đến với Viettel-S',
//         image: "images/image.png",
//         dialogWidth: kIsWeb ? 0.3 : null,
//         context: context,
//         actions: [
//           IconsButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             text: 'Bỏ qua',
//             color: Colors.white,
//             textStyle: const TextStyle(color: Colors.black),
//             iconColor: Colors.white,
//           ),
//           IconsButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             text: 'Đăng ký',
//             color: Colors.black,
//             textStyle: const TextStyle(color: Colors.white),
//             iconColor: Colors.white,
//           ),
//         ],
//       ),
//       child: Text("Show animations Material Dialog"),
//     );
//   }
//
// }

