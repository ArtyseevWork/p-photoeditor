import 'package:flutter/material.dart';
import 'package:pphotoeditor/values/colors.dart';

import '../values/colors.dart';
import '../values/dimens.dart';

Widget filterSlider(
    double sliderValue,
    Function(double) action,){
  return Positioned(
    bottom: indent16,
    left: indent16,
    right: indent16,
    child: SliderTheme(
      data: const SliderThemeData(
        thumbShape: AppSliderShape(thumbRadius: indent12),
      ),
      child: Slider(
        value: sliderValue,
        onChanged: (value) {
          action(value);
        },
        activeColor: clrYellow,
        inactiveColor: clrYellow,
        min: 0.0,
        max: 100.0,
        divisions: 100,
        thumbColor: violetColor,
      ),
    ),
  );
}


class AppSliderShape extends SliderComponentShape {
  final double thumbRadius;

  const AppSliderShape({required this.thumbRadius});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = violetColor;

    // draw icon with text painter
    const iconData = Icons.brightness_1_rounded;
    final TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
          fontSize: thumbRadius ,
          fontFamily: iconData.fontFamily,
          color: clrRed,
        )
    );
    textPainter.layout();

    final Offset textCenter = Offset(center.dx - (textPainter.width / 2),
        center.dy - (textPainter.height / 2));
    canvas.drawCircle(center, thumbRadius, paint);

    textPainter.paint(canvas, textCenter);
  }
}
