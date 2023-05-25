import 'package:flutter/material.dart';

class CloseWidget extends StatefulWidget{
  final IconData? icon;
  final Color? colorIcon;
  final double? sizeIcon;
  final action;
  final double? maxRadiusBgIcon;
  final Color? bgColor;
  final double? verticalPadding;
  final double? horizontalPadding;

  CloseWidget({
    this.icon,
    this.colorIcon,
    this.sizeIcon,
    required this.action,
    this.maxRadiusBgIcon,
    this.bgColor,
    this.verticalPadding,
    this.horizontalPadding,
  });
  @override
  State<StatefulWidget> createState() => _CloseWidgetState();
}

class _CloseWidgetState extends State<CloseWidget>{
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
                  vertical: widget.verticalPadding ?? 15,
                  horizontal: widget.horizontalPadding ?? 15
                 ),
        child: CircleAvatar(
          maxRadius: widget.maxRadiusBgIcon ?? 12,
          backgroundColor: widget.bgColor ?? Colors.grey,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon:  Icon(
                widget.icon ?? Icons.close,
                color: widget.colorIcon ?? Colors.white,
                size: widget.sizeIcon?? 20
            ),
            onPressed: widget.action
          ),
        )
    ) ;
  }
}