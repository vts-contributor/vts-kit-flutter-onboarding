import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/carousel/lib/context.dart';
import 'package:vts_kit_flutter_onboarding/index.dart';

class Carousel extends StatefulWidget {
  final GlobalKey key;
  final List<Widget> children;
  final Color? backgroundColor;
  final EdgeInsets? outterPadding;
  final EdgeInsets? innerPadding;

  final EdgeInsets? indicatorPadding;
  final CarouselPageIndicatorStyle? indicatorStyle;

  final EdgeInsets? footerPadding;
  final Widget? footerWidget;
  final VoidCallback? onOkClick;
  final VoidCallback? onCancelClick;
  final String? okText;
  final String? cancelText;
  final ButtonStyle? okBtnStyle;
  final ButtonStyle? cancelBtnStyle;

  final bool? showDismissIcon;
  final Widget? dismissIcon;
  final VoidCallback? onDismissIconTap;

  final Function(int page, int pageLength, bool forward)? onPageChanged;

  final Duration? animationDuration;
  final Curve? animationCurve;

  Carousel({
    required this.key,
    required this.children,
    this.backgroundColor,
    this.outterPadding,
    this.innerPadding,
    this.indicatorPadding,
    this.indicatorStyle,
    this.footerPadding,
    this.footerWidget,
    this.onOkClick,
    this.onCancelClick,
    this.okText,
    this.cancelText,
    this.okBtnStyle,
    this.cancelBtnStyle,
    this.showDismissIcon,
    this.dismissIcon,
    this.onDismissIconTap,
    this.onPageChanged,
    this.animationDuration,
    this.animationCurve,
  });

  @override
  State<StatefulWidget> createState() => CarouselState();
}

class CarouselState extends State<Carousel>
    with SingleTickerProviderStateMixin {
  CarouselContext get state => context.read<CarouselContext>();

  late AnimationController _animationController;
  late Animation<double> _animation;
  OverlayEntry? _overlayEntry;
  int _activePage = 0;

  @override
  void initState() {
    super.initState();
    context.read<CarouselContext>().addListener(checkState);

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
    context.read<CarouselContext>().removeListener(checkState);
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

  _onPageChanged(int page) {
    final forward = page > _activePage;
    setState(() {
      _activePage = page;
    });
    state.next(page, widget.children.length, forward);
    if (_overlayEntry != null) _overlayEntry!.markNeedsBuild();
  }

  OverlayEntry buildOverlay(BuildContext context) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned.fill(
        child: GestureDetector(
          child: Container(
            color: widget.backgroundColor ?? state.backgroundColor,
            padding: widget.outterPadding ?? state.outterPadding,
            child: AnimatedBuilder(
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
                child: buildContent(context)),
          ),
        ),
      ),
    );
    return overlayEntry;
  }

  Widget buildContent(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            (widget.showDismissIcon == true) ||
                    (widget.showDismissIcon == null && state.showDismissIcon)
                ? Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                        onTap: () {
                          _dismiss();
                          widget.onDismissIconTap?.call();
                        },
                        child: widget.dismissIcon != null
                            ? widget.dismissIcon
                            : _defaultDismissIcon()),
                  )
                : SizedBox(),
            Expanded(
              child: Container(
                padding: widget.innerPadding ?? state.innerPadding,
                child: PageView.builder(
                  onPageChanged: _onPageChanged,
                  itemCount: widget.children.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: widget.children[index],
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: widget.indicatorPadding ?? state.indicatorPadding,
              child: CarouselPageIndicator(
                count: widget.children.length,
                activePage: _activePage,
                pageIndicatorStyle:
                    widget.indicatorStyle ?? state.indicatorStyle,
              ),
            ),
            widget.footerWidget != null
                ? widget.footerWidget!
                : _defaultFooter()
          ],
        ),
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
                      _dismiss();
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
