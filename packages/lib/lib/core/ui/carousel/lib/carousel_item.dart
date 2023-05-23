import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/context.dart';

import 'carousel_model.dart';
import 'carousel_widget.dart';
import 'page_indicator_style_model.dart';

class CarouselItem extends StatefulWidget {
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

class _CarouselItemState extends State<CarouselItem> {
  CarouselContext get state => context.read<CarouselContext>();
  bool _showItem = false;

  @override
  void initState() {
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
    final activeWidgetKey = state.activeWidgetKey;
    setState(() {
      _showItem = activeWidgetKey == widget.key;
    });
  }

  _onPageChanged(int page, int pageLength, bool forward) {
    state.next(page, pageLength, forward);
  }

  @override
  Widget build(BuildContext context) {
    return _showItem
        ? CarouselWidget(
            carouselData: widget.carouselData,
            pageController: widget.pageController,
            onSkip: widget.onSkip,
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
            action: () {})
        : SizedBox();
  }
}
