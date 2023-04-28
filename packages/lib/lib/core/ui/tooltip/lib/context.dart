import 'package:flutter/material.dart';

class ToolTipContext extends ChangeNotifier {
  /// Whether all items will auto sequentially start
  /// having time interval of [autoPlayDelay] .
  ///
  /// Default to `false`
  final bool autoPlay;

  /// Visibility time of current item when [autoplay] sets to true.
  ///
  /// Default to [Duration(seconds: 3)]
  final Duration autoPlayDelay;

  /// Whether blocking user interaction while [autoPlay] is enabled.
  ///
  /// Default to `false`
  final bool enableAutoPlayLock;

  /// Whether disabling bouncing/moving animation for all tooltips
  /// while highlighting
  ///
  /// Default to `false`
  final bool disableMovingAnimation;

  /// Whether disabling initial scale animation for all the default tooltips
  /// when item is started and completed
  ///
  /// Default to `false`
  final bool disableScaleAnimation;

  /// Whether disabling barrier interaction
  final bool disableBarrierInteraction;

  /// Provides time duration for auto scrolling when [enableAutoScroll] is true
  final Duration scrollDuration;

  /// Default overlay blur used by item. if [TooltipItem.blurValue]
  /// is not provided.
  ///
  /// Default value is 0.
  final double blurValue;

  /// While target widget is out viewport then
  /// whether enabling auto scroll so as to make the target widget visible.
  final bool enableAutoScroll;

  final BuildContext context;

  ToolTipContext(
      {this.autoPlay = false,
      this.autoPlayDelay = const Duration(milliseconds: 2000),
      this.enableAutoPlayLock = false,
      this.blurValue = 0,
      this.scrollDuration = const Duration(milliseconds: 300),
      this.disableMovingAnimation = false,
      this.disableScaleAnimation = false,
      this.enableAutoScroll = false,
      this.disableBarrierInteraction = false,
      required this.context});

  // State
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
  void dismiss({notify = false}) {
    ids = null;
    activeWidgetId = null;
    if (notify) notifyListeners();
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
