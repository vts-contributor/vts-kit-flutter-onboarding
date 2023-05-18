import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vts_component/common/style/vts_color.dart';
import 'package:vts_component/common/style/vts_common.dart';

class DemoListTile extends StatefulWidget {
  const DemoListTile(
      {
        Key? key,
        this.padding,
        this.margin,
        required this.text,
        this.svgAssets,
        this.onTap
      })
      : super(key: key);

  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String? text;
  final String? svgAssets;
  final VoidCallback? onTap;

   @override
  _DemoListTileState createState() => _DemoListTileState();
}

class _DemoListTileState extends State<DemoListTile> {
  late bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          onTap: widget.onTap ?? () {},
          highlightColor: VTSColors.PRIMARY_0,
          hoverColor: VTSColors.ILUS_RED_6,
          focusNode: new FocusNode(),
          onHighlightChanged: (e) {setState(() {
            isPressed = e;
          });},
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 18.0, vertical: 22.0),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: VTSColors.ILUS_GRAY_6),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                widget.svgAssets != null
                ? SvgPicture.asset(
                  widget.svgAssets!,
                  color: isPressed ? VTSColors.WHITE_1 : VTSColors.GRAY_2,
                )
                : SizedBox.shrink(),
                widget.svgAssets != null ? SizedBox(width: 8.0) : SizedBox.shrink(),
                Text(
                  widget.text!,
                  textAlign: TextAlign.start,
                  style: VTSCommon.TEXT_STYLE_BODY_1_16.merge(TextStyle(color: isPressed ? VTSColors.WHITE_1 : VTSColors.BLACK_1)),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
          ),
        )
      ) 
    );
  }
}
