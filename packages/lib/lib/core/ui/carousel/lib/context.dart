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
  GlobalKey? widgetKey;
  bool manualDismiss = false;
  int page = -1;
  int pageLength = -1;

  List<VoidCallback> _onFinishCb = [];
  List<Function(int page, int pageLength)> _onStepChangeCb = [];

  void start(GlobalKey widgetKey) {
    widgetKey = widgetKey;
    manualDismiss = false;
    notifyListeners();
  }

  /// Completes item of given key and starts next one
  /// otherwise will finish the entire item view
  void completed() {
    widgetKey = null;
    _onFinish();
    notifyListeners();
  }

  void next(int page, int pageLength) {
    page = page;
    pageLength = pageLength;
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
    widgetKey = null;
    manualDismiss = false;
    if (manual) {
      manualDismiss = true;
      notifyListeners();
    }
  }

  void _onStepChange() {
    _onStepChangeCb.forEach((func) {
      func.call(page, pageLength);
    });
  }

  void _onFinish() {
    _onFinishCb.forEach((func) {
      func.call();
    });
  }

  void onStepChange(Function(int, int) func) {
    this._onStepChangeCb.add(func);
  }

  void onFinish(VoidCallback func) {
    this._onFinishCb.add(func);
  }

  void offStepChange(Function(int, int) func) {
    this._onStepChangeCb.removeWhere((element) => element == func);
  }

  void offFinish(VoidCallback func) {
    this._onFinishCb.removeWhere((element) => element == func);
  }
}
