import 'dart:ui';
import 'package:flutter/material.dart';


Widget sharpenFilter(double value, Widget child) {

  var c = ColorFilter.mode(
    Colors.black.withOpacity(value/200),
    BlendMode.srcATop,
  );

  return ColorFiltered(
    colorFilter: c,
    child: child,
  );
}

double convertRange(double value) {
  if (value <= 0) {
    value = 0;
  } else if (value > 100) {
    value = 100;
  }

  return value / 1;
}