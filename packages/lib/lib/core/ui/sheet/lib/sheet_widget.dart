import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'context.dart';

class Sheet extends StatefulWidget {
  final GlobalKey key;
  final double? height;

  final Color? overlayColor;
  final double? overlayOpacity;
  final Color? backgroundColor;
  final Radius? borderRadius;
  final EdgeInsets? padding;

  final EdgeInsets? titlePadding;
  final TextStyle? titleStyle;
  final TextAlign? titleAlignment;

  final EdgeInsets? bodyPadding;
  final TextStyle? bodyStyle;
  final TextAlign? bodyAlignment;

  final Widget? image;
  final String? title;
  final String? body;

  final Widget? child;

  final bool? showDismissIcon;
  final Widget? dismissIcon;
  final VoidCallback? onDismissIconTap;

  final EdgeInsets? footerPadding;
  final Widget? footerWidget;
  final VoidCallback? onOkClick;
  final VoidCallback? onCancelClick;
  final String? okText;
  final String? cancelText;
  final ButtonStyle? okBtnStyle;
  final ButtonStyle? cancelBtnStyle;

  final bool? closeOnTapOutside;
  final bool topSheet;

  final Duration? animationDuration;
  final Curve? animationCurve;

  const Sheet(
      {required this.key,
      this.height,
      this.overlayColor,
      this.overlayOpacity,
      this.backgroundColor,
      this.borderRadius,
      this.padding,
      this.titlePadding,
      this.titleStyle,
      this.titleAlignment,
      this.bodyPadding,
      this.bodyStyle,
      this.bodyAlignment,
      this.image,
      this.title,
      this.body,
      this.child,
      this.showDismissIcon,
      this.dismissIcon,
      this.onDismissIconTap,
      this.footerPadding,
      this.footerWidget,
      this.onOkClick,
      this.onCancelClick,
      this.okText,
      this.cancelText,
      this.okBtnStyle,
      this.cancelBtnStyle,
      this.closeOnTapOutside,
      this.topSheet = false,
      this.animationDuration,
      this.animationCurve});

  @override
  _AnimatedContainerDisplayState createState() =>
      _AnimatedContainerDisplayState();
}

class _AnimatedContainerDisplayState extends State<Sheet>
    with SingleTickerProviderStateMixin {
  SheetContext get state => context.read<SheetContext>();
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    context.read<SheetContext>().addListener(checkState);

    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration ?? state.animationDuration,
    );

    _animation = Tween<Offset>(
      begin: Offset(0, widget.topSheet ? -1 : 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve ?? state.animationCurve,
    ));

    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
    context.read<SheetContext>().removeListener(checkState);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void checkState() {
    final showItem = state.activeWidgetKey == widget.key;
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
      _overlayEntry = buildOverlay(context);
      Overlay.of(context).insert(_overlayEntry!);
      _animationController.forward();
    }
  }

  void _hide() {
    if (_overlayEntry != null) {
      _animationController.reverse().then((value) {
        _overlayEntry!.remove();
        _overlayEntry = null;
      });
    }
  }

  OverlayEntry buildOverlay(BuildContext context) {
    Color overlayColor = widget.overlayColor
            ?.withOpacity(widget.overlayOpacity ?? state.overlayOpacity) ??
        state.overlayColor
            .withOpacity(widget.overlayOpacity ?? state.overlayOpacity);

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned.fill(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => {
            if ((widget.closeOnTapOutside == true) ||
                (widget.closeOnTapOutside == null && state.closeOnTapOutside))
              _dismiss()
          },
          child: Container(
            color: overlayColor,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return SlideTransition(
                  position: _animation,
                  child: child,
                );
              },
              child: buildContent(context),
            ),
          ),
        ),
      ),
    );
    return overlayEntry;
  }

  Widget buildContent(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {}, // To ignore gesture from inside
        child: Stack(children: [
          Positioned(
            bottom: widget.topSheet ? null : 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: widget.backgroundColor ?? state.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: !widget.topSheet
                        ? widget.borderRadius ??
                            state.borderRadius ??
                            Radius.zero
                        : Radius.zero,
                    topRight: !widget.topSheet
                        ? widget.borderRadius ??
                            state.borderRadius ??
                            Radius.zero
                        : Radius.zero,
                    bottomLeft: widget.topSheet
                        ? widget.borderRadius ??
                            state.borderRadius ??
                            Radius.zero
                        : Radius.zero,
                    bottomRight: widget.topSheet
                        ? widget.borderRadius ??
                            state.borderRadius ??
                            Radius.zero
                        : Radius.zero,
                  )),
              padding: widget.padding ?? state.padding,
              child: Stack(
                children: [
                  widget.child ??
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          widget.title != null
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: widget.titlePadding ??
                                      state.titlePadding ??
                                      EdgeInsets.zero,
                                  child: Text(
                                    widget.title!,
                                    style:
                                        widget.titleStyle ?? state.titleStyle,
                                    textAlign: widget.titleAlignment ??
                                        state.titleAlignment,
                                  ),
                                )
                              : SizedBox(),
                          widget.image != null ? widget.image! : SizedBox(),
                          widget.body != null
                              ? Container(
                                  padding: widget.bodyPadding ??
                                      state.bodyPadding ??
                                      EdgeInsets.zero,
                                  child: Text(
                                    widget.body!,
                                    style: widget.bodyStyle ?? state.bodyStyle,
                                    textAlign: widget.bodyAlignment ??
                                        state.bodyAlignment,
                                  ),
                                )
                              : SizedBox(),
                          widget.footerWidget != null
                              ? widget.footerWidget!
                              : _defaultFooter()
                        ],
                      ),
                  (widget.showDismissIcon == true) ||
                          (widget.showDismissIcon == null &&
                              state.showDismissIcon)
                      ? Positioned(
                          right: 8.0,
                          top: 8.0,
                          child: GestureDetector(
                              onTap: () {
                                _dismiss();
                                widget.onDismissIconTap?.call();
                              },
                              child: widget.dismissIcon != null
                                  ? widget.dismissIcon
                                  : _defaultDismissIcon()),
                        )
                      : SizedBox()
                ],
              ),
            ),
          )
        ]),
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
              ? OutlinedButton(
                  onPressed: () {
                    _dismiss();
                    widget.onCancelClick?.call();
                  },
                  style: widget.cancelBtnStyle ?? state.cancelBtnStyle,
                  child: Text(widget.cancelText!),
                )
              : SizedBox(),
          widget.okText != null && widget.cancelText != null
              ? SizedBox(
                  width: 16,
                )
              : SizedBox(),
          widget.okText != null
              ? ElevatedButton(
                  onPressed: () {
                    widget.onOkClick?.call();
                  },
                  style: widget.okBtnStyle ?? state.okBtnStyle,
                  child: Text(widget.okText!),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Widget _defaultDismissIcon() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(100)),
      child: Icon(
        Icons.close,
        color: Colors.black54,
        size: 28,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          if (_overlayEntry != null) {
            this._dismiss();
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: SizedBox.shrink());
  }
}
