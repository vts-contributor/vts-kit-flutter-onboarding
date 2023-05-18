/*
 * Copyright (c) 2021 Simform Solutions
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import 'package:flutter/material.dart';

import 'enum.dart';
import 'get_position.dart';

const _kDefaultPaddingFromParent = 14.0;

class ToolTipWidget extends StatefulWidget {
  final GetPosition? position;
  final Offset? offset;
  final Size? screenSize;
  final String? title;
  final TextAlign? titleAlignment;
  final String? description;
  final TextAlign? descAlignment;
  final TextStyle? titleTextStyle;
  final TextStyle? descTextStyle;
  final Widget? container;

  final EdgeInsets tooltipPadding;
  final Color tooltipBackgroundColor;
  final Radius tooltipBorderRadius;
  final TooltipPosition? tooltipPosition;

  final bool showArrow;
  final double height;
  final double width;
  final VoidCallback? onTooltipTap;
  final Duration movingAnimationDuration;
  final bool disableMovingAnimation;
  final bool disableScaleAnimation;
  final Duration scaleAnimationDuration;
  final Curve scaleAnimationCurve;
  final Alignment? scaleAnimationAlignment;
  final bool isTooltipDismissed;
  final EdgeInsets? titlePadding;
  final EdgeInsets? descPadding;
  final TextDirection? titleTextDirection;
  final TextDirection? descTextDirection;

  final Widget? footer;
  final EdgeInsets? footerPadding;

  const ToolTipWidget({
    Key? key,
    required this.position,
    required this.offset,
    required this.screenSize,
    required this.title,
    required this.titleAlignment,
    required this.description,
    required this.titleTextStyle,
    required this.descTextStyle,
    required this.container,
    required this.showArrow,
    required this.height,
    required this.width,
    required this.onTooltipTap,
    required this.movingAnimationDuration,
    required this.descAlignment,
    required this.disableMovingAnimation,
    required this.disableScaleAnimation,
    required this.scaleAnimationDuration,
    required this.scaleAnimationCurve,
    required this.tooltipPadding,
    required this.tooltipBackgroundColor,
    required this.tooltipBorderRadius,
    this.footer,
    this.footerPadding,
    this.tooltipPosition,
    this.scaleAnimationAlignment,
    this.isTooltipDismissed = false,
    this.titlePadding,
    this.descPadding,
    this.titleTextDirection,
    this.descTextDirection,
  }) : super(key: key);

  @override
  State<ToolTipWidget> createState() => UITooltipWidgetState();
}

class UITooltipWidgetState extends State<ToolTipWidget>
    with TickerProviderStateMixin {
  Offset? position;

  final arrowWidth = 18.0;
  final arrowHeight = 9.0;
  final tooltipPadding = 8.0;

  bool isArrowUp = false;

  late final AnimationController _movingAnimationController;
  late final Animation<double> _movingAnimation;
  late final AnimationController _scaleAnimationController;
  late final Animation<double> _scaleAnimation;

  double tooltipWidth = 0;
  double tooltipScreenEdgePadding = 20;
  double tooltipTextPadding = 15;

  TooltipPosition findPositionForContent(Offset position) {
    final height = widget.height;
    final bottomPosition =
        position.dy + ((widget.position?.getHeight() ?? 0) / 2);
    final topPosition = position.dy - ((widget.position?.getHeight() ?? 0) / 2);
    final hasSpaceInTop = topPosition >= height;
    final EdgeInsets viewInsets = EdgeInsets.fromWindowPadding(
        WidgetsBinding.instance.window.viewInsets,
        WidgetsBinding.instance.window.devicePixelRatio);
    final double actualVisibleScreenHeight =
        (widget.screenSize?.height ?? MediaQuery.of(context).size.height) -
            viewInsets.bottom;
    final hasSpaceInBottom =
        (actualVisibleScreenHeight - bottomPosition) >= height;
    return widget.tooltipPosition ??
        (hasSpaceInTop && !hasSpaceInBottom
            ? TooltipPosition.top
            : TooltipPosition.bottom);
  }

  double _getTooltipLeft() {
    var space = widget.position!.getCenter() - (widget.width / 2);
    if (space + widget.width > widget.screenSize!.width) {
      space = widget.screenSize!.width - widget.width - 8;
    } else if (space < (widget.width / 2)) {
      space = 16;
    }
    return space;
  }

  double _getArrowLeft() {
    final left = widget.position!.getLeft() +
        widget.position!.getWidth() / 2 -
        arrowWidth / 2;
    return left;
  }

  final GlobalKey _customContainerKey = GlobalKey();
  final ValueNotifier<double> _customContainerWidth = ValueNotifier<double>(1);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.container != null &&
          _customContainerKey.currentContext != null &&
          _customContainerKey.currentContext?.size != null) {
        setState(() {
          _customContainerWidth.value =
              _customContainerKey.currentContext!.size!.width;
        });
      }
    });
    _movingAnimationController = AnimationController(
      duration: widget.movingAnimationDuration,
      vsync: this,
    );
    _movingAnimation = CurvedAnimation(
      parent: _movingAnimationController,
      curve: Curves.easeInOut,
    );
    _scaleAnimationController = AnimationController(
      duration: widget.scaleAnimationDuration,
      vsync: this,
      lowerBound: widget.disableScaleAnimation ? 1 : 0,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _scaleAnimationController,
      curve: widget.scaleAnimationCurve,
    );
    if (widget.disableScaleAnimation) {
      movingAnimationListener();
    } else {
      _scaleAnimationController
        ..addStatusListener((scaleAnimationStatus) {
          if (scaleAnimationStatus == AnimationStatus.completed) {
            movingAnimationListener();
          }
        })
        ..forward();
    }
    if (!widget.disableMovingAnimation) {
      _movingAnimationController.forward();
    }
  }

  void movingAnimationListener() {
    _movingAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _movingAnimationController.reverse();
      }
      if (_movingAnimationController.isDismissed) {
        if (!widget.disableMovingAnimation) {
          _movingAnimationController.forward();
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _movingAnimationController.dispose();
    _scaleAnimationController.dispose();

    super.dispose();
  }

  Widget _renderBodyText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: widget.titlePadding ?? EdgeInsets.zero,
              child: Text(
                widget.title!,
                textAlign: widget.titleAlignment,
                textDirection: widget.titleTextDirection,
                style: widget.titleTextStyle ??
                    Theme.of(context).textTheme.titleLarge!,
              ),
            ),
          ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: widget.descPadding ?? EdgeInsets.zero,
            child: Text(
              widget.description!,
              textAlign: widget.descAlignment,
              textDirection: widget.descTextDirection,
              style: widget.descTextStyle ??
                  Theme.of(context).textTheme.titleMedium!,
            ),
          ),
        )
      ],
    );
  }

  Widget _renderBodyCustom(BuildContext context) {
    return widget.container!;
  }

  Widget _renderFooter(BuildContext context) {
    return Container(
      padding: widget.footerPadding,
      child: widget.footer,
    );
  }

  @override
  Widget build(BuildContext context) {
    position = widget.offset;
    final contentOrientation = findPositionForContent(position!);
    final contentOffsetMultiplier =
        contentOrientation == TooltipPosition.bottom ? 1.0 : -1.0;
    isArrowUp = contentOffsetMultiplier == 1.0;

    final contentY = isArrowUp
        ? widget.position!.getBottom() + (contentOffsetMultiplier * 3)
        : widget.position!.getTop() + (contentOffsetMultiplier * 3);

    final num contentFractionalOffset =
        contentOffsetMultiplier.clamp(-1.0, 0.0);

    if (!widget.disableScaleAnimation && widget.isTooltipDismissed) {
      _scaleAnimationController.reverse();
    }

    return Stack(
      children: [
        if (widget.showArrow)
          Positioned(
            left: _getArrowLeft(),
            top: contentY,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: FractionalTranslation(
                translation: Offset(0.0, contentFractionalOffset as double),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0.0, 0),
                    end: const Offset(0.0, 0.100),
                  ).animate(_movingAnimation),
                  child: Padding(
                    padding: isArrowUp
                        ? EdgeInsets.only(top: tooltipPadding)
                        : EdgeInsets.only(bottom: tooltipPadding),
                    child: CustomPaint(
                      painter: _Arrow(
                        strokeColor: widget.tooltipBackgroundColor,
                        strokeWidth: 10,
                        paintingStyle: PaintingStyle.fill,
                        isUpArrow: isArrowUp,
                      ),
                      child: SizedBox(
                        height: arrowHeight,
                        width: arrowWidth,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        Positioned(
          left: _getTooltipLeft(),
          top: contentY,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: FractionalTranslation(
              translation: Offset(0.0, contentFractionalOffset as double),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0.0, 0),
                  end: const Offset(0.0, 0.100),
                ).animate(_movingAnimation),
                child: Material(
                  type: MaterialType.transparency,
                  child: Container(
                    padding: isArrowUp
                        ? EdgeInsets.only(top: tooltipPadding)
                        : EdgeInsets.only(bottom: tooltipPadding),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: isArrowUp ? arrowHeight - 1 : 0,
                            bottom: isArrowUp ? 0 : arrowHeight - 1,
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(widget.tooltipBorderRadius),
                            child: GestureDetector(
                              onTap: widget.onTooltipTap,
                              child: Container(
                                width: widget.width,
                                padding: widget.tooltipPadding,
                                color: widget.tooltipBackgroundColor,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    widget.description != null
                                        ? _renderBodyText(context)
                                        : _renderBodyCustom(context),
                                    widget.footer != null
                                        ? _renderFooter(context)
                                        : SizedBox()
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void onSizeChange(Size? size) {
    var tempPos = position;
    tempPos = Offset(position!.dx, position!.dy + size!.height);
    setState(() => position = tempPos);
  }
}

class _Arrow extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;
  final bool isUpArrow;
  final Paint _paint;

  _Arrow({
    this.strokeColor = Colors.black,
    this.strokeWidth = 3,
    this.paintingStyle = PaintingStyle.stroke,
    this.isUpArrow = true,
  }) : _paint = Paint()
          ..color = strokeColor
          ..strokeWidth = strokeWidth
          ..style = paintingStyle;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(getTrianglePath(size.width, size.height), _paint);
  }

  Path getTrianglePath(double x, double y) {
    if (isUpArrow) {
      return Path()
        ..moveTo(0, y)
        ..lineTo(x / 2, 0)
        ..lineTo(x, y)
        ..lineTo(0, y);
    }
    return Path()
      ..moveTo(0, 0)
      ..lineTo(x, 0)
      ..lineTo(x / 2, y)
      ..lineTo(0, 0);
  }

  @override
  bool shouldRepaint(covariant _Arrow oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
