import 'package:flutter/material.dart';
import 'package:vts_kit_flutter_onboarding/index.dart';

class PopupContext extends ChangeNotifier {
  /// Background color of overlay.
  final Color overlayColor;

  /// Opacity apply on [overlayColor] (which ranges from 0.0 to 1.0)
  ///
  /// Default to 0.75
  final double overlayOpacity;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  final EdgeInsets? innerPadding;
  final EdgeInsets? outterPadding;

  final EdgeInsets? titlePadding;
  final TextStyle? titleStyle;
  final TextAlign? titleAlignment;

  final EdgeInsets? bodyPadding;
  final TextStyle? bodyStyle;
  final TextAlign? bodyAlignment;

  final EdgeInsets? footerPadding;
  final ButtonStyle? okBtnStyle;
  final ButtonStyle? cancelBtnStyle;

  final bool? fullscreen;

  final BuildContext context;

  PopupContext(
      {this.overlayColor = const Color.fromARGB(255, 0, 0, 0),
      this.overlayOpacity = 0.75,
      this.backgroundColor = Colors.white,
      this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
      this.innerPadding = const EdgeInsets.fromLTRB(24.0, 36.0, 24.0, 24.0),
      this.outterPadding = const EdgeInsets.symmetric(horizontal: 48.0),
      this.titlePadding = const EdgeInsets.only(bottom: 8.0),
      this.titleStyle = const TextStyle(
          color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.bold),
      this.titleAlignment = TextAlign.start,
      this.bodyPadding,
      this.bodyStyle =
          const TextStyle(color: Colors.black87, fontSize: 16.0, height: 1.4),
      this.bodyAlignment = TextAlign.justify,
      this.footerPadding = const EdgeInsets.only(top: 16),
      this.okBtnStyle = const ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0)),
          minimumSize: MaterialStatePropertyAll(Size.zero),
          textStyle:
              MaterialStatePropertyAll(TextStyle(fontSize: 16.0, height: 1.5)),
          backgroundColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 248, 69, 91)),
          shadowColor: MaterialStatePropertyAll(Colors.transparent)),
      this.cancelBtnStyle = const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0)),
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
      this.fullscreen = false,
      required this.context});

  // State
  GlobalKey? activeWidgetId;
  List<Function()> _onStartCb = [];
  List<Function()> _onCompleteCb = [];

  void start(GlobalKey widgetId) {
    activeWidgetId = widgetId;
    notifyListeners();
    _onStart();
  }

  void dismiss({notify = false}) {
    activeWidgetId = null;
    if (notify) notifyListeners();
    _onComplete();
  }

  void _onStart() {
    _onStartCb.forEach((func) {
      func.call();
    });
  }

  void _onComplete() {
    _onCompleteCb.forEach((func) {
      func.call();
    });
  }

  void onStart(Function() func) {
    this._onStartCb.add(func);
  }

  void onComplete(Function() func) {
    this._onCompleteCb.add(func);
  }

  void offStart(Function() func) {
    this._onStartCb.removeWhere((element) => element == func);
  }

  void offComplete(Function() func) {
    this._onCompleteCb.removeWhere((element) => element == func);
  }
}
