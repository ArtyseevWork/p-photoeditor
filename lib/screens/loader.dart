import 'package:flutter/material.dart';
import 'dart:ui';


class Loader extends StatelessWidget {
  const Loader({super.key});

  final double size = 50.0;
  final Color loaderColor = Colors.white;
  final double strokeWidth = 4.0;
  final Color backgroundColor = Colors.black54;
  final double blurAmount = 5.0;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        // Затемнённый и заблюренный фон
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurAmount, sigmaY: blurAmount),
            child: Container(
              color: backgroundColor,
            ),
          ),
        ),
        // Лоадер по центру
        Center(
          child: SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              color: loaderColor,
              strokeWidth: strokeWidth,
            ),
          ),
        ),
      ],
    );
  }
}