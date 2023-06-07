import 'package:flutter/material.dart';

import 'page_indicator_style_model.dart';

class CarouselPageIndicator extends StatelessWidget {
  /// No of dot to be appeared should be equal to
  /// the length of the [List<OnBoardModel>]
  final int count;

  /// Active page
  final int activePage;

  /// styling [PageIndicatorStyle]
  final CarouselPageIndicatorStyle pageIndicatorStyle;

  const CarouselPageIndicator({
    Key? key,
    required this.count,
    required this.activePage,
    required this.pageIndicatorStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dots = List.generate(count, _dotBuilder);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOutSine,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _dots,
      ),
    );
  }

  Widget _dotBuilder(index) {
    final activeSize = pageIndicatorStyle.activeSize;
    final inactiveSize = pageIndicatorStyle.inactiveSize;

    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: pageIndicatorStyle.spaceBetween / 2),
        child: index == activePage
            ? Container(
                width: activeSize.width,
                height: activeSize.height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: pageIndicatorStyle.activeColor,
                ),
              )
            : Container(
                width: inactiveSize.width,
                height: inactiveSize.height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: pageIndicatorStyle.inactiveColor,
                ),
              ));
  }
}
