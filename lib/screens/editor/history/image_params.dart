import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:flutter/widgets.dart';
import '../filters/wallpaper_filter.dart';
import '../image_helper.dart';

class ImageParams {

  ImageParams(this.visibleImage, this.filter, this.originalFileForCrop);

  double contrastValue   = 50;
  double brightnessValue = 50;
  double sharpenValue    = 0;
  double saturationValue = 100;
  double sepiaValue      = 0;
  double angle           = 0;
  bool   verticalFlip    = false;
  bool   horizontalFlip  = false;
  Image  visibleImage;
  WallpaperFilter filter;
  File originalFileForCrop;

  ImageParams clone() {
    return ImageParams(visibleImage, filter, originalFileForCrop)
      ..contrastValue = contrastValue
      ..brightnessValue = brightnessValue
      ..sharpenValue = sharpenValue
      ..saturationValue = saturationValue
      ..sepiaValue = sepiaValue
      ..angle = angle
      ..verticalFlip = verticalFlip
      ..horizontalFlip = horizontalFlip;
  }

  Future<void> rotateImage90() async {
    img.Image? image = img.decodeImage(await originalFileForCrop.readAsBytes());
    image = img.copyRotate(image!, angle :angle);
    File file = await saveImageToFile(image);
    visibleImage = Image.file(file);
  }


  Future<void> flipImageVertically() async {
    img.Image? image = img.decodeImage(await originalFileForCrop.readAsBytes());
    image = img.flipVertical(image!); // Отражаем по вертикали
    saveImageToFile(image);
    verticalFlip = !verticalFlip;
  }

  Future<File> saveImageToFile(img.Image image) async {
    String fileName = ImageHelper.getUniqueImageName();
    String filePath = await ImageHelper.getFilePath(fileName);
    final File fileForCrop = File(filePath);
    await fileForCrop.writeAsBytes(img.encodePng(image));
    ImageHelper.deleteFile(originalFileForCrop.path);
    originalFileForCrop = fileForCrop;
    return fileForCrop;
  }
}