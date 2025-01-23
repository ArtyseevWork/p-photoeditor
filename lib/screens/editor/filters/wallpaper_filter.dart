import 'dart:io';
import 'dart:typed_data';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;


abstract class WallpaperFilter {
  WallpaperFilter(
      this.imagePath,
      this.filterName,
      ) {
    generateThumbnail();
  }

  String imagePath;
  String filterName;
  Widget thumbnail = Container();
  double value = 0.5;
  bool isSelected = false;
  bool showSlider = true;
  String get name => filterName;


  Future<void> generateThumbnail() async {
    Widget thumbImage = await resizeImage(imagePath);
    thumbnail = await setFilter(thumbImage);
  }

  void setValue(double value) {
    this.value = _convertValue(value);
  }

  double _convertValue(double value) {
    return value / 100;
  }

  Widget getChangedWallpaper(Widget childWidget) {
    return
      Stack(
        children: [
          childWidget,
          Opacity(
              opacity: value,
              child:setFilter(childWidget),
          ),
        ],
      );
  }

  Widget getThumb() {
    return thumbnail;
  }

  Widget setFilter(Widget childWidget);

  Future<Widget> resizeImage(String imagePath) async {
    int newWidth  = 32;
    int newHeight = 29;
    final Uint8List bytes = File(imagePath).readAsBytesSync();
    final img.Image image = img.decodeImage(bytes)!;
    final img.Image resizedImage =
              img.copyResize(image, width: newWidth, height: newHeight);
    return Image.memory(Uint8List.fromList(img.encodePng(resizedImage)));
  }
}