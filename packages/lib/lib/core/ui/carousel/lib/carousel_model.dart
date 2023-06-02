import 'package:flutter/material.dart';

class CarouselModel extends StatelessWidget{
  final String title;
  final String description;
  final String imgUrl;
  final double? imageWidth;
  final double? imageHeight;
  final BoxFit? fitImage;
  final TextStyle? titleStyle;
  final TextAlign? alignTitle;
  final TextAlign? alignDescription;
  final TextStyle? descriptionStyles;
  final double? titleMarginHorizontal;
  final double? titleMarginVertical;
  final double? titlePaddingHorizontal;
  final double? titlePaddingVertical;
  final double? descriptionMarginHorizontal;
  final double? descriptionMarginVertical;
  final double? descriptionPaddingHorizontal;
  final double? descriptionPaddingVertical;


  const CarouselModel({
    required this.title,
    required this.description,
    required this.imgUrl,
    this.imageWidth,
    this.imageHeight,
    this.fitImage,
    this.titleStyle,
    this.alignTitle,
    this.alignDescription,
    this.descriptionStyles,
    this.titleMarginHorizontal,
    this.titleMarginVertical,
    this.descriptionMarginHorizontal,
    this.descriptionMarginVertical,
    this.titlePaddingHorizontal,
    this.titlePaddingVertical,
    this.descriptionPaddingHorizontal,
    this.descriptionPaddingVertical,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SizedBox(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                imgUrl ,
                width: imageWidth,
                height: imageHeight,
                fit: fitImage ?? BoxFit.contain,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: titleMarginHorizontal ?? 12,
                vertical: titleMarginVertical ?? 0,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: titlePaddingHorizontal ?? 0,
                vertical: titlePaddingVertical ?? 0,
              ),
              child: Text(
                title ,
                textAlign: alignTitle ?? TextAlign.center,
                style: titleStyle ??
                    const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: descriptionMarginHorizontal ?? 12,
                vertical: descriptionMarginVertical ?? 0,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: descriptionPaddingHorizontal ?? 0,
                vertical: descriptionPaddingVertical ?? 12,
              ),
              child: Text(
                description,
                textAlign: alignDescription ?? TextAlign.center,
                style: descriptionStyles ??
                    const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      decoration: TextDecoration.none,
                    ),
              ),
            ),
          ],
        ),
      ),
    ) ;
  }
}
