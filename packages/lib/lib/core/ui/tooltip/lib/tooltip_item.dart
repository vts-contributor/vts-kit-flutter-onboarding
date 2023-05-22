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
import 'package:vts_kit_flutter_onboarding/index.dart';

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

  //#region Rendering

  /// Height of [container]
  final double height;

  /// Width of [container]
  final double width;

  //#endregion

  //#region Rendering (text)

  /// Represents subject line of target widget
  final String? title;

  /// Provides padding around the title. Default padding is zero.
  final EdgeInsets? titlePadding;

  /// TextStyle for default tooltip title
  final TextStyle? titleTextStyle;

  /// Title alignment with in tooltip widget
  ///
  /// Defaults to [TextAlign.start]
  final TextAlign titleAlignment;

  /// Provides text direction of tooltip title.
  final TextDirection? titleTextDirection;

  /// Represents summary description of target widget
  final String? description;

  /// Provides padding around the description. Default padding is zero.
  final EdgeInsets? descPadding;

  /// TextStyle for default tooltip description
  final TextStyle? descTextStyle;

  /// Description alignment with in tooltip widget
  ///
  /// Defaults to [TextAlign.start]
  final TextAlign descAlignment;

  /// Provides text direction of tooltip description.
  final TextDirection? descTextDirection;

  //#endregion

  //#region Rendering (custom)

  /// Custom tooltip widget
  final Widget? widget;

  //#endregion

  //#region Tooltip Decoration

  /// Whether the default tooltip will have arrow to point out the target widget.
  ///
  /// Default to `true`
  final bool showArrow;

  /// Empty space around tooltip content.
  ///
  /// Default Value for [TooltipItem] widget is:
  /// ```dart
  /// EdgeInsets.symmetric(vertical: 8, horizontal: 8)
  /// ```
  final EdgeInsets tooltipPadding;

  /// Defines background color for tooltip widget.
  ///
  /// Default to [Colors.white]
  final Color tooltipBackgroundColor;

  /// Border Radius of default tooltip
  ///
  /// Default to [BorderRadius.circular(8)]
  final Radius tooltipBorderRadius;

  /// Defines vertical position of tooltip respective to Target widget
  ///
  /// Defaults to adaptive into available space.
  final TooltipPosition? tooltipPosition;

  /// Background color of overlay.
  final Color overlayColor;

  /// Opacity apply on [overlayColor] (which ranges from 0.0 to 1.0)
  ///
  /// Default to 0.75
  final double overlayOpacity;

  final bool showFooter;
  final String? nextText;
  final String? prevText;
  final String Function(int current, int total)? nextTextFn;
  final String Function(int current, int total)? prevTextFn;
  final ButtonStyle? nextBtnStyle;
  final ButtonStyle? prevBtnStyle;
  final bool showCurrent;
  final TextStyle? currentTextStyle;
  final TextStyle? totalTextStyle;
  final bool allowBack;
  final VoidCallback? onNextClick;
  final VoidCallback? onPrevClick;
  final Widget? footer;
  final EdgeInsets footerPadding;

  final bool showDismissIcon;
  final Widget? dismissIcon;

  //#endregion

  //#region Tooltip Options

  /// Whether tooltip should have bouncing animation while highlighting
  ///
  /// If null value is provided,
  /// [UITooltip.disableAnimation] will be considered.
  final bool? disableMovingAnimation;

  /// The duration of time the bouncing animation of tooltip should last.
  ///
  /// Default to [Duration(milliseconds: 2000)]
  final Duration movingAnimationDuration;

  /// Whether disabling initial scale animation for default tooltip when
  /// highlighted is started and completed
  ///
  /// Default to `false`
  final bool? disableScaleAnimation;

  /// Will dispose all highlighted if tapped on target widget or tooltip
  ///
  /// Note: [onTargetClick] is required if you're using [disposeOnTap]
  /// otherwise throws error
  final bool? disposeOnTap;

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

  /// if `disableDefaultTargetGestures` parameter is true
  /// onTargetClick, onTargetDoubleTap, onTargetLongPress and
  /// disposeOnTap parameter will not work
  ///
  /// Note: If `disableDefaultTargetGestures` is true then make sure to
  /// dismiss current item with `UITooltip.of(context).dismiss()`
  /// if you are navigating to other screen. This will be handled by default
  /// if `disableDefaultTargetGestures` is set to false.
  final bool disableDefaultTargetGestures;

  /// If [enableAutoScroll] is sets to `true`, this widget will be shown above
  /// the overlay until the target widget is visible in the viewport.
  final Widget? scrollLoadingWidget;

  final double scrollAlign;

  //#endregion

  //#region Target & Outline

  /// Padding around target widget
  ///
  /// Default to [EdgeInsets.zero]
  final EdgeInsets targetPadding;

  /// Radius of rectangle box while target widget is being highlighted.
  final Radius targetBorderRadius;

  // Whether object shape is circle
  final bool isCircle;

  final EdgeInsets outlinePadding;
  final List<double> outlinePattern;
  final double outlineWidth;
  final Color outlineColor;

  //#endregion

  //#region Events

  /// Triggered when highlighted target widget is tapped
  ///
  /// Note: [disposeOnTap] is required if you're using [onTargetClick]
  /// otherwise throws error
  final VoidCallback? onTargetClick;

  /// Provides a callback when barrier has been clicked.
  ///
  /// Note-: Even if barrier interactions are disabled, this handler
  /// will still provide a callback.
  final VoidCallback? onBarrierClick;

  /// Triggered when target has been double tapped
  final VoidCallback? onTargetDoubleTap;

  /// Triggered when target has been long pressed.
  ///
  /// Detected when a pointer has remained in contact with the screen at the same location for a long period of time.
  final VoidCallback? onTargetLongPress;

  /// Triggered when default tooltip is tapped
  final VoidCallback? onToolTipClick;

  //#endregion

  //#region Others

  /// Defines blur value.
  /// This will blur the background while displaying item.
  ///
  /// If null value is provided,
  /// [UITooltip.blurValue] will be considered.
  ///
  final double? blurValue;

  //#endregion

  const TooltipItem({
    required this.key,
    required this.child,
    this.width = 200.0,
    this.height = 120.0,
    this.title,
    this.titlePadding = const EdgeInsets.only(bottom: 8.0),
    this.titleTextStyle = const TextStyle(
        color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.bold),
    this.titleAlignment = TextAlign.start,
    this.titleTextDirection,
    this.description,
    this.descPadding,
    this.descTextStyle =
        const TextStyle(color: Colors.black87, fontSize: 16.0, height: 1.4),
    this.descAlignment = TextAlign.start,
    this.descTextDirection,
    this.widget,
    this.showArrow = true,
    this.tooltipPadding =
        const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
    this.tooltipBackgroundColor = Colors.white,
    this.tooltipBorderRadius = const Radius.circular(5.0),
    this.tooltipPosition,
    this.overlayColor = const Color.fromARGB(255, 0, 0, 0),
    this.overlayOpacity = 0.75,
    this.showFooter = true,
    this.nextText = 'Next',
    this.prevText = 'Prev',
    this.nextTextFn,
    this.prevTextFn,
    this.nextBtnStyle = const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0)),
        minimumSize: MaterialStatePropertyAll(Size.zero),
        textStyle:
            MaterialStatePropertyAll(TextStyle(fontSize: 14.0, height: 1.5)),
        backgroundColor:
            MaterialStatePropertyAll(Color.fromARGB(255, 248, 69, 91)),
        shadowColor: MaterialStatePropertyAll(Colors.transparent)),
    this.prevBtnStyle = const ButtonStyle(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0)),
      minimumSize: MaterialStatePropertyAll(Size.zero),
      textStyle:
          MaterialStatePropertyAll(TextStyle(fontSize: 14.0, height: 1.5)),
      foregroundColor:
          MaterialStatePropertyAll(Color.fromARGB(255, 248, 69, 91)),
      side: MaterialStatePropertyAll(BorderSide(
          color: Color.fromARGB(255, 248, 69, 91),
          width: 1.0,
          style: BorderStyle.solid)),
      backgroundColor: MaterialStatePropertyAll<Color>(Colors.transparent),
      shadowColor: MaterialStatePropertyAll<Color>(Colors.transparent),
    ),
    this.showCurrent = true,
    this.currentTextStyle = const TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.bold, height: 1.5),
    this.totalTextStyle = const TextStyle(fontSize: 14.0, height: 1.5),
    this.allowBack = false,
    this.onNextClick,
    this.onPrevClick,
    this.footer,
    this.footerPadding = const EdgeInsets.only(top: 8),
    this.showDismissIcon = true,
    this.dismissIcon,
    this.disableMovingAnimation,
    this.movingAnimationDuration = const Duration(milliseconds: 2000),
    this.disableScaleAnimation = true,
    this.disposeOnTap,
    this.scaleAnimationDuration = const Duration(milliseconds: 300),
    this.scaleAnimationCurve = Curves.easeIn,
    this.scaleAnimationAlignment,
    this.disableDefaultTargetGestures = false,
    this.scrollLoadingWidget,
    this.scrollAlign = 0.5,
    this.targetPadding = const EdgeInsets.all(0.0),
    this.targetBorderRadius = const Radius.circular(5.0),
    this.isCircle = false,
    this.outlinePadding = const EdgeInsets.all(5.0),
    this.outlinePattern = const [8, 8],
    this.outlineWidth = 2.0,
    this.outlineColor = const Color.fromARGB(255, 248, 69, 91),
    this.onTargetClick,
    this.onToolTipClick,
    this.onTargetLongPress,
    this.onTargetDoubleTap,
    this.onBarrierClick,
    this.blurValue,
  })  : assert(widget != null || description != null,
            "widget or description is required"),
        assert(nextText != null || nextTextFn != null,
            "nextText or nextTextFn is required"),
        assert(prevText != null || prevTextFn != null,
            "prevText or prevTextFn is required"),
        assert(overlayOpacity >= 0.0 && overlayOpacity <= 1.0,
            "overlay opacity must be between 0 and 1."),
        assert(disposeOnTap == null || onTargetClick != null,
            "onTargetClick is required if you're using disposeOnTap");

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
        curve: Curves.bounceIn,
        alignment: widget.scrollAlign,
      );
      Timer(Duration(milliseconds: 200), () {
        setState(() => _isScrollRunning = false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnchoredOverlay(
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
    // if (widget.disposeOnTap == true) {
    //   await _reverseAnimateTooltip();
    //   state.dismiss();
    //   widget.onTargetClick!();
    // } else {
    //   (widget.onTargetClick ?? _nextIfAny).call();
    // }
    widget.onTargetClick?.call();
  }

  Future<void> _getOnTooltipTap() async {
    // if (widget.disposeOnTap == true) {
    //   await _reverseAnimateTooltip();
    //   state.dismiss();
    // }
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
        if (_isScrollRunning)
          widget.scrollLoadingWidget != null
              ? Center(child: widget.scrollLoadingWidget)
              : SizedBox(),
        if (!_isScrollRunning) ...[
          _TargetWidget(
            offset: offset,
            size: size,
            targetPadding: widget.targetPadding,
            onTap: _getOnTargetTap,
            isCircle: widget.isCircle,
            radius: widget.targetBorderRadius,
            outlinePadding: widget.outlinePadding,
            outlinePattern: widget.outlinePattern,
            outlineWidth: widget.outlineWidth,
            outlineColor: widget.outlineColor,
            onDoubleTap: widget.onTargetDoubleTap,
            onLongPress: widget.onTargetLongPress,
            child: widget.child,
          ),
          ToolTipWidget(
              position: position,
              offset: offset,
              screenSize: screenSize,
              title: widget.title,
              titleAlignment: widget.titleAlignment,
              description: widget.description,
              descAlignment: widget.descAlignment,
              titleTextStyle: widget.titleTextStyle,
              descTextStyle: widget.descTextStyle,
              widget: widget.widget,
              tooltipBackgroundColor: widget.tooltipBackgroundColor,
              showArrow: widget.showArrow,
              height: widget.height,
              width: widget.width,
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
              descPadding: widget.descPadding,
              titleTextDirection: widget.titleTextDirection,
              descTextDirection: widget.descTextDirection,
              footerPadding: widget.footerPadding,
              footer: widget.showFooter
                  ? widget.footer ??
                      _DefaultFooter(
                        state: state,
                        showCurrent: widget.showCurrent,
                        currentTextStyle: widget.currentTextStyle,
                        totalTextStyle: widget.totalTextStyle,
                        allowBack: widget.allowBack,
                        nextText: widget.nextText,
                        prevText: widget.prevText,
                        nextTextFn: widget.nextTextFn,
                        prevTextFn: widget.prevTextFn,
                        nextBtnStyle: widget.nextBtnStyle,
                        prevBtnStyle: widget.prevBtnStyle,
                        onNextClick: widget.onNextClick,
                        onPrevClick: widget.onPrevClick,
                      )
                  : null,
              onDismissIconTap: () {
                state.dismiss(manual: true);
              },
              dismissIcon: widget.showDismissIcon
                  ? widget.dismissIcon ?? _DefaultDismissIcon()
                  : null),
        ],
      ],
    );
  }
}

class _TargetWidget extends StatelessWidget {
  final Offset offset;
  final Size? size;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;

  final EdgeInsets targetPadding;

  final bool isCircle;
  final Radius radius;
  final double outlineWidth;
  final Color outlineColor;
  final List<double> outlinePattern;
  final EdgeInsets outlinePadding;

  final Widget child;

  const _TargetWidget({
    Key? key,
    required this.offset,
    required this.child,
    required this.radius,
    required this.outlineWidth,
    required this.outlinePattern,
    required this.outlinePadding,
    required this.outlineColor,
    required this.isCircle,
    required this.targetPadding,
    this.size,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: offset.dy,
      left: offset.dx,
      child: targetWidgetContent(),
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
          color: outlineColor,
          dashPattern: outlinePattern,
          padding: outlinePadding,
          strokeCap: StrokeCap.round,
          radius: radius,
          borderType: isCircle ? BorderType.Circle : BorderType.RRect,
          child: AbsorbPointer(
            child: Material(
              color: Colors.transparent,
              borderRadius: !isCircle ? BorderRadius.all(radius) : null,
              shape: isCircle ? CircleBorder() : null,
              child: Container(
                width: size!.width,
                height: size!.height,
                padding: targetPadding,
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
      ),
    );
  }
}

class _DefaultFooter extends StatefulWidget {
  final ToolTipContext state;
  final bool showCurrent;
  final TextStyle? currentTextStyle;
  final TextStyle? totalTextStyle;
  final bool allowBack;
  final String? nextText;
  final String? prevText;
  final String Function(int current, int total)? nextTextFn;
  final String Function(int current, int total)? prevTextFn;
  final ButtonStyle? nextBtnStyle;
  final ButtonStyle? prevBtnStyle;
  final VoidCallback? onNextClick;
  final VoidCallback? onPrevClick;

  const _DefaultFooter(
      {Key? key,
      required this.state,
      this.allowBack = true,
      this.showCurrent = true,
      this.currentTextStyle,
      this.totalTextStyle,
      this.nextText,
      this.prevText,
      this.nextTextFn,
      this.prevTextFn,
      this.nextBtnStyle,
      this.prevBtnStyle,
      this.onNextClick,
      this.onPrevClick})
      : super(key: key);

  @override
  State<_DefaultFooter> createState() => _DefaultFooterState();
}

class _DefaultFooterState extends State<_DefaultFooter> {
  get showNext => widget.nextText != null;
  get showPrev =>
      widget.allowBack && widget.prevText != null && !widget.state.isFirst();
  get nextTxt => widget.nextTextFn != null
      ? widget.nextTextFn!
          .call(widget.state.activeWidgetId! + 1, widget.state.ids!.length)
      : widget.nextText!;
  get prevTxt => widget.prevTextFn != null
      ? widget.prevTextFn!
          .call(widget.state.activeWidgetId! + 1, widget.state.ids!.length)
      : widget.prevText!;

  _onPrevClick() {
    widget.state.previous();
    widget.onPrevClick?.call();
  }

  _onNextClick() {
    widget.state.next();
    widget.onNextClick?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            if (widget.showCurrent)
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    ((widget.state.activeWidgetId ?? 0) + 1).toString(),
                    style: widget.currentTextStyle,
                  ),
                  Text('/'),
                  Text((widget.state.ids?.length ?? 0).toString(),
                      style: widget.totalTextStyle)
                ],
              )
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                showPrev
                    ? OutlinedButton(
                        child: Text(prevTxt),
                        style: widget.prevBtnStyle,
                        onPressed: _onPrevClick,
                      )
                    : SizedBox(),
                (showNext && showPrev) ? SizedBox(width: 8.0) : SizedBox(),
                showNext
                    ? ElevatedButton(
                        child: Text(nextTxt),
                        style: widget.nextBtnStyle,
                        onPressed: _onNextClick,
                      )
                    : SizedBox(),
              ],
            ),
          ],
        )
      ]),
    );
  }
}

class _DefaultDismissIcon extends StatelessWidget {
  const _DefaultDismissIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(100)),
      child: Icon(
        Icons.cancel,
        color: Color.fromARGB(255, 248, 69, 91),
        size: 24,
      ),
    );
  }
}
