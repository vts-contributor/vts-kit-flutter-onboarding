import 'package:flutter/material.dart';
import 'package:vts_component/common/style/vts_color.dart';

class DemoSubtitle extends StatelessWidget {
  const DemoSubtitle(
      {
        Key? key,
        this.title,
        this.left = 0,
        this.right = 0,
        this.top = 8,
        this.bottom = 16,
      })
      : super(key: key);

  final double left;
  final double right;
  final double top;
  final double bottom;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title != null 
        ? Container(
            padding: EdgeInsets.fromLTRB(left, top, right, bottom),
            color: VTSColors.TRANSPARENT,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title!,
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
          )
        ) : SizedBox.shrink(),
      ],
    );
  }
}
