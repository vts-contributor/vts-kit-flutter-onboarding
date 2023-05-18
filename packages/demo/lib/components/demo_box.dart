import 'package:flutter/material.dart';
import 'package:vts_component/common/style/vts_color.dart';

class DemoBox extends StatelessWidget {
  const DemoBox(
      {
        Key? key,
        this.left = 16,
        this.right = 16,
        this.top = 8,
        this.bottom = 16,
        this.child,
        this.title,
        this.padding,
        this.margin,
        this.background
      })
      : super(key: key);

  final double left;
  final double right;
  final double top;
  final double bottom;
  final Widget? child;
  final String? title;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title != null 
        ? Container(
            height: 36,
            padding: EdgeInsets.fromLTRB(left, 0, right, 0),
            color: VTSColors.TRANSPARENT,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title!,
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
          )
        ) : SizedBox.shrink(),
        child != null 
        ? Container(
          width: MediaQuery.of(context).size.width,
          color: background ?? VTSColors.WHITE_1,
          padding: padding ?? EdgeInsets.fromLTRB(left, top, right, bottom),
          margin: margin,
          child: child
        ) : const SizedBox.shrink()
      ],
    );
  }
}
