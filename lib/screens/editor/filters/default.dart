import 'package:flutter/material.dart';
import 'package:pphotoeditor/screens/editor/filters/wallpaper_filter.dart';


class Default extends WallpaperFilter {

  Default(super.imagePath, super.filterName){
    showSlider = false;
    value = 1;
  }

  @override
  Widget setFilter(Widget childWidget){
    return childWidget;
  }
  @override void setValue(double value) {
  }
}