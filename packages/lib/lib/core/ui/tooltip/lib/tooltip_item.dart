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

import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/tooltip/lib/context.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/tooltip/lib/dotted_border.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/tooltip/tooltip.dart';

import 'enum.dart';
import 'extension.dart';
import 'get_position.dart';
import 'layout_overlays.dart';
import 'shape_clipper.dart';
import 'tooltip_widget.dart';

class TooltipItem extends StatefulWidget {
  /// A key that is unique across the entire app.
  ///
  /// This Key will be used to control state of individual item and also
  /// used in [UITooltip.start] to define position of current
  /// target widget while highlighting.
  @override
  final GlobalKey key;

  /// Target widget that will be highlighted
  final Widget child;

  /// Represents subject line of target widget
  final String? title;

  /// Title alignment with in tooltip widget
  ///
  /// Defaults to [TextAlign.start]
  final TextAlign titleAlignment;

  /// Represents summary description of target widget
  final String? description;

  /// Radius of rectangle box while target widget is being highlighted.
  final Radius targetBorderRadius;

  // Whether object shape is circle
  final bool isCircle;

  /// TextStyle for default tooltip title
  final TextStyle? titleTextStyle;

  /// TextStyle for default tooltip description
  final TextStyle? descTextStyle;

  /// Empty space around tooltip content.
  ///
  /// Default Value for [TooltipItem] widget is:
  /// ```dart
  /// EdgeInsets.symmetric(vertical: 8, horizontal: 8)
  /// ```
  final EdgeInsets tooltipPadding;

  /// Background color of overlay.
  ///
  /// Default value is [Colors.black45]
  final Color overlayColor;

  /// Opacity apply on [overlayColor] (which ranges from 0.0 to 1.0)
  ///
  /// Default to 0.75
  final double overlayOpacity;

  /// Custom tooltip widget when [TooltipItem.withWidget] is used.
  final Widget? container;

  /// Defines background color for tooltip widget.
  ///
  /// Default to [Colors.white]
  final Color tooltipBackgroundColor;

  /// Defines text color of default tooltip when [titleTextStyle] and
  /// [descTextStyle] is not provided.
  ///
  /// Default to [Colors.black]
  final Color textColor;

  /// If [enableAutoScroll] is sets to `true`, this widget will be shown above
  /// the overlay until the target widget is visible in the viewport.
  final Widget scrollLoadingWidget;

  /// Whether the default tooltip will have arrow to point out the target widget.
  ///
  /// Default to `true`
  final bool showArrow;

  /// Height of [container]
  final double? height;

  /// Width of [container]
  final double? width;

  /// The duration of time the bouncing animation of tooltip should last.
  ///
  /// Default to [Duration(milliseconds: 2000)]
  final Duration movingAnimationDuration;

  /// Triggered when default tooltip is tapped
  final VoidCallback? onToolTipClick;

  /// Triggered when highlighted target widget is tapped
  ///
  /// Note: [disposeOnTap] is required if you're using [onTargetClick]
  /// otherwise throws error
  final VoidCallback? onTargetClick;

  /// Will dispose all highlighted if tapped on target widget or tooltip
  ///
  /// Note: [onTargetClick] is required if you're using [disposeOnTap]
  /// otherwise throws error
  final bool? disposeOnTap;

  /// Whether tooltip should have bouncing animation while highlighting
  ///
  /// If null value is provided,
  /// [UITooltip.disableAnimation] will be considered.
  final bool? disableMovingAnimation;

  /// Whether disabling initial scale animation for default tooltip when
  /// highlighted is started and completed
  ///
  /// Default to `false`
  final bool? disableScaleAnimation;

  /// Padding around target widget
  ///
  /// Default to [EdgeInsets.zero]
  final EdgeInsets targetPadding;

  /// Triggered when target has been double tapped
  final VoidCallback? onTargetDoubleTap;

  /// Triggered when target has been long pressed.
  ///
  /// Detected when a pointer has remained in contact with the screen at the same location for a long period of time.
  final VoidCallback? onTargetLongPress;

  /// Border Radius of default tooltip
  ///
  /// Default to [BorderRadius.circular(8)]
  final BorderRadius? tooltipBorderRadius;

  /// Description alignment with in tooltip widget
  ///
  /// Defaults to [TextAlign.start]
  final TextAlign descriptionAlignment;

  /// if `disableDefaultTargetGestures` parameter is true
  /// onTargetClick, onTargetDoubleTap, onTargetLongPress and
  /// disposeOnTap parameter will not work
  ///
  /// Note: If `disableDefaultTargetGestures` is true then make sure to
  /// dismiss current item with `UITooltip.of(context).dismiss()`
  /// if you are navigating to other screen. This will be handled by default
  /// if `disableDefaultTargetGestures` is set to false.
  final bool disableDefaultTargetGestures;

  /// Defines blur value.
  /// This will blur the background while displaying item.
  ///
  /// If null value is provided,
  /// [UITooltip.blurValue] will be considered.
  ///
  final double? blurValue;

  /// A duration for animation which is going to played when
  /// tooltip comes first time in the view.
  ///
  /// Defaults to 300 ms.
  final Duration scaleAnimationDuration;

  /// The curve to be used for initial animation of tooltip.
  ///
  /// Defaults to Curves.easeIn
  final Curve scaleAnimationCurve;

  /// An alignment to origin of initial tooltip animation.
  ///
  /// Alignment will be pre-calculated but if pre-calculated
  /// alignment doesn't work then this parameter can be
  /// used to customise the direction of the tooltip animation.
  ///
  /// eg.
  /// ```dart
  ///     Alignment(-0.2,0.3) or Alignment.centerLeft
  /// ```
  final Alignment? scaleAnimationAlignment;

  /// Defines vertical position of tooltip respective to Target widget
  ///
  /// Defaults to adaptive into available space.
  final TooltipPosition? tooltipPosition;

  /// Provides padding around the title. Default padding is zero.
  final EdgeInsets? titlePadding;

  /// Provides padding around the description. Default padding is zero.
  final EdgeInsets? descriptionPadding;

  /// Provides text direction of tooltip title.
  final TextDirection? titleTextDirection;

  /// Provides text direction of tooltip description.
  final TextDirection? descriptionTextDirection;

  /// Provides a callback when barrier has been clicked.
  ///
  /// Note-: Even if barrier interactions are disabled, this handler
  /// will still provide a callback.
  final VoidCallback? onBarrierClick;

  final EdgeInsets outlinePadding;
  final List<double> outlinePattern;
  final double outlineWidth;

  const TooltipItem(
      {required this.key,
      this.description,
      required this.child,
      this.container,
      this.title,
      this.titleAlignment = TextAlign.start,
      this.descriptionAlignment = TextAlign.start,
      this.overlayColor = Colors.black45,
      this.overlayOpacity = 0.75,
      this.titleTextStyle,
      this.descTextStyle,
      this.tooltipBackgroundColor = Colors.white,
      this.textColor = Colors.black,
      this.scrollLoadingWidget = const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.white),
      ),
      this.showArrow = true,
      this.onTargetClick,
      this.disposeOnTap,
      this.movingAnimationDuration = const Duration(milliseconds: 2000),
      this.disableMovingAnimation = true,
      this.disableScaleAnimation,
      this.tooltipPadding =
          const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      this.onToolTipClick,
      this.targetPadding = const EdgeInsets.all(5.0),
      this.blurValue,
      this.targetBorderRadius = const Radius.circular(8.0),
      this.isCircle = false,
      this.onTargetLongPress,
      this.onTargetDoubleTap,
      this.tooltipBorderRadius,
      this.disableDefaultTargetGestures = false,
      this.scaleAnimationDuration = const Duration(milliseconds: 300),
      this.scaleAnimationCurve = Curves.easeIn,
      this.scaleAnimationAlignment,
      this.tooltipPosition,
      this.titlePadding,
      this.descriptionPadding,
      this.titleTextDirection,
      this.descriptionTextDirection,
      this.onBarrierClick,
      this.outlinePadding = const EdgeInsets.all(5.0),
      this.outlinePattern = const [8, 8],
      this.outlineWidth = 2.0})
      : height = null,
        width = null,
        assert(overlayOpacity >= 0.0 && overlayOpacity <= 1.0,
            "overlay opacity must be between 0 and 1."),
        assert(onTargetClick == null || disposeOnTap != null,
            "disposeOnTap is required if you're using onTargetClick"),
        assert(disposeOnTap == null || onTargetClick != null,
            "onTargetClick is required if you're using disposeOnTap");

  // const TooltipItem.withWidget(
  //     {required this.key,
  //     required this.height,
  //     required this.width,
  //     required this.container,
  //     required this.child,
  //     this.overlayColor = Colors.black45,
  //     this.targetBorderRadius,
  //     this.overlayOpacity = 0.75,
  //     this.scrollLoadingWidget = const CircularProgressIndicator(
  //         valueColor: AlwaysStoppedAnimation(Colors.white)),
  //     this.onTargetClick,
  //     this.disposeOnTap,
  //     this.movingAnimationDuration = const Duration(milliseconds: 2000),
  //     this.disableMovingAnimation,
  //     this.targetPadding = EdgeInsets.zero,
  //     this.blurValue,
  //     this.onTargetLongPress,
  //     this.onTargetDoubleTap,
  //     this.disableDefaultTargetGestures = false,
  //     this.tooltipPosition,
  //     this.onBarrierClick})
  //     : showArrow = false,
  //       onToolTipClick = null,
  //       scaleAnimationDuration = const Duration(milliseconds: 300),
  //       scaleAnimationCurve = Curves.decelerate,
  //       scaleAnimationAlignment = null,
  //       disableScaleAnimation = null,
  //       title = null,
  //       description = null,
  //       titleAlignment = TextAlign.start,
  //       descriptionAlignment = TextAlign.start,
  //       titleTextStyle = null,
  //       descTextStyle = null,
  //       tooltipBackgroundColor = Colors.white,
  //       textColor = Colors.black,
  //       tooltipBorderRadius = null,
  //       tooltipPadding = const EdgeInsets.symmetric(vertical: 8),
  //       titlePadding = null,
  //       descriptionPadding = null,
  //       titleTextDirection = null,
  //       descriptionTextDirection = null,
  //       assert(overlayOpacity >= 0.0 && overlayOpacity <= 1.0,
  //           "overlay opacity must be between 0 and 1.");

  @override
  State<TooltipItem> createState() => _TooltipItemState();
}

class _TooltipItemState extends State<TooltipItem> {
  bool _showItem = false;
  bool _isScrollRunning = false;
  bool _isTooltipDismissed = false;
  Timer? timer;
  GetPosition? position;

  ToolTipContext get state => context.read<ToolTipContext>();

  @override
  void initState() {
    super.initState();
    context.read<ToolTipContext>().addListener(() {
      showOverlay();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    position ??= GetPosition(
      key: widget.key,
      padding: widget.targetPadding,
      screenWidth: MediaQuery.of(context).size.width,
      screenHeight: MediaQuery.of(context).size.height,
    );
    showOverlay();
  }

  /// show overlay if there is any target widget
  void showOverlay() {
    final activeStep = state.getActiveWidgetKey();
    setState(() {
      _showItem = activeStep == widget.key;
    });

    if (activeStep == widget.key) {
      if (state.enableAutoScroll) {
        _scrollIntoView();
      }

      if (state.autoPlay) {
        timer =
            Timer(Duration(seconds: state.autoPlayDelay.inSeconds), _nextIfAny);
      }
    }
  }

  void _scrollIntoView() {
    ambiguate(WidgetsBinding.instance)?.addPostFrameCallback((timeStamp) async {
      setState(() => _isScrollRunning = true);
      await Scrollable.ensureVisible(
        widget.key.currentContext!,
        duration: state.scrollDuration,
        alignment: 0.5,
      );
      setState(() => _isScrollRunning = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnchoredOverlay(
        padding: widget.targetPadding,
        overlayBuilder: (context, rectBound, offset) {
          final size = MediaQuery.of(context).size;
          position = GetPosition(
            key: widget.key,
            padding: widget.targetPadding,
            screenWidth: size.width,
            screenHeight: size.height,
          );
          return buildOverlayOnTarget(offset, rectBound.size, rectBound, size);
        },
        showOverlay: true,
        child: widget.child);
  }

  Future<void> _nextIfAny() async {
    if (timer != null && timer!.isActive) {
      if (state.enableAutoPlayLock) {
        return;
      }
      timer!.cancel();
    } else if (timer != null && !timer!.isActive) {
      timer = null;
    }
    await _reverseAnimateTooltip();
    state.completed(widget.key);
  }

  Future<void> _getOnTargetTap() async {
    if (widget.disposeOnTap == true) {
      await _reverseAnimateTooltip();
      state.dismiss();
      widget.onTargetClick!();
    } else {
      (widget.onTargetClick ?? _nextIfAny).call();
    }
  }

  Future<void> _getOnTooltipTap() async {
    if (widget.disposeOnTap == true) {
      await _reverseAnimateTooltip();
      state.dismiss();
    }
    widget.onToolTipClick?.call();
  }

  /// Reverse animates the provided tooltip or
  /// the custom container widget.
  Future<void> _reverseAnimateTooltip() async {
    setState(() => _isTooltipDismissed = true);
    await Future<dynamic>.delayed(widget.scaleAnimationDuration);
    _isTooltipDismissed = false;
  }

  Widget buildOverlayOnTarget(
    Offset offset,
    Size size,
    Rect rectBound,
    Size screenSize,
  ) {
    var blur = 0.0;
    if (_showItem) {
      blur = widget.blurValue ?? state.blurValue;
    }

    // Set blur to 0 if application is running on web and
    // provided blur is less than 0.
    blur = kIsWeb && blur < 0 ? 0 : blur;

    if (!_showItem) return const Offstage();

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (!state.disableBarrierInteraction) {
              _nextIfAny();
            }
            widget.onBarrierClick?.call();
          },
          child: ClipPath(
            clipper: RRectClipper(
                area: _isScrollRunning ? Rect.zero : rectBound,
                isCircle: widget.isCircle,
                radius: _isScrollRunning
                    ? BorderRadius.zero
                    : BorderRadius.all(widget.targetBorderRadius),
                // overlayPadding:
                //     _isScrollRunning ? EdgeInsets.zero : widget.targetPadding,
                overlayPadding: EdgeInsets.zero),
            child: blur != 0
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: widget.overlayColor
                            .withOpacity(widget.overlayOpacity),
                      ),
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: widget.overlayColor
                          .withOpacity(widget.overlayOpacity),
                    ),
                  ),
          ),
        ),
        if (_isScrollRunning) Center(child: widget.scrollLoadingWidget),
        if (!_isScrollRunning) ...[
          _TargetWidget(
            offset: offset,
            size: size,
            padding: widget.targetPadding,
            onTap: _getOnTargetTap,
            isCircle: widget.isCircle,
            radius: widget.targetBorderRadius,
            outlinePadding: widget.outlinePadding,
            outlinePattern: widget.outlinePattern,
            outlineWidth: widget.outlineWidth,
            onDoubleTap: widget.onTargetDoubleTap,
            onLongPress: widget.onTargetLongPress,
            disableDefaultChildGestures: widget.disableDefaultTargetGestures,
            child: widget.child,
          ),
          ToolTipWidget(
            position: position,
            offset: offset,
            screenSize: screenSize,
            title: widget.title,
            titleAlignment: widget.titleAlignment,
            description: widget.description,
            descriptionAlignment: widget.descriptionAlignment,
            titleTextStyle: widget.titleTextStyle,
            descTextStyle: widget.descTextStyle,
            container: widget.container,
            tooltipBackgroundColor: widget.tooltipBackgroundColor,
            textColor: widget.textColor,
            showArrow: widget.showArrow,
            contentHeight: widget.height ?? screenSize.height * 0.5,
            contentWidth: widget.width ?? screenSize.width * 0.5,
            onTooltipTap: _getOnTooltipTap,
            tooltipPadding: widget.tooltipPadding,
            disableMovingAnimation:
                widget.disableMovingAnimation ?? state.disableMovingAnimation,
            disableScaleAnimation:
                widget.disableScaleAnimation ?? state.disableScaleAnimation,
            movingAnimationDuration: widget.movingAnimationDuration,
            tooltipBorderRadius: widget.tooltipBorderRadius,
            scaleAnimationDuration: widget.scaleAnimationDuration,
            scaleAnimationCurve: widget.scaleAnimationCurve,
            scaleAnimationAlignment: widget.scaleAnimationAlignment,
            isTooltipDismissed: _isTooltipDismissed,
            tooltipPosition: widget.tooltipPosition,
            titlePadding: widget.titlePadding,
            descriptionPadding: widget.descriptionPadding,
            titleTextDirection: widget.titleTextDirection,
            descriptionTextDirection: widget.descriptionTextDirection,
          ),
        ],
      ],
    );
  }
}

class _TargetWidget extends StatelessWidget {
  final Offset offset;
  final Size? size;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;

  final bool isCircle;
  final Radius radius;
  final double outlineWidth;
  final List<double> outlinePattern;
  final EdgeInsets outlinePadding;

  final bool disableDefaultChildGestures;
  final Widget child;

  const _TargetWidget({
    Key? key,
    required this.offset,
    required this.child,
    required this.radius,
    required this.outlineWidth,
    required this.outlinePattern,
    required this.outlinePadding,
    required this.isCircle,
    this.size,
    this.padding = EdgeInsets.zero,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.disableDefaultChildGestures = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: offset.dy,
      left: offset.dx,
      child: disableDefaultChildGestures
          ? IgnorePointer(
              child: targetWidgetContent(),
            )
          : targetWidgetContent(),
    );
  }

  Widget targetWidgetContent() {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        child: DottedBorder(
          strokeWidth: outlineWidth,
          color: Colors.redAccent,
          dashPattern: outlinePattern,
          padding: outlinePadding,
          strokeCap: StrokeCap.round,
          radius: radius,
          borderType: isCircle ? BorderType.Circle : BorderType.RRect,
          child: Material(
            borderRadius: !isCircle ? BorderRadius.all(radius) : null,
            shape: isCircle ? CircleBorder() : null,
            child: Container(
              padding: padding,
              decoration: ShapeDecoration(
                shape: isCircle
                    ? CircleBorder()
                    : RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(radius)),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
