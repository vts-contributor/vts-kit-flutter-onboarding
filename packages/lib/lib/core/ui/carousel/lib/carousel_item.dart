import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/context.dart';

import 'carousel_model.dart';
import 'carousel_widget.dart';
import 'page_indicator_style_model.dart';

class CarouselItem extends StatefulWidget{
  final GlobalKey key;
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
  State<StatefulWidget> createState() => _CarouselItemState();

}

class _CarouselItemState extends State<CarouselItem>{
  CarouselContext get state => context.read<CarouselContext>();
  bool _showItem = false;
  Timer? timer;



  Future<void> _nextIfAny() async {
    if (timer != null && timer!.isActive) {
      if (state.enableAutoPlayLock) {
        return;
      }
      timer!.cancel();
    } else if (timer != null && !timer!.isActive) {
      timer = null;
    }
    state.completed(widget.key);
  }

  _onPrevSwipe() {
    state.previous();
    widget.onActionSwipe?.call();
  }



  _onNextSwipe() {
    state.next(1);
    widget.onActionSwipe?.call();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    final activeStep = state.getActiveWidgetKey();
    setState(() {
      _showItem = activeStep == widget.key;
    });

    if (activeStep == widget.key) {
      if (state.autoPlay) {
        timer =
            Timer(Duration(seconds: state.autoPlayDelay.inSeconds), _nextIfAny);
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    if(_showItem)
    return CarouselWidget(
      carouselData: widget.carouselData,
      pageController: widget.pageController,
      onSkip : widget.onSkip,
      titleStyles : widget.titleStyles,
      descriptionStyles : widget.descriptionStyles,
      imageWidth : widget.imageWidth,
      imageHeight : widget.imageHeight,
      skipButton : widget.skipButton,
      okWidget : widget.okWidget,
      cancelWidget : widget.cancelWidget,
      duration : widget.duration,
      curve : widget.curve,
      pageIndicatorStyle : widget.pageIndicatorStyle,
      action: (){
            _onNextSwipe();
      }
    );
    return SizedBox(height: 0,);
  }

}