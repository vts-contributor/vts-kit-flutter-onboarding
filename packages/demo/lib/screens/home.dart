import 'package:flutter/material.dart';
import 'package:vts_component/vts_component.dart';
import 'package:vts_kit_flutter_onboarding/core/client.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/carousel_item.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/carousel_model.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/page_indicator_style_model.dart';
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
  final _five = GlobalKey();
  final _seven = GlobalKey();

  final PageController _pageController = PageController();


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      OnboardingClient.start(
          context: context,
          guideCode: 'SHOW_1',
          guideType: UIName.Tooltip,
          payload: [_one, _two, _three]);
      OnboardingClient.start(
          context: context,
          guideCode: 'SHOW_2',
          guideType: UIName.Tooltip,
          payload: [_four, _five]);
    });
  }

  List gfComponents = [
    {
      'icon': const IconData(
        0xe904,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Button',
      'route': ButtonTypes()
    },
    {
      'icon': const IconData(
        0xe91d,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Tabs',
      'route': TabTypes()
    },
    {
      'icon': const IconData(
        0xe902,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Badge',
      'route': BadgesPage()
    },
    {
      'icon': const IconData(
        0xe905,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Cards',
      'route': CardPage()
    },
    {
      'icon': const IconData(
        0xe906,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Carousel',
      'route': CarouselPage()
    },
    {
      'icon': const IconData(
        0xe903,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Avatar',
      'route': AvatarPage()
    },
    {
      'icon': const IconData(
        0xe90d,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Images',
      'route': ImagesPage()
    },
    {
      'icon': const IconData(
        0xe90e,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Tiles',
      'route': TilesPage()
    },
    {
      'icon': const IconData(
        0xe910,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Toggle',
      'route': TogglesPage()
    },
    {
      'icon': const IconData(
        0xe920,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Toast',
      'route': ToastsPage()
    },
    {
      'icon': const IconData(
        0xe900,
        fontFamily: 'GFIconsneww',
      ),
      'title': 'DropDown',
      'route': DropdownTypes()
    },
    {
      'icon': const IconData(
        0xe900,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Accordion',
      'route': AccordionPage()
    },
    {
      'icon': const IconData(
        0xe919,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Search Bar',
      'route': SearchbarPage()
    },
    {
      'icon': Icons.downloading,
      'title': 'Progress Bar',
      'route': ProgressBarPage()
    },
    {
      'icon': Icons.star_border_rounded,
      'title': 'Rating Bar',
      'route': RatingBarPage()
    },
    {
      'icon': Icons.blur_linear_rounded,
      'title': 'Shimmer',
      'route': ShimmerPage()
    },
    {
      'icon': const IconData(
        0xe919,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Textfield',
      'route': TextFieldPage()
    },
    {
      'icon': const IconData(
        0xf06c8,
        fontFamily: 'MaterialIcons',
      ),
      'title': 'DateTime Picker',
      'route': DateTimePickerPage()
    },
    {
      'icon': const IconData(
        0xe4c5,
        fontFamily: 'MaterialIcons',
      ),
      'title': 'Pie Chart',
      'route': PieChartPage()
    },
    {
      'icon': const IconData(
        0xe901,
        fontFamily: 'GFFontIcons',
      ),
      'title': 'Alert',
      'route': AlertPage()
    },
    {
      'icon': const IconData(
        0xe906,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'CheckBox',
      'route': CheckBoxPage()
    },
    {
      'icon': const IconData(
        0xe908,
        fontFamily: 'GFIconsnew',
      ),
      'title': 'RadioButton',
      'route': RadioButtonPage()
    },
    {
      'icon': const IconData(
        0xe412,
        fontFamily: 'MaterialIcons',
      ),
      'title': 'LineChartStyle1',
      'route': LineChartStyle1()
    },
    {
      'icon': const IconData(
        0xe412,
        fontFamily: 'MaterialIcons',
      ),
      'title': 'LineChartStyle2',
      'route': LineChartStyle2()
    },
    {
      'icon': const IconData(
        0xe412,
        fontFamily: 'MaterialIcons',
      ),
      'title': 'LineChartStyle2',
      'route': LineChartStyle2()
    },


  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: DemoAppbar(goBack: false),
        body: ListView(
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                          onTap: () {},
                          child: buildSquareTile(
                              gfComponents[index]['title'],
                              gfComponents[index]['icon'],
                              gfComponents[index]['route'])
                      )),
            ),
          ],
        ),
      );

  Widget buildCarousel(){
    return  Expanded(child: CarouselItem(
      key: _seven,
      pageController: _pageController,
      onSkip: () {
        // print('12312');
      },
      action: (){
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
    )
    ) ;
  }

  final List<CarouselModel> carouselData = [
    const CarouselModel(
      title: "Chào mừng bạn đến với Viettel-S",
      description: "Hệ thống tiếp nhận giải quyết góp ý, phản ánh hiện trường Viettel Solution.",
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

  Widget buildSquareTile(String title, IconData? icon, Widget? route) {
    final childContent = InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => route!),
        );
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
      case 'Button':
        return TooltipItem(
            key: _one,
            width: 250,
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
            child: child);
      case 'Tabs':
        return TooltipItem(
            key: _two,
            width: 300,
            allowBack: true,
            description:
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
            child: child);
      case 'Badge':
        return TooltipItem(
            key: _three,
            width: 200,
            allowBack: true,
            nextText: 'OK la',
            description:
                "Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet.",
            child: child);
      case 'Cards':
        return TooltipItem(
            key: _four,
            width: 250,
            tooltipPosition: TooltipPosition.top,
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
            child: child);
      case 'Carousel':
        return TooltipItem(
            key: _five,
            width: 300,
            allowBack: true,
            tooltipPosition: TooltipPosition.top,
            description:
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
            child: child);
      default:
    }
    return child;
  }
}
