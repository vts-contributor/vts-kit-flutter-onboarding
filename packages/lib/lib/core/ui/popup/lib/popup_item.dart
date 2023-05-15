import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/context.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/popup_widget.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/types.dart';

import 'icon_button.dart';


class PopupItem extends StatefulWidget{
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



      PopupItem({
        required this.key,
        this.onActionClick,
        this.backgroundColor,
        required this.msg,
        required this.title,
        this.actions,
        this.popupWidth,
        required this.context,
        this.dialogShape,
        this.customViewPosition,
        this.image
    });


  @override
  State<StatefulWidget> createState() => _PopupState();

}

class _PopupState extends State<PopupItem>{
  ///[titleStyle] can be used to change the dialog title style
  static const TextStyle titleStyle =
    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  PopupContext get state => context.read<PopupContext>();
  bool _showItem = false;
  Timer? timer;


  // ///[bcgColor] background default value
  // static const Color bcgColor = const Color(0xfffefefe);
  //
  // ///[holder] holder for the custom view
  // static const Widget holder = const SizedBox(
  //   height: 0,
  // );

  /// [dialogShape] dialog outer shape
  static const ShapeBorder dialogShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)));

  static const CustomViewPosition customViewPosition =
      CustomViewPosition.BEFORE_TITLE;

  Future<void> _nextIfAny() async {
    if (timer != null && timer!.isActive) {
      if (state.enableAutoPlayLock) {
        return;
      }
      timer!.cancel();
    } else if (timer != null && !timer!.isActive) {
      timer = null;
    }
    state.completed(widget.key);
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

    if (activeStep == widget.key) {
      if (state.autoPlay) {
        timer =
            Timer(Duration(seconds: state.autoPlayDelay.inSeconds), _nextIfAny);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_showItem)
    return Dialog(
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
                if (!state.disableBarrierInteraction) {
                  _nextIfAny();
                }
                widget.onActionClick?.call();
              },
              text: 'Bỏ qua',
              color: Colors.white,
              textStyle: const TextStyle(color: Colors.black),
              iconColor: Colors.white,
            ),
            IconsButton(
              onPressed: () {
                if (!state.disableBarrierInteraction) {
                  _nextIfAny();
                }
                widget.onActionClick?.call();
              },
              text: 'Đăng ký',
              color: Colors.black,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.white,
            ),
          ],
          customViewPosition: widget.customViewPosition == null ? customViewPosition : widget.customViewPosition!,
          titleStyle: titleStyle,
          color: Colors.red,
        ));
    return SizedBox(height: 0,);
  }

}

