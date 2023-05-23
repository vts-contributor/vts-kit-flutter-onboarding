import 'package:flutter/material.dart';

class CarouselContext extends ChangeNotifier {
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

  final BuildContext context;

  CarouselContext(
      {this.autoPlay = false,
      this.autoPlayDelay = const Duration(milliseconds: 2000),
      this.enableAutoPlayLock = false,
      required this.context});

  // State
  GlobalKey? activeWidgetKey;
  bool manualDismiss = false;
  int page = -1;
  int pageLength = -1;
  bool forward = false;

  List<VoidCallback> _onFinishCb = [];
  List<Function(int page, int pageLength, bool forward)> _onStepChangeCb = [];

  void start(GlobalKey widgetKey) {
    activeWidgetKey = widgetKey;
    manualDismiss = false;
    notifyListeners();
  }

  /// Completes item of given key and starts next one
  /// otherwise will finish the entire item view
  void completed() {
    activeWidgetKey = null;
    _onFinish();
    notifyListeners();
  }

  void next(int page, int pageLength, bool forward) {
    this.page = page;
    this.pageLength = pageLength;
    this.forward = forward;
    _onStepChange();
    notifyListeners();
  }

  void previous() {
    notifyListeners();
  }

  void dismiss({manual = false}) {
    if (manualDismiss) {
      // Already be dismissed
      // Do nothing
      return;
    }
    activeWidgetKey = null;
    manualDismiss = false;
    if (manual) {
      manualDismiss = true;
      notifyListeners();
    }
  }

  void _onStepChange() {
    _onStepChangeCb.forEach((func) {
      func.call(this.page, this.pageLength, this.forward);
    });
  }

  void _onFinish() {
    _onFinishCb.forEach((func) {
      func.call();
    });
  }

  void onStepChange(Function(int, int, bool) func) {
    this._onStepChangeCb.add(func);
  }

  void onFinish(VoidCallback func) {
    this._onFinishCb.add(func);
  }

  void offStepChange(Function(int, int, bool) func) {
    this._onStepChangeCb.removeWhere((element) => element == func);
  }

  void offFinish(VoidCallback func) {
    this._onFinishCb.removeWhere((element) => element == func);
  }
}
