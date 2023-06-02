import 'package:flutter/material.dart';

//ignore: must_be_immutable
class BtnWidget extends StatelessWidget{
  double? widthBtn;
  double? heightBtn;
  final onClick;
  String? text;
  double? horizontalBtn;
  Color? colorBgBtn;
  double? radiusButton;
  Color? coloBorderBtn;
  double? widthBorder;
  double?  elevation;
  Color? colorText;
  double? sizeText;

  BtnWidget({
    required this.onClick,
    this.widthBtn,
    this.heightBtn,
    this.text,
    this.horizontalBtn,
    this.colorBgBtn,
    this.radiusButton,
    this.coloBorderBtn,
    this.widthBorder,
    this.elevation,
    this.colorText,
    this.sizeText
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: horizontalBtn ?? 20),
      child: SizedBox(
        width: widthBtn ?? MediaQuery.of(context).size.width,
        height: heightBtn ?? 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radiusButton ?? 12), // <-- Radius
              ),
              elevation: elevation ?? 0,
              backgroundColor: colorBgBtn ?? Colors.red,
              side: BorderSide(
                width: widthBorder ?? 1,
                color: coloBorderBtn ?? Colors.red,
              )
          ),
          onPressed: onClick,
          child: Text(
            text ?? "Oke",
            style: TextStyle(color: colorText ?? Colors.white,fontSize:sizeText?? 15 ),
          ),
        ),
      ),
    );
  }

  // Padding(
  // padding: const EdgeInsets.symmetric(horizontal: 20),
  // child: SizedBox(
  // width: screenSize.width,
  // height: 50,
  // child: ElevatedButton(
  // style: ElevatedButton.styleFrom(
  // shape: RoundedRectangleBorder(
  // borderRadius: BorderRadius.circular(12), // <-- Radius
  // ),
  // elevation: 0,
  // backgroundColor: Colors.red
  // ),
  // onPressed: () => _onNextTap(carouselState),
  // child: Text(
  // carouselState.isLastPage ? "Đăng nhập" : "Đăng nhập",
  // style: const TextStyle(color: Colors.white),
  // ),
  // ),
  // ),
  // )

}