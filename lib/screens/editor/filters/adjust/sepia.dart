import 'dart:ui' as ui;
import 'package:flutter/material.dart';

Widget sepiaFilter(double intensity, Widget child) {
  double x = intensity/100;
  return ColorFiltered(
    colorFilter: ui.ColorFilter.matrix(<double>[
      1-(0.61*x), 0+(0.769*x), 0+(0.189*x), 0,  0,
      0+(0.349*x), 1-0.324*x, 0+(0.168*x), 0,  0,
      0+(0.272*x), 0+(0.534*x) ,1-0.869*x, 0,  0,
      0,  0, 0, 1,  0,
    ]),
    child: child,
  );
}
