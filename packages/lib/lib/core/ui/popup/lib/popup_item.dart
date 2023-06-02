import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/context.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/popup_widget.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/types.dart';

import 'enum.dart';

class PopupItem extends StatefulWidget {
  final GlobalKey key;
  final VoidCallback? onActionClick;
  final Color? backgroundColor;
  final String msg;
  final String title;
  final double? popupWidth;
  final BuildContext context;
  final ShapeBorder? dialogShape;
  final CustomViewPosition? customViewPosition;
  final String? image;
  final EdgeInsets? insetPadding;
  final PopupViewport? modeViewport;
  final double? popupHeight;
  final Widget? footerWidget;

  /// all properties below are of actionDefault() and only work when footerWidget is null
  final VoidCallback? okClick;
  final VoidCallback? cancelClick;
  final String? okText;
  final String? cancelText;
  final TextStyle? textStyle;
  final ButtonStyle? btnStyleCancel;
  final ButtonStyle? btnStyleOk;

  PopupItem(
      {required this.key,
      this.onActionClick,
      this.backgroundColor,
      required this.msg,
      required this.title,
      this.popupWidth,
      required this.context,
      this.dialogShape,
      this.customViewPosition,
      this.image,
      this.insetPadding,
      this.modeViewport,
      this.popupHeight,
      this.footerWidget,
      this.okClick,
      this.cancelClick,
      this.okText,
      this.cancelText,
      this.textStyle,
      this.btnStyleCancel,
      this.btnStyleOk
  });

  @override
  State<StatefulWidget> createState() => _PopupState();
}

class _PopupState extends State<PopupItem> {
  static const TextStyle titleStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  PopupContext get state => context.read<PopupContext>();
  OverlayEntry? _overlayEntry;

  static const ShapeBorder dialogShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)));

  static const CustomViewPosition customViewPosition =
      CustomViewPosition.BEFORE_TITLE;

  @override
  void initState() {
    super.initState();
    context.read<PopupContext>().addListener(checkState);
  }

  @override
  void deactivate() {
    super.deactivate();
    context.read<PopupContext>().removeListener(checkState);
  }

  void checkState() {
    final showItem = state.activeWidgetId == widget.key;
    if (showItem)
      _show();
    else
      _hide();
  }

  void _dismiss() {
    state.dismiss(notify: true);
  }

  void _show() {
    if (_overlayEntry == null) {
      _overlayEntry = showCarouselOverlay(context);
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  void _hide() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry showCarouselOverlay(BuildContext context) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned.fill(
        child: GestureDetector(
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Dialog(
                        insetPadding: widget.insetPadding ?? EdgeInsets.symmetric(horizontal: 20),
                        backgroundColor: widget.backgroundColor ?? Colors.white,
                        shape: widget.dialogShape == null
                            ? dialogShape
                            : widget.dialogShape,
                        child: PopupWidget(
                          title: widget.title,
                          msg: widget.msg,
                          image: widget.image,
                          popupWidth: widget.popupWidth,
                          popupHeight: widget.popupHeight,
                          modeViewport: widget.modeViewport,
                          footerWidget: widget.footerWidget,
                          actions: widget.footerWidget == null ?
                              actionDefault(
                                  okClick: widget.okClick,
                                  cancelClick: widget.cancelClick,
                                  okText: widget.okText,
                                  cancelText: widget.cancelText,
                                  textStyle: widget.textStyle,
                                  btnStyleCancel : widget.btnStyleCancel,
                                  btnStyleOk: widget.btnStyleOk
                              ) : [],
                          customViewPosition: widget.customViewPosition == null
                              ? customViewPosition
                              : widget.customViewPosition!,
                          titleStyle: titleStyle,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    return overlayEntry;
  }


  List<Widget> actionDefault(
    {
      String? okText,
      VoidCallback? okClick,
      String? cancelText,
      VoidCallback? cancelClick,
      TextStyle? textStyle,
      ButtonStyle? btnStyleCancel,
      ButtonStyle? btnStyleOk
    }
      ){
    return [
      ElevatedButton(
        onPressed: () {
          _dismiss();
          cancelClick;
        },
        style: btnStyleCancel ??
                  ButtonStyle(
                    backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
        child: Text(cancelText ?? 'Bỏ qua',style: textStyle ?? TextStyle(color: Colors.black87)),
      ),
      ElevatedButton(
        onPressed: () {
          _dismiss();
          okClick;
        },
        style: btnStyleOk ??
            ButtonStyle(
              backgroundColor:  MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
        child: Text(okText ?? 'Đăng ký',style: textStyle ?? TextStyle(color: Colors.white)),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
