import 'package:flutter/material.dart';

class SheetContext extends ChangeNotifier {
  final Color overlayColor;
  final double overlayOpacity;
  final Color? backgroundColor;
  final Radius? borderRadius;
  final EdgeInsets? padding;

  final EdgeInsets? titlePadding;
  final TextStyle? titleStyle;
  final TextAlign? titleAlignment;

  final EdgeInsets? bodyPadding;
  final TextStyle? bodyStyle;
  final TextAlign? bodyAlignment;

  final bool showDismissIcon;

  final EdgeInsets? footerPadding;
  final ButtonStyle? okBtnStyle;
  final ButtonStyle? cancelBtnStyle;

  final bool closeOnTapOutside;

  final Duration? animationDuration;
  final Curve animationCurve;

  final BuildContext context;

  SheetContext(
      {this.overlayColor = const Color.fromARGB(255, 0, 0, 0),
      this.overlayOpacity = 0.75,
      this.backgroundColor = Colors.white,
      this.borderRadius = const Radius.circular(30.0),
      this.padding = const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0),
      this.titlePadding = const EdgeInsets.only(bottom: 36.0),
      this.titleStyle = const TextStyle(
          color: Colors.black87, fontSize: 24.0, fontWeight: FontWeight.bold),
      this.titleAlignment = TextAlign.center,
      this.bodyPadding,
      this.bodyStyle =
          const TextStyle(color: Colors.black87, fontSize: 16.0, height: 1.4),
      this.bodyAlignment = TextAlign.justify,
      this.footerPadding = const EdgeInsets.only(top: 36, bottom: 24),
      this.okBtnStyle = const ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0)),
          minimumSize: MaterialStatePropertyAll(Size.zero),
          textStyle:
              MaterialStatePropertyAll(TextStyle(fontSize: 16.0, height: 1.5)),
          backgroundColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 248, 69, 91)),
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
      this.closeOnTapOutside = false,
      this.animationDuration = const Duration(milliseconds: 200),
      this.animationCurve = Curves.easeOut,
      required this.context});

  // State
  GlobalKey? activeWidgetKey;
  List<Function()> _onStartCb = [];
  List<Function()> _onCompleteCb = [];

  void start(GlobalKey key) {
    activeWidgetKey = key;
    notifyListeners();
    _onStart();
  }

  void dismiss({notify = false}) {
    activeWidgetKey = null;
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
