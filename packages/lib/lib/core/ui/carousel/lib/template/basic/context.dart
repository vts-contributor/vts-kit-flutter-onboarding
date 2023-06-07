import 'package:flutter/material.dart';

class CarouselBasicItemContext extends ChangeNotifier {
  final EdgeInsets? titlePadding;
  final TextStyle? titleStyle;
  final TextAlign? titleAlignment;

  final EdgeInsets? bodyPadding;
  final TextStyle? bodyStyle;
  final TextAlign? bodyAlignment;

  final EdgeInsets? footerPadding;
  final ButtonStyle? okBtnStyle;
  final ButtonStyle? cancelBtnStyle;

  final MainAxisAlignment contentAlignment;

  CarouselBasicItemContext({
    this.titlePadding = const EdgeInsets.only(bottom: 8.0),
    this.titleStyle = const TextStyle(
        color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.bold),
    this.titleAlignment = TextAlign.center,
    this.bodyPadding,
    this.bodyStyle =
        const TextStyle(color: Colors.black87, fontSize: 16.0, height: 1.4),
    this.bodyAlignment = TextAlign.center,
    this.footerPadding = const EdgeInsets.only(top: 32),
    this.okBtnStyle = const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0)),
        minimumSize: MaterialStatePropertyAll(Size.zero),
        textStyle:
            MaterialStatePropertyAll(TextStyle(fontSize: 16.0, height: 1.5)),
        backgroundColor:
            MaterialStatePropertyAll(Color.fromARGB(255, 248, 69, 91)),
        foregroundColor: MaterialStatePropertyAll(Colors.white),
        shadowColor: MaterialStatePropertyAll(Colors.transparent)),
    this.cancelBtnStyle = const ButtonStyle(
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0)),
      minimumSize: MaterialStatePropertyAll(Size.zero),
      textStyle:
          MaterialStatePropertyAll(TextStyle(fontSize: 16.0, height: 1.5)),
      foregroundColor:
          MaterialStatePropertyAll(Color.fromARGB(255, 248, 69, 91)),
      side: MaterialStatePropertyAll(BorderSide(
          color: Color.fromARGB(255, 248, 69, 91),
          width: 1.0,
          style: BorderStyle.solid)),
      backgroundColor: MaterialStatePropertyAll<Color>(Colors.transparent),
      shadowColor: MaterialStatePropertyAll<Color>(Colors.transparent),
    ),
    this.contentAlignment = MainAxisAlignment.center,
  });
}
