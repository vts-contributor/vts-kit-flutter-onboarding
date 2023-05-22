import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import 'btn_widget.dart';
import 'carousel_model.dart';
import 'constants.dart';
import 'page_indicator.dart';
import 'page_indicator_style_model.dart';
import 'providers.dart';


class CarouselWidget extends HookConsumerWidget {
  /// Data for Carousel [List<CarouselModel>]
  /// @Required
  final List<CarouselModel> carouselData;

  /// OnTapping skip button action
  final VoidCallback? onSkip;

  /// Controller for [PageView]
  /// @Required
  final PageController pageController;

  /// Title text style
  final TextStyle? titleStyles;

  /// Description text style
  final TextStyle? descriptionStyles;

  /// Carousel Image width
  final double? imageWidth;

  /// Carousel Image height
  final double? imageHeight;

  /// Skip Button Widget
  final Widget? skipButton;

  ///  Button Widget
  final Widget? okWidget;

  ///  Button Widget
  final Widget? cancelWidget;

  /// Animation [Duration] for transition from one page to another
  /// @Default [Duration(milliseconds:250)]
  final Duration duration;

  /// [Curve] used for animation
  /// @Default [Curves.easeInOut]
  final Curve curve;

  /// [PageIndicatorStyle] dot styles
  final PageIndicatorStyle pageIndicatorStyle;

  final VoidCallback action;


  const CarouselWidget({
    Key? key,
    required this.carouselData,
    required this.action,
    this.onSkip,
    required this.pageController,
    this.titleStyles,
    this.descriptionStyles,
    this.imageWidth,
    this.imageHeight,
    this.skipButton,
    this.okWidget,
    this.cancelWidget,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
    this.pageIndicatorStyle = const PageIndicatorStyle(
        width: 150,
        activeColor: Colors.blue,
        inactiveColor: Colors.blueAccent,
        activeSize: Size(12, 12),
        inactiveSize: Size(8, 8)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      child: _Carousel(
        action: action,
        carouselData: carouselData,
        pageController: pageController,
        onSkip: onSkip,
        titleStyles: titleStyles,
        descriptionStyles: descriptionStyles,
        imageWidth: imageWidth,
        imageHeight: imageHeight,
        skipButton: skipButton,
        okWidget: okWidget,
        cancelWidget: cancelWidget,
        duration: duration,
        curve: curve,
        pageIndicatorStyle: pageIndicatorStyle,
      ),
    );
  }
}

class _Carousel extends HookConsumerWidget {
  /// Data for Carousel [List<CarouselModel>]
  /// @Required
  final List<CarouselModel> carouselData;

  /// OnTapping skip button action
  final VoidCallback? onSkip;

  /// Controller for [PageView]
  /// @Required
  final PageController pageController;

  /// Title text style
  final TextStyle? titleStyles;

  /// Description text style
  final TextStyle? descriptionStyles;

  /// Carousel Image width
  final double? imageWidth;

  /// Carousel Image height
  final double? imageHeight;

  /// Skip Button Widget
  final Widget? skipButton;

  /// Oke Button Widget
  final Widget? okWidget;

  /// Oke Button Widget
  final Widget? cancelWidget;

  /// Animation [Duration] for transition from one page to another
  /// @Default [Duration(milliseconds:250)]
  final Duration duration;

  /// [Curve] used for animation
  /// @Default [Curves.easeInOut]
  final Curve curve;

  /// [PageIndicatorStyle] dot styles
  final PageIndicatorStyle pageIndicatorStyle;

  final VoidCallback action;


  const _Carousel({
    Key? key,
    required this.carouselData,
    required this.action,
    this.onSkip,
    required this.pageController,
    this.titleStyles,
    this.descriptionStyles,
    this.imageWidth,
    this.imageHeight,
    this.skipButton,
    this.okWidget,
    this.cancelWidget,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
    this.pageIndicatorStyle = const PageIndicatorStyle(
        width: 150,
        activeColor: Colors.blue,
        inactiveColor: Colors.blueAccent,
        activeSize: Size(12, 12),
        inactiveSize: Size(8, 8)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carouselState = ref.watch(carouselStateProvider);
    final carouselStateNotifier = ref.watch(carouselStateProvider.notifier);

    final screenSize = MediaQuery.of(context).size;
    final double pageViewHeight = screenSize.height -
        skipContainerHeight -
        footerContentHeight -
        pageIndicatorHeight;

    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            height: skipContainerHeight,
            alignment: Alignment.centerRight,
            child: skipButton ??
                TextButton(
                  onPressed: () => _onSkipPressed(onSkip),
                  child: const Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                ),
          ),
          Expanded(
            child: SizedBox(
                height: pageViewHeight,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (page) => {

                    _onSwipe(action),
                    carouselStateNotifier.onPageChanged(
                        page, carouselData.length)
                  } ,
                  itemCount: carouselData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Image.asset(
                              carouselData[index].imgUrl,
                              width: imageWidth,
                              height: imageHeight,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              carouselData[index].title,
                              textAlign: TextAlign.center,
                              style: titleStyles ??
                                  const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              carouselData[index].description,
                              textAlign: TextAlign.center,
                              style: descriptionStyles ??
                                  const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ),
          SizedBox(
            height: pageIndicatorHeight,
            child: PageIndicator(
              count: carouselData.length,
              activePage: carouselState.page,
              pageIndicatorStyle: pageIndicatorStyle,
            ),
          ),
          const SizedBox(height: 10),
          okWidget ??  BtnWidget(
            text: "Đăng nhập",
              onClick: (){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text("Đăng nhập"))  ,
                  backgroundColor: Colors.red));
          }),
          const SizedBox(height: 10,),
          cancelWidget ?? BtnWidget(
            text: "Đăng ký",
            onClick: (){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text("Đăng ký"))  ,
                  backgroundColor: Colors.red));
            },
            colorBgBtn : Colors.transparent,
            colorText: Colors.red,
          ),
          const SizedBox(
            height: marginBottom,
          )
        ],
      ),
    );
  }


  void _onSkipPressed(VoidCallback? onSkip) {
    if (onSkip == null) {
      throw Exception(
          'Either provide "onSkip" callback or add "skipButton" Widget to "Carousel" Widget to handle skip state');
    } else {
      onSkip();
    }
  }

  void _onSwipe(VoidCallback? onSkip) {
    if (onSkip == null) {
      throw Exception(
          'Either provide "onSkip" callback or add "skipButton" Widget to "Carousel" Widget to handle skip state');
    } else {
      onSkip();
    }
  }
}
