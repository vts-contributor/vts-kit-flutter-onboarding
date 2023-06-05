import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'constants.dart';
import 'page_indicator.dart';
import 'page_indicator_style_model.dart';

class CarouselWidget extends StatelessWidget {
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

  /// Animation [Duration] for transition from one page to another
  /// @Default [Duration(milliseconds:250)]
  final Duration duration;

  /// [Curve] used for animation
  /// @Default [Curves.easeInOut]
  final Curve curve;

  /// [PageIndicatorStyle] dot styles
  final PageIndicatorStyle pageIndicatorStyle;

  final Function(int, int, bool)? onPageChanged;

  const CarouselWidget(
      {Key? key,
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
          activeColor: Colors.blue,
          inactiveColor: Colors.blueAccent,
          activeSize: Size(12, 12),
          inactiveSize: Size(8, 8)),
      this.onPageChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: _Carousel(
          carouselData: carouselData,
          onSkip: onSkip,
          titleStyles: titleStyles,
          descriptionStyles: descriptionStyles,
          imageWidth: imageWidth,
          imageHeight: imageHeight,
          skipButton: skipButton,
          footerWidget: footerWidget,
          duration: duration,
          curve: curve,
          pageIndicatorStyle: pageIndicatorStyle,
          onPageChanged: onPageChanged),
    );
  }
}

class _Carousel extends StatefulWidget {
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

  /// footer Widget
  final Widget? footerWidget;

  /// Animation [Duration] for transition from one page to another
  /// @Default [Duration(milliseconds:250)]
  final Duration duration;

  /// [Curve] used for animation
  /// @Default [Curves.easeInOut]
  final Curve curve;

  /// [PageIndicatorStyle] dot styles
  final PageIndicatorStyle pageIndicatorStyle;

  final Function(int, int, bool)? onPageChanged;

  const _Carousel(
      {Key? key,
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
          activeColor: Colors.blue,
          inactiveColor: Colors.blueAccent,
          activeSize: Size(12, 12),
          inactiveSize: Size(8, 8)),
      this.onPageChanged})
      : super(key: key);

  @override
  State<_Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<_Carousel> {
  int _page = 0;

  @override
  void initState() {
    super.initState();
    // Emit index 0 page changed
    WidgetsBinding.instance.addPostFrameCallback((_) => _onPageChanged(0));
  }

  _onPageChanged(int page) {
    final forward = page > _page;
    setState(() {
      _page = page;
    });
    widget.onPageChanged?.call(page, widget.carouselData.length, forward);
  }

  _onSkip() {
    widget.onSkip?.call();
  }

  @override
  Widget build(BuildContext context) {
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
              child: Material(
                color: Colors.transparent,
                child: widget.skipButton ??
                    IconButton(
                      onPressed: _onSkip,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    ),
              )),
          Expanded(
            child: SizedBox(
                height: pageViewHeight,
                child: PageView.builder(
                  onPageChanged: _onPageChanged,
                  itemCount: widget.carouselData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: widget.carouselData[index],
                    );
                  },
                )),
          ),
          SizedBox(
            height: pageIndicatorHeight,
            child: PageIndicator(
              count: widget.carouselData.length,
              activePage: _page,
              pageIndicatorStyle: widget.pageIndicatorStyle,
            ),
          ),
          widget.footerWidget ?? SizedBox.shrink(),
          const SizedBox(
            height: marginBottom,
          )
        ],
      ),
    );
  }
}
