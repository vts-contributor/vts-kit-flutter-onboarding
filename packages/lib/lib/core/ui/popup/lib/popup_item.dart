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
  ///[titleStyle] can be used to change the dialog title style
  static const TextStyle titleStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  PopupContext get state => context.read<PopupContext>();

  bool _showItem = false;
  OverlayEntry? overlayEntryy;
  bool _isOverlayVisible = false;

  /// [dialogShape] dialog outer shape
  static const ShapeBorder dialogShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)));

  static const CustomViewPosition customViewPosition =
      CustomViewPosition.BEFORE_TITLE;

  Future<void> _nextIfAny(OverlayEntry? overlayEntry) async {
    final activeStep = state.getActiveWidgetKey();
    print(activeStep);
    print(widget.key);
    state.completed(widget.key,overlayEntry);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PopupContext>().addListener(() {
      showPopup();
    });


  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showPopup();
  }

  void showPopup() {
    final activeStep = state.getActiveWidgetKey();
    setState(() {
      _showItem = activeStep == widget.key;
    });
  }


  OverlayEntry showDialogOverlay(BuildContext context) {
    OverlayEntry overlayEntry  = OverlayEntry(
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
                    backgroundColor: Colors.white,
                    shape: widget.dialogShape == null ? dialogShape : widget.dialogShape,
                    child: PopupWidget(
                      title: widget.title,
                      msg: widget.msg,
                      image: widget.image,
                      popupWidth: widget.popupWidth,
                      actions: [
                        IconsButton(
                          onPressed: () {
                            _nextIfAny(overlayEntryy);
                          },
                          text: 'Bỏ qua',
                          color: Colors.white,
                          textStyle: const TextStyle(color: Colors.black),
                          iconColor: Colors.white,
                        ),
                        IconsButton(
                          onPressed: () {
                            _nextIfAny(overlayEntryy);
                          },
                          text: 'Đăng ký',
                          color: Colors.black,
                          textStyle: const TextStyle(color: Colors.white),
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
    return overlayEntry!;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_showItem && !_isOverlayVisible) {
        overlayEntryy = showDialogOverlay(context);
        Overlay.of(context).insert(overlayEntryy!);
        setState(() {
          _isOverlayVisible = true;
        });
      }
    });

    return SizedBox.shrink();
  }
}
