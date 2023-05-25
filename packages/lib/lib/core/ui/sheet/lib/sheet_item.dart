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
  bool _showItem = false;
  Timer? timer;


  @override
  void initState() {
    context.read<SheetContext>().addListener(() {
      showSheet();
    });

    if(widget.barrierColor != null){
      barrierColorCurrent = widget.barrierColor!;
    }
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _animation = Tween<Offset>(
      begin:  Offset(0, widget.direction == SheetDirection.top ? -1 : 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: widget.curve ?? Curves.bounceOut,
    ));

    super.initState();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    showSheet();
  }

  void _hideContainer() {
    if (_isVisible) {
      _animationController.reverse();
      _animationController.reverse();

      setState(() {
        _isVisible = false;
      });
    }
  }

  void showSheet() {
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
  Widget build(BuildContext context) {
    if (_showItem)
      return Scaffold(
        body: WillPopScope(
            onWillPop: () async {
              return false;
            },
          child: Container(
              color: barrierColorCurrent.withOpacity(_isVisible ? widget.barrierOpacity ?? 0.6 : 0),
              child: Stack(
                children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: (){
                            _hideContainer();

                          },
                          child: Container(
                            color: Colors.transparent,
                          )
                      ) ),
                  Positioned(
                    top: widget.direction == SheetDirection.top ? 0 : null,
                    bottom: widget.direction == SheetDirection.bottom ? 0 : null,
                    child:
                        Align(
                            alignment: widget.alignSheet ?? Alignment.center,
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
                                              child: CloseWidget(
                                                action: (){
                                                  if (!state.disableBarrierInteraction) {
                                                    _nextIfAny();
                                                  }
                                                  widget.onActionClick?.call();
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
              ))
        )
      );
    return SizedBox.shrink();
  }
}