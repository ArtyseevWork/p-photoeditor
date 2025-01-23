import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../values/dimens.dart';
import '../filters/adjust/brightness.dart';
import '../filters/adjust/contrast.dart';
import '../filters/adjust/saturation.dart';
import '../filters/adjust/sepia.dart';
import '../filters/adjust/sharpen.dart';
import '../filters/wallpaper_filter.dart';
import '../history/image_params.dart';


class MainImage extends StatelessWidget {
  final GlobalKey widgetKey;
  Image mainImage;
  ImageParams imageParams;
  bool cropMode;
  WallpaperFilter currentFilter;
  Widget cropWidget;

  MainImage(
    this.widgetKey,
    this.mainImage,
    this.imageParams,
    this.cropMode,
    this.currentFilter,
    this.cropWidget,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {

    return cropMode? cropWidget : Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: indent4),
      child: RepaintBoundary(
          key: widgetKey,
            child: Transform(
              transform: Matrix4.identity()
                ..rotateY(imageParams.horizontalFlip ? math.pi : 0)
                ..rotateX(imageParams.verticalFlip ? math.pi : 0),
              alignment: Alignment.center,
              child:  RotatedBox(
               quarterTurns: imageParams.angle ~/ 90,
                child:
                  brightnessFilter(imageParams.brightnessValue,
                    contrastFilter(imageParams.contrastValue,
                      sharpenFilter(imageParams.sharpenValue,
                        saturationFilter(imageParams.saturationValue,
                          sepiaFilter(imageParams.sepiaValue,
                            currentFilter.getChangedWallpaper(mainImage),
                          ),
                        ),
                      ),
                    ),
                  ),
            ),
          )
      ),
    );
  }

}


