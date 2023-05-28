import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/context.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/popup_widget.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/types.dart';

import 'icon_button.dart';

class PopupItem extends StatefulWidget {
  final GlobalKey key;
  final VoidCallback? onActionClick;
  final Color? backgroundColor;
  final String msg;
  final String title;
  final List<Widget>? actions;
  final double? popupWidth;
  final BuildContext context;
  final ShapeBorder? dialogShape;
  final CustomViewPosition? customViewPosition;
  final String? image;

  PopupItem(
      {required this.key,
      this.onActionClick,
      this.backgroundColor,
      required this.msg,
      required this.title,
      this.actions,
      this.popupWidth,
      required this.context,
      this.dialogShape,
      this.customViewPosition,
      this.image});

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
    context.read<PopupContext>().addListener(() {
      checkState();
    });
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
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: widget.backgroundColor ?? Colors.white,
                        shape: widget.dialogShape == null
                            ? dialogShape
                            : widget.dialogShape,
                        child: PopupWidget(
                          title: widget.title,
                          msg: widget.msg,
                          image: widget.image,
                          popupWidth: widget.popupWidth,
                          actions: widget.actions ??
                              [
                                IconsButton(
                                  onPressed: () {
                                    _dismiss();
                                  },
                                  text: 'Bỏ qua',
                                  color: Colors.white,
                                  textStyle:
                                      const TextStyle(color: Colors.black),
                                  iconColor: Colors.white,
                                ),
                                IconsButton(
                                  onPressed: () {
                                    _dismiss();
                                  },
                                  text: 'Đăng ký',
                                  color: Colors.black,
                                  textStyle:
                                      const TextStyle(color: Colors.white),
                                  iconColor: Colors.white,
                                ),
                              ],
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

    // overlayState.insert(overlayEntry!);
    return overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}
