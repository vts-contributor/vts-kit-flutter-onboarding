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

  //#region Rendering

  /// Height of [container]
  final double? height;

  /// Width of [container]
  final double? width;

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
  final TextAlign? titleAlignment;

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
  final TextAlign? descAlignment;

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
  final bool? showArrow;

  /// Empty space around tooltip content.
  ///
  /// Default Value for [TooltipItem] widget is:
  /// ```dart
  /// EdgeInsets.symmetric(vertical: 8, horizontal: 8)
  /// ```
  final EdgeInsets? tooltipPadding;

  /// Defines background color for tooltip widget.
  ///
  /// Default to [Colors.white]
  final Color? tooltipBackgroundColor;

  /// Border Radius of default tooltip
  ///
  /// Default to [BorderRadius.circular(8)]
  final Radius? tooltipBorderRadius;

  /// Defines vertical position of tooltip respective to Target widget
  ///
  /// Defaults to adaptive into available space.
  final TooltipPosition? tooltipPosition;

  /// Background color of overlay.
  final Color? overlayColor;

  /// Opacity apply on [overlayColor] (which ranges from 0.0 to 1.0)
  ///
  /// Default to 0.75
  final double? overlayOpacity;

  final bool? showFooter;
  final String? nextText;
  final String? prevText;
  final String Function(int current, int total)? nextTextFn;
  final String Function(int current, int total)? prevTextFn;
  final ButtonStyle? nextBtnStyle;
  final ButtonStyle? prevBtnStyle;
  final bool? showCurrent;
  final TextStyle? currentTextStyle;
  final TextStyle? totalTextStyle;
  final bool? allowBack;
  final VoidCallback? onNextClick;
  final VoidCallback? onPrevClick;
  final Widget? footer;
  final EdgeInsets? footerPadding;

  final bool? showDismissIcon;
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
  final Duration? movingAnimationDuration;

  /// Whether disabling initial scale animation for default tooltip when
  /// highlighted is started and completed
  ///
  /// Default to `false`
  final bool? disableScaleAnimation;

  /// A duration for animation which is going to played when
  /// tooltip comes first time in the view.
  ///
  /// Defaults to 300 ms.
  final Duration? scaleAnimationDuration;

  /// The curve to be used for initial animation of tooltip.
  ///
  /// Defaults to Curves.easeIn
  final Curve? scaleAnimationCurve;

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

  /// While target widget is out viewport then
  /// whether enabling auto scroll so as to make the target widget visible.
  final bool? autoScroll;

  /// Provides time duration for auto scrolling when [autoScroll] is true
  final Duration? scrollDuration;

  /// If [autoScroll] is sets to `true`, this widget will be shown above
  /// the overlay until the target widget is visible in the viewport.
  final Widget? scrollLoadingWidget;

  /// Scroll alignment relative to screen view
  final double? scrollAlign;

  /// This will blur the background while displaying item.
  final double? blurValue;

  //#endregion

  //#region Target & Outline

  /// Padding around target widget
  ///
  /// Default to [EdgeInsets.zero]
  final EdgeInsets? targetPadding;

  /// Radius of rectangle box while target widget is being highlighted.
  final Radius? targetBorderRadius;

  // Whether object shape is circle
  final bool? isCircle;

  final EdgeInsets? outlinePadding;
  final List<double>? outlinePattern;
  final double? outlineWidth;
  final Color? outlineColor;

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

  const TooltipItem({
    required this.key,
    required this.child,
    this.width,
    this.height,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.titleAlignment,
    this.titleTextDirection,
    this.description,
    this.descPadding,
    this.descTextStyle,
    this.descAlignment,
    this.descTextDirection,
    this.widget,
    this.showArrow,
    this.tooltipPadding,
    this.tooltipBackgroundColor,
    this.tooltipBorderRadius,
    this.tooltipPosition,
    this.overlayColor,
    this.overlayOpacity,
    this.showFooter,
    this.nextText,
    this.prevText,
    this.nextTextFn,
    this.prevTextFn,
    this.nextBtnStyle,
    this.prevBtnStyle,
    this.showCurrent,
    this.currentTextStyle,
    this.totalTextStyle,
    this.allowBack,
    this.onNextClick,
    this.onPrevClick,
    this.footer,
    this.footerPadding,
    this.showDismissIcon,
    this.dismissIcon,
    this.disableMovingAnimation,
    this.movingAnimationDuration,
    this.disableScaleAnimation,
    this.scaleAnimationDuration,
    this.scaleAnimationCurve,
    this.scaleAnimationAlignment,
    this.autoScroll,
    this.scrollDuration,
    this.scrollLoadingWidget,
    this.scrollAlign,
    this.blurValue,
    this.targetPadding,
    this.targetBorderRadius,
    this.isCircle,
    this.outlinePadding,
    this.outlinePattern,
    this.outlineWidth,
    this.outlineColor,
    this.onTargetClick,
    this.onToolTipClick,
    this.onTargetLongPress,
    this.onTargetDoubleTap,
    this.onBarrierClick,
  }) : assert(widget != null || description != null,
            "widget or description is required");

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
      padding: widget.targetPadding ?? state.targetPadding,
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
      if ((widget.autoScroll == null && state.autoScroll) ||
          (widget.autoScroll == true)) {
        _scrollIntoView();
      }
    }
  }

  void _scrollIntoView() {
    ambiguate(WidgetsBinding.instance)?.addPostFrameCallback((timeStamp) async {
      setState(() => _isScrollRunning = true);
      await Scrollable.ensureVisible(
        widget.key.currentContext!,
        duration: widget.scrollDuration ?? state.scrollDuration,
        curve: Curves.bounceIn,
        alignment: widget.scrollAlign ?? state.scrollAlign,
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
            padding: widget.targetPadding ?? state.targetPadding,
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
      timer!.cancel();
    } else if (timer != null && !timer!.isActive) {
      timer = null;
    }
    await _reverseAnimateTooltip();
    state.completed(widget.key);
  }

  Future<void> _getOnTargetTap() async {
    widget.onTargetClick?.call();
  }

  Future<void> _getOnTooltipTap() async {
    widget.onToolTipClick?.call();
  }

  /// Reverse animates the provided tooltip or
  /// the custom container widget.
  Future<void> _reverseAnimateTooltip() async {
    setState(() => _isTooltipDismissed = true);
    await Future<dynamic>.delayed(
        widget.scaleAnimationDuration ?? state.scaleAnimationDuration);
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
            widget.onBarrierClick?.call();
          },
          child: ClipPath(
            clipper: RRectClipper(
                area: _isScrollRunning ? Rect.zero : rectBound,
                isCircle: (widget.isCircle == true) ||
                    (widget.isCircle == null && state.isCircle),
                radius: _isScrollRunning
                    ? BorderRadius.zero
                    : BorderRadius.all(
                        widget.targetBorderRadius ?? state.targetBorderRadius),
                overlayPadding: EdgeInsets.zero),
            child: blur != 0
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: widget.overlayColor?.withOpacity(
                                widget.overlayOpacity ??
                                    state.overlayOpacity) ??
                            state.overlayColor.withOpacity(
                                widget.overlayOpacity ?? state.overlayOpacity),
                      ),
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: widget.overlayColor?.withOpacity(
                              widget.overlayOpacity ?? state.overlayOpacity) ??
                          state.overlayColor.withOpacity(
                              widget.overlayOpacity ?? state.overlayOpacity),
                    ),
                  ),
          ),
        ),
        if (_isScrollRunning)
          widget.scrollLoadingWidget != null ||
                  state.scrollLoadingWidget != null
              ? Center(
                  child:
                      widget.scrollLoadingWidget ?? state.scrollLoadingWidget)
              : SizedBox(),
        if (!_isScrollRunning) ...[
          _TargetWidget(
            offset: offset,
            size: size,
            targetPadding: widget.targetPadding ?? state.targetPadding,
            onTap: _getOnTargetTap,
            isCircle: (widget.isCircle == true) ||
                (widget.isCircle == null && state.isCircle),
            radius: widget.targetBorderRadius ?? state.targetBorderRadius,
            outlinePadding: widget.outlinePadding ?? state.outlinePadding,
            outlinePattern: widget.outlinePattern ?? state.outlinePattern,
            outlineWidth: widget.outlineWidth ?? state.outlineWidth,
            outlineColor: widget.outlineColor ?? state.outlineColor,
            onDoubleTap: widget.onTargetDoubleTap,
            onLongPress: widget.onTargetLongPress,
            child: widget.child,
          ),
          ToolTipWidget(
              position: position,
              offset: offset,
              screenSize: screenSize,
              widget: widget.widget,
              tooltipBackgroundColor:
                  widget.tooltipBackgroundColor ?? state.tooltipBackgroundColor,
              showArrow: (widget.showArrow == true) ||
                  (widget.showArrow == null && state.showArrow),
              height: widget.height ?? state.height,
              width: widget.width ?? state.width,
              onTooltipTap: _getOnTooltipTap,
              disableMovingAnimation: (widget.disableMovingAnimation == true) ||
                  (widget.disableMovingAnimation == null &&
                      state.disableMovingAnimation),
              disableScaleAnimation: (widget.disableScaleAnimation == true) ||
                  (widget.disableScaleAnimation == null &&
                      state.showDismissIcon),
              movingAnimationDuration: widget.movingAnimationDuration ??
                  state.movingAnimationDuration,
              tooltipBorderRadius:
                  widget.tooltipBorderRadius ?? state.tooltipBorderRadius,
              scaleAnimationDuration:
                  widget.scaleAnimationDuration ?? state.scaleAnimationDuration,
              scaleAnimationCurve:
                  widget.scaleAnimationCurve ?? state.scaleAnimationCurve,
              scaleAnimationAlignment: widget.scaleAnimationAlignment ??
                  state.scaleAnimationAlignment,
              isTooltipDismissed: _isTooltipDismissed,
              tooltipPosition: widget.tooltipPosition ?? state.tooltipPosition,
              tooltipPadding: widget.tooltipPadding ?? state.tooltipPadding,
              title: widget.title,
              titleTextStyle: widget.titleTextStyle ?? state.titleTextStyle,
              titlePadding: widget.titlePadding ?? state.titlePadding,
              titleTextDirection:
                  widget.titleTextDirection ?? state.titleTextDirection,
              titleAlignment: widget.titleAlignment ?? state.titleAlignment,
              description: widget.description,
              descAlignment: widget.descAlignment ?? state.descAlignment,
              descTextStyle: widget.descTextStyle ?? state.descTextStyle,
              descPadding: widget.descPadding ?? state.descPadding,
              descTextDirection:
                  widget.descTextDirection ?? state.descTextDirection,
              footerPadding: widget.footerPadding,
              footer: (widget.showFooter == true) ||
                      (widget.showFooter == null && state.showFooter)
                  ? widget.footer ??
                      state.footer ??
                      _DefaultFooter(
                        state: state,
                        showCurrent: (widget.showCurrent == true) ||
                            (widget.showCurrent == null && state.showCurrent),
                        currentTextStyle:
                            widget.currentTextStyle ?? state.currentTextStyle,
                        totalTextStyle:
                            widget.totalTextStyle ?? state.totalTextStyle,
                        allowBack: (widget.allowBack == true) ||
                            (widget.allowBack == null && state.allowBack),
                        nextText: widget.nextText ?? state.nextText,
                        prevText: widget.prevText ?? state.prevText,
                        nextTextFn: widget.nextTextFn ?? state.nextTextFn,
                        prevTextFn: widget.prevTextFn ?? state.prevTextFn,
                        nextBtnStyle: widget.nextBtnStyle ?? state.nextBtnStyle,
                        prevBtnStyle: widget.prevBtnStyle ?? state.prevBtnStyle,
                        onNextClick: widget.onNextClick,
                        onPrevClick: widget.onPrevClick,
                      )
                  : null,
              onDismissIconTap: () {
                state.dismiss(manual: true);
              },
              dismissIcon: (widget.showDismissIcon == true) ||
                      (widget.showDismissIcon == null && state.showDismissIcon)
                  ? widget.dismissIcon ??
                      state.dismissIcon ??
                      _DefaultDismissIcon()
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
