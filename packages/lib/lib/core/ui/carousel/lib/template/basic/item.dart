import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vts_kit_flutter_onboarding/index.dart';

class CarouselBasicItem extends StatefulWidget {
  final Widget? image;
  final String? title;
  final String? body;

  final EdgeInsets? titlePadding;
  final TextStyle? titleStyle;
  final TextAlign? titleAlignment;

  final EdgeInsets? bodyPadding;
  final TextStyle? bodyStyle;
  final TextAlign? bodyAlignment;

  final EdgeInsets? footerPadding;
  final Widget? footerWidget;
  final VoidCallback? onOkClick;
  final VoidCallback? onCancelClick;
  final String? okText;
  final String? cancelText;
  final ButtonStyle? okBtnStyle;
  final ButtonStyle? cancelBtnStyle;

  final MainAxisAlignment? contentAlignment;

  const CarouselBasicItem(
      {required this.title,
      required this.body,
      this.image,
      this.titlePadding,
      this.titleStyle,
      this.titleAlignment,
      this.bodyPadding,
      this.bodyStyle,
      this.bodyAlignment,
      this.footerPadding,
      this.footerWidget,
      this.onOkClick,
      this.onCancelClick,
      this.okBtnStyle,
      this.cancelBtnStyle,
      this.okText,
      this.cancelText,
      this.contentAlignment});

  @override
  State<CarouselBasicItem> createState() => _CarouselBasicItemState();
}

class _CarouselBasicItemState extends State<CarouselBasicItem> {
  CarouselBasicItemContext get state =>
      context.read<CarouselBasicItemContext>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: widget.contentAlignment ?? state.contentAlignment,
          children: <Widget>[
            widget.image != null ? widget.image! : SizedBox(),
            widget.title != null
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    padding: widget.titlePadding ??
                        state.titlePadding ??
                        EdgeInsets.zero,
                    child: Text(
                      widget.title!,
                      style: widget.titleStyle ?? state.titleStyle,
                      textAlign: widget.titleAlignment ?? state.titleAlignment,
                    ),
                  )
                : SizedBox(),
            widget.body != null
                ? Container(
                    padding: widget.bodyPadding ??
                        state.bodyPadding ??
                        EdgeInsets.zero,
                    child: Text(
                      widget.body!,
                      style: widget.bodyStyle ?? state.bodyStyle,
                      textAlign: widget.bodyAlignment ?? state.bodyAlignment,
                    ),
                  )
                : SizedBox(),
            widget.footerWidget != null
                ? widget.footerWidget!
                : _defaultFooter()
          ],
        ),
      ),
    );
  }

  Widget _defaultFooter() {
    if (widget.cancelText == null && widget.okText == null) return SizedBox();
    return Container(
      padding: widget.footerPadding ?? state.footerPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.cancelText != null
              ? Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      widget.onCancelClick?.call();
                    },
                    style: widget.cancelBtnStyle ?? state.cancelBtnStyle,
                    child: Text(widget.cancelText!),
                  ),
                )
              : SizedBox(),
          widget.okText != null && widget.cancelText != null
              ? SizedBox(
                  width: 16,
                )
              : SizedBox(),
          widget.okText != null
              ? Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      widget.onOkClick?.call();
                    },
                    style: widget.okBtnStyle ?? state.okBtnStyle,
                    child: Text(widget.okText!),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
