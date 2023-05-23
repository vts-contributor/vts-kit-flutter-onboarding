import 'package:flutter/material.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/tooltip/lib/enum.dart';

class ToolTipContext extends ChangeNotifier {
  //#region Rendering
  /// Height of [container]
  final double height;

  /// Width of [container]
  final double width;

  //#endregion

  //#region Rendering (text)

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
  final bool disableMovingAnimation;

  /// The duration of time the bouncing animation of tooltip should last.
  ///
  /// Default to [Duration(milliseconds: 2000)]
  final Duration movingAnimationDuration;

  /// Whether disabling initial scale animation for default tooltip when
  /// highlighted is started and completed
  ///
  /// Default to `false`
  final bool disableScaleAnimation;

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

  /// While target widget is out viewport then
  /// whether enabling auto scroll so as to make the target widget visible.
  final bool autoScroll;

  /// Provides time duration for auto scrolling when [autoScroll] is true
  final Duration scrollDuration;

  /// If [autoScroll] is sets to `true`, this widget will be shown above
  /// the overlay until the target widget is visible in the viewport.
  final Widget? scrollLoadingWidget;

  /// Scroll alignment relative to screen view
  final double scrollAlign;

  /// This will blur the background while displaying item.
  final double blurValue;

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

  final BuildContext context;

  ToolTipContext(
      {this.width = 200.0,
      this.height = 120.0,
      this.titlePadding = const EdgeInsets.only(bottom: 8.0),
      this.titleTextStyle = const TextStyle(
          color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.bold),
      this.titleAlignment = TextAlign.start,
      this.titleTextDirection,
      this.descPadding,
      this.descTextStyle =
          const TextStyle(color: Colors.black87, fontSize: 16.0, height: 1.4),
      this.descAlignment = TextAlign.start,
      this.descTextDirection,
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
      this.footer,
      this.footerPadding = const EdgeInsets.only(top: 8),
      this.showDismissIcon = true,
      this.dismissIcon,
      this.disableMovingAnimation = true,
      this.movingAnimationDuration = const Duration(milliseconds: 2000),
      this.disableScaleAnimation = true,
      this.scaleAnimationDuration = const Duration(milliseconds: 300),
      this.scaleAnimationCurve = Curves.easeIn,
      this.scaleAnimationAlignment,
      this.autoScroll = true,
      this.scrollDuration = const Duration(milliseconds: 500),
      this.scrollLoadingWidget,
      this.scrollAlign = 0.5,
      this.blurValue = 0,
      this.targetPadding = const EdgeInsets.all(0.0),
      this.targetBorderRadius = const Radius.circular(5.0),
      this.isCircle = false,
      this.outlinePadding = const EdgeInsets.all(5.0),
      this.outlinePattern = const [8, 8],
      this.outlineWidth = 2.0,
      this.outlineColor = const Color.fromARGB(255, 248, 69, 91),
      required this.context});

  // State
  bool manualDismiss = false;
  List<GlobalKey>? ids;
  int? activeWidgetId;
  List<VoidCallback> _onFinishCb = [];
  List<Function(int?, GlobalKey)> _onStartCb = [];
  List<Function(int?, GlobalKey)> _onCompleteCb = [];

  GlobalKey? getActiveWidgetKey() {
    if (ids == null || ids!.isEmpty || activeWidgetId == null) return null;
    return ids!.elementAt(activeWidgetId!);
  }

  /// Starts TooltipItem view from the beginning of specified list of widget ids.
  /// If this function is used when item has been disabled then it will
  /// throw an exception.
  void start(List<GlobalKey> widgetIds) {
    ids = widgetIds;
    activeWidgetId = 0;
    manualDismiss = false;
    notifyListeners();
    _onStart();
  }

  /// Completes item of given key and starts next one
  /// otherwise will finish the entire item view
  void completed(GlobalKey? key) {
    if (ids != null && ids![activeWidgetId!] == key) {
      _onComplete();
      activeWidgetId = activeWidgetId! + 1;
      _onStart();

      if (activeWidgetId! >= ids!.length) {
        dismiss();
        _onFinish();
      }
    }
    notifyListeners();
  }

  /// Completes current active item and starts next one
  /// otherwise will finish the entire item view
  void next() {
    if (ids != null) {
      _onComplete();
      activeWidgetId = activeWidgetId! + 1;
      _onStart();

      if (activeWidgetId! >= ids!.length) {
        dismiss();
        _onFinish();
      }
    }
    notifyListeners();
  }

  /// Completes current active item and starts previous one
  /// otherwise will finish the entire item view
  void previous() {
    if (ids != null && ((activeWidgetId ?? 0) - 1) >= 0) {
      _onComplete();
      activeWidgetId = activeWidgetId! - 1;
      _onStart();
      if (activeWidgetId! >= ids!.length) {
        dismiss();
        _onFinish();
      }
    }
    notifyListeners();
  }

  /// Dismiss entire item view
  void dismiss({manual = false}) {
    if (manualDismiss) {
      // Already be dismissed
      // Do nothing
      return;
    }

    ids = null;
    activeWidgetId = null;
    manualDismiss = false;
    if (manual) {
      manualDismiss = true;
      notifyListeners();
    }
  }

  bool isFirst() {
    return activeWidgetId == 0;
  }

  bool isLast() {
    return ids != null && activeWidgetId == ids!.length - 1;
  }

  void _onStart() {
    if (activeWidgetId! < ids!.length) {
      _onStartCb.forEach((func) {
        func.call(activeWidgetId, ids![activeWidgetId!]);
      });
    }
  }

  void _onComplete() {
    _onCompleteCb.forEach((func) {
      func.call(activeWidgetId, ids![activeWidgetId!]);
    });
  }

  void _onFinish() {
    _onFinishCb.forEach((func) {
      func.call();
    });
  }

  void onStart(Function(int?, GlobalKey) func) {
    this._onStartCb.add(func);
  }

  void onComplete(Function(int?, GlobalKey) func) {
    this._onCompleteCb.add(func);
  }

  void onFinish(VoidCallback func) {
    this._onFinishCb.add(func);
  }

  void offStart(Function(int?, GlobalKey) func) {
    this._onStartCb.removeWhere((element) => element == func);
  }

  void offComplete(Function(int?, GlobalKey) func) {
    this._onCompleteCb.removeWhere((element) => element == func);
  }

  void offFinish(VoidCallback func) {
    this._onFinishCb.removeWhere((element) => element == func);
  }
}
