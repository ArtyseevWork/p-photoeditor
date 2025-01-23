import 'dart:ui' as ui;
import 'package:flutter/material.dart';

Widget saturationFilter(double saturation, Widget child) {
  double convertedSaturation = _convertRange(saturation);
  return ColorFiltered(
    colorFilter: ui.ColorFilter.matrix(<double>[
      0.213 + 0.787 * convertedSaturation, 0.715 - 0.715 * convertedSaturation, 0.072 - 0.072 * convertedSaturation, 0, 0,
      0.213 - 0.213 * convertedSaturation, 0.715 + 0.285 * convertedSaturation, 0.072 - 0.072 * convertedSaturation, 0, 0,
      0.213 - 0.213 * convertedSaturation, 0.715 - 0.715 * convertedSaturation, 0.072 + 0.928 * convertedSaturation, 0, 0,
      0, 0, 0, 1, 0,
    ]),
    child: child,
  );
}

double _convertRange(double value) {
  if (value <= 0) {
    value = 0;
  } else if (value > 100) {
    value = 100;
  }
  return value / 100.0;
}
