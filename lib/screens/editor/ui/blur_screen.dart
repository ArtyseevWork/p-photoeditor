import 'dart:ui';
import 'package:flutter/material.dart';
import '../values/colors.dart';

Widget blurScreen({VoidCallback? onPressed}){
  return  Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      top: 0,
      child: GestureDetector(
        onTap: onPressed,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: middleGreyTr80Color,
          ),
        ),
      )
  );
}