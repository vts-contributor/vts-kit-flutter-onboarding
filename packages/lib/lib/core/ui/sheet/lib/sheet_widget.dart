// import 'package:flutter/material.dart';
//
// import 'close.dart';
//
// class SheetWidget extends StatelessWidget{
//   final Duration animationDuration;
//   final Curve? curve;
//   final Color? barrierColor;
//   final double? barrierOpacity;
//   final double? radiusTopLeft;
//   final double? radiusTopRight;
//   final double? radiusBottomLeft;
//   final double? radiusBottomRight;
//   final double? widthSheet;
//   final double? heightSheet;
//   final Color? colorSheet;
//   final Alignment? alignSheet;
//   final double? paddingVerticalContent;
//   final double? paddingHorizontalContent;
//   final VoidCallback? onActionClick;
//
//   const SheetWidget({
//     required this.animationDuration,
//     this.curve,
//     this.barrierColor,
//     this.barrierOpacity,
//     this.radiusTopLeft,
//     this.radiusTopRight,
//     this.radiusBottomLeft,
//     this.radiusBottomRight,
//     this.widthSheet,
//     this.heightSheet,
//     this.colorSheet,
//     this.alignSheet,
//     this.paddingVerticalContent,
//     this.paddingHorizontalContent,
//     this.onActionClick,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//         alignment: alignSheet ?? Alignment.bottomCenter,
//         child: Stack(
//           children: [
//             SlideTransition(
//               position: _animation,
//               child: ClipRRect(
//                   borderRadius:  BorderRadius.only(
//                     topLeft: Radius.circular(radiusTopLeft ?? 30),
//                     topRight: Radius.circular(radiusTopRight ?? 30),
//                     bottomRight: Radius.circular(radiusBottomRight ?? 0),
//                     bottomLeft: Radius.circular(radiusBottomLeft ?? 0),
//                   ),
//                   child: Stack(
//                     children: [
//                       Container(
//                         width: widthSheet ?? MediaQuery.of(context).size.width,
//                         height: heightSheet ?? 500,
//                         color: colorSheet ?? Colors.white,
//                         child:  Padding(
//                           padding: EdgeInsets.symmetric(vertical: paddingVerticalContent ?? 20,horizontal: paddingHorizontalContent ?? 20),
//                           child: FlutterLogo(),
//                         ) ,
//                       ),
//                       Positioned( //<-- SEE HERE
//                           right: 0,
//                           top: 0,
//                           child: CloseWidget(
//                             action: (){
//                               // _hideContainer();
//                               if (!state.disableBarrierInteraction) {
//                                 _nextIfAny();
//                               }
//                               onActionClick?.call();
//                             },
//                           )
//                       )
//                     ],
//                   )
//               ) ,
//             ),
//           ],
//         )
//     )
//   }
// }