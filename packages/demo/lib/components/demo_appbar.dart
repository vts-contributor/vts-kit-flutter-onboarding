import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vts_component/common/style/vts_color.dart';

class DemoAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final bool goBack;

  const DemoAppbar({
    this.title = "VTS Design System",
    this.leading,
    this.goBack = true,

  }): super();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: VTSColors.PRIMARY_0,
      title: Text(
        title, 
        style: TextStyle(
          fontFamily: 'Sarabun',
          fontWeight: FontWeight.bold,
          color: VTSColors.WHITE_1
        )
      ),
      leading: 
        goBack 
        ? InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Icon(
                CupertinoIcons.back,
                color: VTSColors.WHITE_1,
              ),
            ),
          )
        : leading,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}