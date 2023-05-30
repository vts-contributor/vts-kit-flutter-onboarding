import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/enum.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/types.dart';

/// Displays Material dialog above the current contents of the app

class PopupWidget extends StatelessWidget {
  PopupWidget({
    this.title,
    this.msg,
    this.actions,
    this.image,
    this.customView = const SizedBox(),
    this.customViewPosition = CustomViewPosition.BEFORE_TITLE,
    this.titleStyle,
    this.msgStyle,
    this.titleAlign,
    this.msgAlign,
    this.popupWidth,
    this.color,
    this.modeViewport,
    this.popupHeight,
    this.footerWidget
  });

  // final GlobalKey key;

  /// [actions]Widgets to display a row of buttons after the [msg] widget.
  final List<Widget>? actions;

  /// [customView] a widget to display a custom widget instead of the animation view.
  final Widget customView;

  final CustomViewPosition customViewPosition;

  /// [title] your popup title
  final String? title;

  /// [msg] your popup description message
  final String? msg;

  final String? image;

  /// [titleStyle] popup title text style
  final TextStyle? titleStyle;

  /// [animation] lottie animations path
  final TextStyle? msgStyle;

  /// [titleAlign] popup title text alignment
  final TextAlign? titleAlign;

  /// [textAlign] dialog description text alignment
  final TextAlign? msgAlign;

  /// [color] popup's backgorund color
  final Color? color;

  /// [popupWidth] dialog's width
  final double? popupWidth;

  final PopupViewport? modeViewport;

  final double? popupHeight;

  ///  footer Widget
  final Widget? footerWidget;

  @override
  Widget build(BuildContext context) {
    double? heightPopup;
    if(modeViewport == PopupViewport.half){
      heightPopup = MediaQuery.of(context).size.height / 2;
    }else if(modeViewport == PopupViewport.full){
      heightPopup = MediaQuery.of(context).size.height;
    }else{
      heightPopup = popupHeight;
    }
    return Container(
      width: popupWidth ?? MediaQuery.of(context).size.width,
      height: heightPopup,
      child:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            customViewPosition == CustomViewPosition.BEFORE_ANIMATION
                ? customView : const SizedBox(),
            if (image != null)
              Container(
                padding: EdgeInsets.only(top: 20),
                height: 200,
                width: double.infinity,
                child: Image.asset(image!),
              ),
            customViewPosition == CustomViewPosition.BEFORE_TITLE
                ? customView : const SizedBox(),
            title != null
                ? Padding(
              padding:
              const EdgeInsets.only(right: 20, left: 20, top: 24.0),
              child: Text(
                title!,
                style: titleStyle,
                textAlign: titleAlign,
              ),
            ): SizedBox(
              height: 4,
            ),
            customViewPosition == CustomViewPosition.BEFORE_MESSAGE
                ? customView
                : const SizedBox(),
            msg != null
                ? Padding(
              padding:
              const EdgeInsets.only(right: 20, left: 20, top: 16.0),
              child: Text(
                msg!,
                style: msgStyle,
                textAlign: msgAlign,
              ),
            )
                : SizedBox(
              height: 20,
            ),
            customViewPosition == CustomViewPosition.BEFORE_ACTION
                ? customView
                : const SizedBox(),
            actions?.length == 0
                ? footerWidget!
                : buttons(context),
            customViewPosition == CustomViewPosition.AFTER_ACTION
                ? customView
                : const SizedBox(),
          ],
        ),
      )
    );
  }

  Widget buttons(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 20, left: 20, top: 16.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(actions!.length, (index) {
          final TextDirection direction = Directionality.of(context);
          double padding = index != 0 ? 8 : 0;
          double rightPadding = 0;
          double leftPadding = 0;
          direction == TextDirection.rtl
              ? rightPadding = padding
              : leftPadding = padding;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
              child: actions![index],
            ),
          );
        }),
      ),
    );
  }
}
