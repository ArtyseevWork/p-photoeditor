import 'dart:ui' as ui;
import 'package:flutter/material.dart';

contrastFilter (double value, Widget child) {
  double convertedValue = convertRange(value);
  return ColorFiltered(
    colorFilter: ui.ColorFilter.matrix(<double>[
      convertedValue, 0, 0, 0, 0,
      0, convertedValue, 0, 0, 0,
      0, 0, convertedValue, 0, 0,
      0, 0, 0, 1, 0,
    ]),
    child: child,
  );
}

double convertRange(double value) {
  if (value <= 0) {
    value = 1;
  } else if (value > 100) {
    value = 100;
  }
   return value / 50.0;
}
