import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/context.dart';

import 'package:flutter/services.dart';
import 'carousel_model.dart';
import 'carousel_widget.dart';
import 'page_indicator_style_model.dart';

class CarouselItem extends StatefulWidget {
  final GlobalKey key;

  /// Data for Carousel [List<CarouselModel>]
  /// @Required
  final List<Widget> carouselData;

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

  final VoidCallback? onActionSwipe;



  CarouselItem({
    required this.key,
    this.onActionSwipe,
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
  });

  @override
  State<StatefulWidget> createState() => CarouselItemState();
}

class CarouselItemState extends State<CarouselItem> {
  CarouselContext get state => context.read<CarouselContext>();
  bool _showItem = false;
  Timer? timer;


  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    context.read<CarouselContext>().addListener(() {
      showCarousel();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showCarousel();
  }

  void showCarousel() {
    final activeWidgetKey = state.activeWidgetKey;
    setState(() {
      _showItem = activeWidgetKey == widget.key;
    });
  }

  void _onPageChanged(int page, int pageLength, bool forward) {
    state.next(page, pageLength, forward);
  }

  Future<void> _skip() async {
    if (timer != null && timer!.isActive) {
      if (state.enableAutoPlayLock) {
        return;
      }
      timer!.cancel();
    } else if (timer != null && !timer!.isActive) {
      timer = null;
    }
    state.completed();
  }
  //
  //  static Future<void> carouselDialog({
  //   required BuildContext context,
  //    required GlobalKey key,
  //   required List<CarouselModel> carouselData,
  //   VoidCallback? onSkip,
  //   required PageController pageController,
  //   TextStyle? titleStyles,
  //   TextStyle? descriptionStyles,
  //   double? imageWidth,
  //   double? imageHeight,
  //   Widget? skipButton,
  //   Widget? okWidget,
  //   Widget? cancelWidget,
  //   Duration duration = const Duration(milliseconds: 250),
  //   Curve curve = Curves.easeInOut,
  //   PageIndicatorStyle pageIndicatorStyle = const PageIndicatorStyle(
  //       width: 150,
  //       activeColor: Colors.blue,
  //       inactiveColor: Colors.blueAccent,
  //       activeSize: Size(12, 12),
  //       inactiveSize: Size(8, 8)),
  //   Function(int, int, bool)? onPageChanged
  // }) async {
  //   await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return ChangeNotifierProvider<CarouselContext>(
  //         create: (context) => CarouselContext(context: context),
  //         child: MaterialApp(
  //           home: Dialog(
  //               insetPadding: EdgeInsets.zero,
  //               backgroundColor: Colors.white,
  //               child:CarouselWidget(
  //                 carouselData: carouselData,
  //                 pageController: pageController,
  //                 onSkip: (){
  //                   // _skip();
  //                   // _skip();
  //                 },
  //                 titleStyles: titleStyles,
  //                 descriptionStyles:descriptionStyles,
  //                 imageWidth: imageWidth,
  //                 imageHeight: imageHeight,
  //                 skipButton: skipButton,
  //                 okWidget: okWidget,
  //                 cancelWidget: cancelWidget,
  //                 duration: duration ,
  //                 curve: curve,
  //                 pageIndicatorStyle: pageIndicatorStyle,
  //                 onPageChanged: _onPageChanged,
  //               )
  //           ),
  //           // Rest of your app code...
  //         ),
  //       );
  //       return  Dialog(
  //           insetPadding: EdgeInsets.zero,
  //           backgroundColor: Colors.white,
  //           child:CarouselWidget(
  //               carouselData: carouselData,
  //               pageController: pageController,
  //               onSkip: (){
  //                 // _skip();
  //                 // _skip();
  //               },
  //               titleStyles: titleStyles,
  //               descriptionStyles:descriptionStyles,
  //               imageWidth: imageWidth,
  //               imageHeight: imageHeight,
  //               skipButton: skipButton,
  //               okWidget: okWidget,
  //               cancelWidget: cancelWidget,
  //               duration: duration ,
  //               curve: curve,
  //               pageIndicatorStyle: pageIndicatorStyle,
  //               onPageChanged: _onPageChanged,
  //               )
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {

      if(_showItem) {
        return Dialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            child: Container(
                width: double.infinity,
                height: double.infinity,
                child: CarouselWidget(
                  carouselData: widget.carouselData,
                  pageController: widget.pageController,
                  onSkip: () {
                    _skip();
                  },
                  titleStyles: widget.titleStyles,
                  descriptionStyles: widget.descriptionStyles,
                  imageWidth: widget.imageWidth,
                  imageHeight: widget.imageHeight,
                  skipButton: widget.skipButton,
                  okWidget: widget.okWidget,
                  cancelWidget: widget.cancelWidget,
                  duration: widget.duration,
                  curve: widget.curve,
                  pageIndicatorStyle: widget.pageIndicatorStyle,
                  onPageChanged: _onPageChanged,
                )
            )
        );
      }
    return  SizedBox.shrink();
  }
}
