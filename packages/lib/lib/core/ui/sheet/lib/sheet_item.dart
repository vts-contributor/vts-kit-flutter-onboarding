import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/sheet/lib/close.dart';
import 'package:vts_kit_flutter_onboarding/core/ui/sheet/lib/enum.dart';

import 'context.dart';


class SheetItem extends StatefulWidget {
  final GlobalKey key;
  final Duration animationDuration;
  final Curve? curve;
  final Color? barrierColor;
  final double? barrierOpacity;
  final double? radiusTopLeft;
  final double? radiusTopRight;
  final double? radiusBottomLeft;
  final double? radiusBottomRight;
  final double? widthSheet;
  final double? heightSheet;
  final Color? colorSheet;
  final Alignment? alignSheet;
  final double? paddingVerticalContent;
  final double? paddingHorizontalContent;
  final VoidCallback? onActionClick;
  final SheetDirection? direction;
  final double? right;
  final double? top;
  final double? bottom;
  final double? left;
  final Widget? closeIcon;



  const SheetItem({
    required this.key,
    required this.animationDuration,
    this.curve,
    this.barrierColor,
    this.barrierOpacity,
    this.radiusTopLeft,
    this.radiusTopRight,
    this.radiusBottomLeft,
    this.radiusBottomRight,
    this.widthSheet,
    this.heightSheet,
    this.colorSheet,
    this.alignSheet,
    this.paddingVerticalContent,
    this.paddingHorizontalContent,
    this.onActionClick,
    this.direction,
    this.right,
    this.top,
    this.bottom,
    this.left,
    this.closeIcon
  });

  @override
  _AnimatedContainerDisplayState createState() => _AnimatedContainerDisplayState();
}

class _AnimatedContainerDisplayState extends State<SheetItem> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  bool _isVisible = true;
  Color barrierColorCurrent = Colors.grey;

  SheetContext get state => context.read<SheetContext>();
  OverlayEntry? _overlayEntry;



  @override
  void initState() {
    context.read<SheetContext>().addListener(() {
      checkState();
    });

    if(widget.barrierColor != null){
      barrierColorCurrent = widget.barrierColor!;
    }
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _animation = Tween<Offset>(
      begin: Offset(0, widget.direction == SheetDirection.top ? -1 : 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.curve ?? Curves.easeOut,
    ));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
      _overlayEntry = showSheetOverlay(context);
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



  OverlayEntry showSheetOverlay(BuildContext context) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) => AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context,Widget? child) {
              return Container(
                  color: barrierColorCurrent.withOpacity(widget.barrierOpacity ?? 0.6),
                  child: Stack(
                    children: [
                      GestureDetector(
                          onTap: (){
                            if(!state.disableBarrierInteraction){
                              _dismiss();
                            }
                          },
                          child: Container(
                            color: Colors.transparent,
                          )
                      ) ,
                      Positioned(
                        top: widget.direction == SheetDirection.top ? 0 : null,
                        bottom: widget.direction == SheetDirection.bottom ? 0 : null,
                        child:
                        Align(
                            alignment: widget.alignSheet ?? Alignment.bottomCenter,
                            child: Stack(
                              children: [
                                SlideTransition(
                                  position: _animation,
                                  child: ClipRRect(
                                      borderRadius:  BorderRadius.only(
                                        topLeft: Radius.circular(widget.radiusTopLeft ?? 30),
                                        topRight: Radius.circular(widget.radiusTopRight ?? 30),
                                        bottomRight: Radius.circular(widget.radiusBottomRight ?? 0),
                                        bottomLeft: Radius.circular(widget.radiusBottomLeft ?? 0),
                                      ),
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: widget.widthSheet ?? MediaQuery.of(context).size.width,
                                            height: widget.heightSheet ?? 500,
                                            color: widget.colorSheet ?? Colors.white,
                                            child:  Padding(
                                              padding: EdgeInsets.symmetric(vertical: widget.paddingVerticalContent ?? 20,horizontal: widget.paddingHorizontalContent ?? 20),
                                              child: FlutterLogo(),
                                            ) ,
                                          ),
                                          Positioned( //<-- SEE HERE
                                              right: widget.right,
                                              left: widget.left,
                                              top: widget.top,
                                              bottom: widget.bottom,
                                              child: widget.closeIcon ?? CloseWidget(
                                                action: (){
                                                  _dismiss();
                                                },
                                              )
                                          )
                                        ],
                                      )
                                  ) ,
                                ),
                              ],
                            )
                        ),
                      )
                    ],
                  ));
          }
      )
    );
    return overlayEntry;
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }
}