import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/tooltip/lib/enum.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/tooltip/lib/tooltip_item.dart';
import 'package:vts_kit_flutter_onboarding/index.dart';
import 'package:vts_kit_flutter_onboarding_demo/components/demo_appbar.dart';
import 'package:vts_kit_flutter_onboarding_demo/screens/alert/alert.dart';
import 'package:vts_kit_flutter_onboarding_demo/screens/charts/pie_chart/pie_chart.dart';
import 'package:vts_kit_flutter_onboarding_demo/screens/date_time_picker/date_time_picker.dart';
import 'package:vts_kit_flutter_onboarding_demo/screens/dropdowns/dropdown_types.dart';
import 'package:vts_kit_flutter_onboarding_demo/screens/progress_bar/progress_bar.dart';
import 'package:vts_kit_flutter_onboarding_demo/screens/radiobutton/radiobutton.dart';
import 'package:vts_kit_flutter_onboarding_demo/screens/rating_bar/rating_bar.dart';
import 'package:vts_kit_flutter_onboarding_demo/screens/shimmer/shimmer.dart';
import 'package:vts_kit_flutter_onboarding_demo/screens/textfield/textfield.dart';
import '../screens/accordian/accordian.dart';
import '../screens/avatar/avatars.dart';
import '../screens/badges/badges.dart';
import '../screens/button/button_types.dart';
import '../screens/cards/cards.dart';
import '../screens/carousel/carousel.dart';
import '../screens/images/images.dart';
import '../screens/searchbar/seachbar.dart';
import '../screens/tabs/tab_types.dart';
import '../screens/tiles/tiles_page.dart';
import '../screens/toast/toasts.dart';
import '../screens/toggle/toggles.dart';
import 'checkbox/checkbox.dart';
import 'line_chart_style_1/line_chart_style_1.dart';
import 'line_chart_style_2/line_chart_style_2.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _one = GlobalKey();
  final _two = GlobalKey();
  final _three = GlobalKey();
  final _four = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      OnboardingClient.start(
          context: context,
          guideCode: 'SHOW_1',
          guideType: UIName.Carousel,
          payload: _one);
      OnboardingClient.start(
          context: context,
          guideCode: 'SHOW_2',
          guideType: UIName.Tooltip,
          payload: [_two, _three, _four]);
    });
  }

  List gfComponents = [
    {
      'icon': const IconData(
        0xe904,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Button',
      'route': '/button_types'
    },
    {
      'icon': const IconData(
        0xe91d,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Tabs',
      'route': '/tab_types'
    },
    {
      'icon': const IconData(
        0xe902,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Badge',
      'route': '/badge'
    },
    {
      'icon': const IconData(
        0xe905,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Cards',
      'route': '/card'
    },
    {
      'icon': const IconData(
        0xe906,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Carousel',
      'route': '/carousel'
    },
    {
      'icon': const IconData(
        0xe903,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Avatar',
      'route': '/avatar'
    },
    {
      'icon': const IconData(
        0xe90d,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Images',
      'route': '/image'
    },
    {
      'icon': const IconData(
        0xe90e,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Tiles',
      'route': '/tile'
    },
    {
      'icon': const IconData(
        0xe910,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Toggle',
      'route': '/toggle'
    },
    {
      'icon': const IconData(
        0xe920,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Toast',
      'route': '/toast'
    },
    {
      'icon': const IconData(
        0xe900,
        fontFamily: 'GFIconsneww',
      ),
      'title': 'DropDown',
      'route': '/dropdown_type'
    },
    {
      'icon': const IconData(
        0xe900,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Accordion',
      'route': '/accordion'
    },
    {
      'icon': const IconData(
        0xe919,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Search Bar',
      'route': '/search_bar'
    },
    {'icon': Icons.downloading, 'title': 'Progress Bar', 'route': '/progress'},
    {
      'icon': Icons.star_border_rounded,
      'title': 'Rating Bar',
      'route': '/rating'
    },
    {
      'icon': Icons.blur_linear_rounded,
      'title': 'Shimmer',
      'route': '/shimmer'
    },
    {
      'icon': const IconData(
        0xe919,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Textfield',
      'route': '/text_field'
    },
    {
      'icon': const IconData(
        0xf06c8,
        fontFamily: 'MaterialIcons',
      ),
      'title': 'DateTime Picker',
      'route': '/date_time_picker'
    },
    {
      'icon': const IconData(
        0xe4c5,
        fontFamily: 'MaterialIcons',
      ),
      'title': 'Pie Chart',
      'route': '/pie_chart'
    },
    {
      'icon': const IconData(
        0xe901,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Alert',
      'route': '/alert'
    },
    {
      'icon': const IconData(
        0xe906,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'CheckBox',
      'route': '/checkbox'
    },
    {
      'icon': const IconData(
        0xe908,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'RadioButton',
      'route': '/radiobutton'
    },
    {
      'icon': const IconData(
        0xe412,
        fontFamily: 'MaterialIcons',
      ),
      'title': 'LineChartStyle1',
      'route': '/linechartstyle1'
    },
    {
      'icon': const IconData(
        0xe412,
        fontFamily: 'MaterialIcons',
      ),
      'title': 'LineChartStyle2',
      'route': '/linechartstyle2'
    }
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(goBack: false),
        body: Column(
          children: [
            Carousel(
              key: _one,
              cancelText: 'Skip',
              okText: 'Understand',
              children: const [
                CarouselBasicItem(
                  title: 'Chào mừng bạn đến với Viettel-S',
                  body:
                      'Hệ thống tiếp nhận giải quyết góp ý,phản ánh hiện trường Viettel Solution',
                  image: VTSImage(
                    height: 400,
                    boxFit: BoxFit.contain,
                    imageProvider: AssetImage('images/anh1.png'),
                  ),
                  okText: 'Skip',
                ),
                CarouselBasicItem(
                    title: 'Gửi phản ánh nhanh chóng',
                    body:
                        'Cho phép cá nhân, đơn vị gửi phản ánh, kiến nghị tới các phòng, trung tâm TCT phụ trách xử lý',
                    image: VTSImage(
                      height: 400,
                      boxFit: BoxFit.cover,
                      imageProvider: AssetImage('images/anh2.png'),
                    )),
                CarouselBasicItem(
                    title: 'Thông tin truyền thông',
                    body:
                        'Cho phép xem tư liệu, ấn phẩm về các sản phẩm, dịch vụ nổi bật của TCT',
                    image: VTSImage(
                      height: 400,
                      boxFit: BoxFit.contain,
                      imageProvider: AssetImage('images/anh3.png'),
                    ))
              ],
            ),
            ListView(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                      left: 15, bottom: 20, top: 20, right: 15),
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: gfComponents.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                              onTap: () {},
                              child: buildSquareTile(
                                  gfComponents[index]['title'],
                                  gfComponents[index]['icon'],
                                  gfComponents[index]['route']))),
                ),
              ],
            ),
          ],
        ),
      );

  Widget buildSquareTile(String title, IconData? icon, String route) {
    final childContent = InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: VTSColors.WHITE_1,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(width: 1, color: VTSCommon.BORDER_COLOR_LIGHT),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              icon,
              color: VTSColors.PRIMARY_0,
              size: 50,
            ),
            Text(
              title,
              style: const TextStyle(color: VTSColors.BLACK_1, fontSize: 20),
            )
          ],
        ),
      ),
    );

    return addOnboardingUI(title, childContent);
  }

  Widget addOnboardingUI(String title, Widget child) {
    switch (title) {
      case 'Tabs':
        return TooltipItem(
            key: _two,
            width: 300,
            allowBack: true,
            title: "Không biết:",
            description:
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
            child: child);
      case 'Badge':
        return TooltipItem(
            key: _three,
            width: 250,
            allowBack: true,
            scrollAlign: 0.4,
            nextText: 'OK la',
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const VTSImage(
                  height: 100,
                  boxFit: BoxFit.fitWidth,
                  imageProvider: AssetImage('lib/assets/images/giphy.gif'),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16.0)),
                ),
              ],
            ),
            child: child);
      case 'Cards':
        return TooltipItem(
            key: _four,
            width: 250,
            tooltipPosition: TooltipPosition.top,
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
            child: child);
      default:
    }
    return child;
  }
}
