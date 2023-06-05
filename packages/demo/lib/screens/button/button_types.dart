import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vts_kit_flutter_onboarding/core/client.dart';
import 'package:vts_kit_flutter_onboarding/core/configs/ui_name.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/carousel_item.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/carousel_model.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_list_tile.dart';
import 'icon_buttons.dart';
import 'pill_buttons.dart';
import 'social_buttons.dart';
import 'standard_buttons.dart';
import 'text_buttons.dart';

class ButtonTypes extends StatefulWidget {
  @override
  _ButtonTypesState createState() => _ButtonTypesState();
}

class _ButtonTypesState extends State<ButtonTypes> {
  final _six = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      OnboardingClient.start(
          context: context,
          guideCode: 'SHOW_2',
          guideType: UIName.Carousel,
          payload: _six);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(title: 'Button'),
        body: ListView(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            DemoListTile(
              text: 'Standard buttons',
              svgAssets: 'lib/assets/icons/standard_button.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => StandardButtons()),
                );
              },
            ),
            DemoListTile(
              text: 'Pill buttons',
              svgAssets: 'lib/assets/icons/pill_button.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PillsButtons()),
                );
              },
            ),
            DemoListTile(
              text: 'Icon buttons',
              svgAssets: 'lib/assets/icons/icon_button.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => IconButtons()),
                );
              },
            ),
            DemoListTile(
              text: 'Text buttons',
              svgAssets: 'lib/assets/icons/social_button.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => TextButtons()),
                );
              },
            ),
            DemoListTile(
              text: 'Social buttons',
              svgAssets: 'lib/assets/icons/link_button.svg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SocialButtons()),
                );
              },
            ),
            CarouselItem(
                key: _six,
                carouselData: const [
                  CarouselModel(
                    title: 'Chào mừng bạn đến với Viettel-S',
                    description:
                        'Hệ thống tiếp nhận giải quyết góp ý,phản ánh hiện trường Viettel Solution',
                    imgUrl: 'images/anh1.png',
                  ),
                  CarouselModel(
                    title: 'Gửi phản ánh nhanh chóng',
                    description:
                        'Cho phép cá nhân, đơn vị gửi phản ánh, kiến nghị tới các phòng, trung tâm TCT phụ trách xử lý',
                    imgUrl: 'images/anh2.png',
                  ),
                  CarouselModel(
                    title: 'Thông tin truyền thông',
                    description:
                        'Cho phép xem tư liệu, ấn phẩm về các sản phẩm, dịch vụ nổi bật của TCT',
                    imgUrl: 'images/anh3.png',
                  )
                ],
                footerWidget: Padding(
                    padding: const EdgeInsets.only(
                        top: 40, bottom: 30, left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 350,
                          height: 40,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.red)))),
                              onPressed: () {},
                              child: const Text(
                                "Đăng nhập",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 350,
                          height: 40,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          side: const BorderSide(
                                              color: Colors.red)))),
                              onPressed: () {},
                              child: const Text(
                                "Bỏ qua",
                                style: TextStyle(color: Colors.red),
                              )),
                        ),
                      ],
                    )),
                skipButton: IconButton(
                  onPressed: () {
                    OnboardingClient.dismiss();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                )),
          ],
        ),
      );
}
