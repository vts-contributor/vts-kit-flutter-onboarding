import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/context.dart';

import 'package:flutter/services.dart';
import 'carousel_widget.dart';
import 'page_indicator_style_model.dart';

class CarouselItem extends StatefulWidget {
  final GlobalKey key;

  /// Data for Carousel [List<CarouselModel>]
  /// @Required
  final List<Widget> carouselData;

  /// OnTapping skip button action
  final VoidCallback? onSkip;

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

  ///  footer Widget
  final Widget? footerWidget;

  final Color? bgColor;

  /// Animation [Duration] for transition from one page to another
  /// @Default [Duration(milliseconds:250)]
  final Duration duration;

  /// [Curve] used for animation
  /// @Default [Curves.easeInOut]
  final Curve curve;

  /// [PageIndicatorStyle] dot styles
  final PageIndicatorStyle pageIndicatorStyle;

  final VoidCallback? onActionSwipe;

  CarouselItem({
    required this.key,
    this.onActionSwipe,
    required this.carouselData,
    this.onSkip,
    this.titleStyles,
    this.descriptionStyles,
    this.imageWidth,
    this.imageHeight,
    this.skipButton,
    this.footerWidget,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
    this.pageIndicatorStyle = const PageIndicatorStyle(
        width: 150,
        activeColor: Colors.red,
        inactiveColor: Colors.redAccent,
        activeSize: Size(12, 12),
        inactiveSize: Size(8, 8)),
    this.bgColor,
  });

  @override
  State<StatefulWidget> createState() => CarouselItemState();
}

class CarouselItemState extends State<CarouselItem> {
  CarouselContext get state => context.read<CarouselContext>();
  bool _showItem = false;
  Timer? timer;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    context.read<CarouselContext>().addListener(checkState);
  }

  @override
  void deactivate() {
    super.deactivate();
    context.read<CarouselContext>().removeListener(checkState);
  }

  void _onPageChanged(int page, int pageLength, bool forward) {
    state.next(page, pageLength, forward);
  }

  void checkState() {
    final showItem = state.activeWidgetKey == widget.key;
    if (showItem)
      _show();
    else
      _hide();
  }

  void _dismiss() {
    state.dismiss(manual: true);
  }

  void _show() {
    if (_overlayEntry == null) {
      _overlayEntry = showCarouselOverlay(context);
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  void _hide() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry showCarouselOverlay(BuildContext context) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned.fill(
        child: GestureDetector(
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: Container(
                color: widget.bgColor ?? Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: CarouselWidget(
                      carouselData: widget.carouselData,
                      onSkip: () {
                        _dismiss();
                      },
                      titleStyles: widget.titleStyles,
                      descriptionStyles: widget.descriptionStyles,
                      imageWidth: widget.imageWidth,
                      imageHeight: widget.imageHeight,
                      skipButton: widget.skipButton,
                      footerWidget: widget.footerWidget,
                      duration: widget.duration,
                      curve: widget.curve,
                      pageIndicatorStyle: widget.pageIndicatorStyle,
                      onPageChanged: _onPageChanged,
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // overlayState.insert(overlayEntry!);
    return overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          if (_overlayEntry != null) {
            this._dismiss();
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: SizedBox.shrink());
  }
}
