import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/popup/lib/context.dart';

class Popup extends StatefulWidget {
  /// A key that is unique across the entire app.
  final GlobalKey key;

  final Color? overlayColor;
  final double? overlayOpacity;

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

  final Widget? image;
  final String? title;
  final String? body;

  final Widget? child;

  final MainAxisAlignment? contentAlignment;

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

  final bool? fullscreen;
  final bool? closeOnTapOutside;

  final Duration? animationDuration;
  final Curve? animationCurve;

  Popup(
      {required this.key,
      required this.title,
      required this.body,
      this.titlePadding,
      this.titleStyle,
      this.titleAlignment,
      this.bodyPadding,
      this.bodyStyle,
      this.bodyAlignment,
      this.overlayColor,
      this.overlayOpacity,
      this.child,
      this.contentAlignment,
      this.backgroundColor,
      this.borderRadius,
      this.image,
      this.outterPadding,
      this.innerPadding,
      this.showDismissIcon,
      this.dismissIcon,
      this.onDismissIconTap,
      this.footerPadding,
      this.footerWidget,
      this.onOkClick,
      this.onCancelClick,
      this.okText,
      this.cancelText,
      this.cancelBtnStyle,
      this.okBtnStyle,
      this.fullscreen,
      this.closeOnTapOutside,
      this.animationDuration,
      this.animationCurve});

  @override
  State<StatefulWidget> createState() => _PopupState();
}

class _PopupState extends State<Popup> with SingleTickerProviderStateMixin {
  PopupContext get state => context.read<PopupContext>();
  late AnimationController _animationController;
  late Animation<double> _animation;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    context.read<PopupContext>().addListener(checkState);

    _animationController = AnimationController(
      duration: widget.animationDuration ?? state.animationDuration,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve ?? state.animationCurve,
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    context.read<PopupContext>().removeListener(checkState);
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
    BorderRadius? borderRadius = widget.borderRadius ?? state.borderRadius;

    OverlayEntry overlayEntry = OverlayEntry(
        builder: (BuildContext context) => Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => {
                  if ((widget.closeOnTapOutside == true) ||
                      (widget.closeOnTapOutside == null &&
                          state.closeOnTapOutside))
                    _dismiss()
                },
                child: Container(
                  color: overlayColor,
                  child: (widget.fullscreen == true ||
                          (widget.fullscreen == null && state.fullscreen))
                      ? AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _animation.value,
                              child: Opacity(
                                opacity: _animation.value,
                                child: child,
                              ),
                            );
                          },
                          child: Dialog.fullscreen(
                            child: buildContent(context),
                          ),
                        )
                      : AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _animation.value,
                              child: Opacity(
                                opacity: _animation.value,
                                child: child,
                              ),
                            );
                          },
                          child: Dialog(
                            shape: borderRadius != null
                                ? RoundedRectangleBorder(
                                    borderRadius: borderRadius)
                                : null,
                            insetPadding:
                                widget.outterPadding ?? state.outterPadding,
                            child: buildContent(context),
                          ),
                        ),
                ),
              ),
            ));
    return overlayEntry;
  }

  Widget buildContent(BuildContext context) {
    return GestureDetector(
      onTap: () {}, // To ignore gesture from inside
      child: Stack(
        children: [
          Container(
              padding: widget.innerPadding ?? state.innerPadding,
              decoration: BoxDecoration(
                  color: widget.backgroundColor ?? state.backgroundColor,
                  borderRadius: widget.borderRadius ?? state.borderRadius),
              child: widget.child ??
                  Column(
                    mainAxisSize: (widget.fullscreen == true ||
                            (widget.fullscreen == null && state.fullscreen))
                        ? MainAxisSize.max
                        : MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment:
                        widget.contentAlignment ?? state.contentAlignment,
                    children: [
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
                                textAlign: widget.titleAlignment ??
                                    state.titleAlignment,
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
                                textAlign:
                                    widget.bodyAlignment ?? state.bodyAlignment,
                              ),
                            )
                          : SizedBox(),
                      widget.footerWidget != null
                          ? widget.footerWidget!
                          : _defaultFooter()
                    ],
                  )),
          (widget.showDismissIcon == true) ||
                  (widget.showDismissIcon == null && state.showDismissIcon)
              ? Positioned(
                  right: 16.0,
                  top: 16.0,
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
              ? OutlinedButton(
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
