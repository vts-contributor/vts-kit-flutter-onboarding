import 'package:flutter/material.dart';
import 'package:vts_kit_flutter_onboarding/index.dart';

class CarouselContext extends ChangeNotifier {
  final Color? backgroundColor;
  final EdgeInsets? innerPadding;
  final EdgeInsets? outterPadding;
  final EdgeInsets? indicatorPadding;
  final CarouselPageIndicatorStyle indicatorStyle;
  final EdgeInsets? footerPadding;
  final ButtonStyle? okBtnStyle;
  final ButtonStyle? cancelBtnStyle;
  final bool showDismissIcon;
  final Duration animationDuration;
  final Curve animationCurve;

  final BuildContext context;

  CarouselContext(
      {this.backgroundColor = Colors.white,
      this.innerPadding = const EdgeInsets.symmetric(vertical: 8),
      this.outterPadding = const EdgeInsets.all(24),
      this.indicatorPadding = const EdgeInsets.symmetric(vertical: 16),
      this.indicatorStyle = const CarouselPageIndicatorStyle(
          spaceBetween: 16,
          activeColor: Color.fromARGB(255, 248, 69, 91),
          inactiveColor: Colors.black45,
          activeSize: Size.square(12),
          inactiveSize: Size.square(8)),
      this.footerPadding = const EdgeInsets.only(top: 8),
      this.okBtnStyle = const ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0)),
          minimumSize: MaterialStatePropertyAll(Size.zero),
          textStyle:
              MaterialStatePropertyAll(TextStyle(fontSize: 16.0, height: 1.5)),
          backgroundColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 248, 69, 91)),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
          shadowColor: MaterialStatePropertyAll(Colors.transparent)),
      this.cancelBtnStyle = const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0)),
        minimumSize: MaterialStatePropertyAll(Size.zero),
        textStyle:
            MaterialStatePropertyAll(TextStyle(fontSize: 16.0, height: 1.5)),
        foregroundColor:
            MaterialStatePropertyAll(Color.fromARGB(255, 248, 69, 91)),
        side: MaterialStatePropertyAll(BorderSide(
            color: Color.fromARGB(255, 248, 69, 91),
            width: 1.0,
            style: BorderStyle.solid)),
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.transparent),
        shadowColor: MaterialStatePropertyAll<Color>(Colors.transparent),
      ),
      this.showDismissIcon = true,
      this.animationDuration = const Duration(milliseconds: 200),
      this.animationCurve = Curves.easeOut,
      required this.context});

  // State
  GlobalKey? activeWidgetKey;
  int page = -1;
  int pageLength = -1;
  bool forward = false;

  List<Function(int page, int pageLength, bool forward)> _onStepChangeCb = [];
  List<VoidCallback> _onDismissCb = [];
  List<VoidCallback> _onFinishCb = [];

  void start(GlobalKey widgetKey) {
    activeWidgetKey = widgetKey;
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

  void dismiss({notify = false}) {
    if (activeWidgetKey == null) {
      // Already be dismissed
      // Do nothing
      return;
    }
    activeWidgetKey = null;
    if (notify) notifyListeners();

    final isLast = page == pageLength - 1;
    if (isLast)
      _onFinish();
    else
      _onDismiss();
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

  void _onDismiss() {
    _onDismissCb.forEach((func) {
      func.call();
    });
  }

  void onStepChange(Function(int page, int pageLength, bool forward) func) {
    this._onStepChangeCb.add(func);
  }

  void onFinish(VoidCallback func) {
    this._onFinishCb.add(func);
  }

  void offStepChange(Function(int page, int pageLength, bool forward) func) {
    this._onStepChangeCb.removeWhere((element) => element == func);
  }

  void offFinish(VoidCallback func) {
    this._onFinishCb.removeWhere((element) => element == func);
  }

  void onDismiss(VoidCallback func) {
    this._onDismissCb.add(func);
  }

  void offDismiss(VoidCallback func) {
    this._onDismissCb.removeWhere((element) => element == func);
  }
}
