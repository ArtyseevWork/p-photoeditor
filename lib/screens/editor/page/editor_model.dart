import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_crop_plus/image_crop_plus.dart';
import 'package:pphotoeditor/utils/debug_logger.dart';
import '../../image_resizer.dart';
import '../filters/filter_catalog.dart';
import '../filters/default.dart';
import '../filters/wallpaper_filter.dart';
import '../image_helper.dart';
import '../history/image_history.dart';
import '../history/image_params.dart';
import 'package:image/image.dart' as img;

class EditorModel {

  String currentImagePath = "";
  late ImageParams currentImageParams;
  List<WallpaperFilter> filterList = [];
  late WallpaperFilter _currentFilter;
  late ImageHistory imageHistory;
  Widget cropWidget = Container();
  final cropKey = GlobalKey<CropState>();
  bool isLoading = true;


  void setBrightnessValue(double newValue){
    currentImageParams.brightnessValue = newValue;
  }

  void setContrastValue(double newValue){
    currentImageParams.contrastValue = newValue;
  }

  void setSharpenValue(double newValue){
    currentImageParams.sharpenValue = newValue;
  }

  void setSaturationValue(double newValue){
    currentImageParams.saturationValue = newValue;
  }

  void setSepiaValue(double newValue){
    currentImageParams.sepiaValue = newValue;
  }

  WallpaperFilter get currentFilter => _currentFilter;

  setCurrentFilter(int index){
    _currentFilter = filterList[index];
    unselectFilters();
    _currentFilter.isSelected = true;
  }

  void applyImage(){
    currentImageParams.filter = _currentFilter;
    imageHistory.addNewImageParams(currentImageParams);
    unselectFilters();
  }

  Future<void> openWallpaper(String imagePath) async{
    DebugLogger().log();
    currentImagePath = imagePath;
    DebugLogger().log();
    File currentImageFile = File(imagePath);
    final smallImagePath = await ImageResizer.resizeImage(
        currentImagePath, 32, 29
    );
    _currentFilter = Default(smallImagePath, "Default");
    DebugLogger().log();
    imageHistory = ImageHistory(15);
    currentImageParams = ImageParams(
        Image.file(currentImageFile),
        _currentFilter,
        File(imagePath)
    );
    imageHistory.addNewImageParams(currentImageParams);

    loadFilters(smallImagePath);
    DebugLogger().log();
    isLoading = false;
  }

  Future<void> loadFilters(String smallImagePath) async {
    filterList = await FilterStack.getAllFilters(smallImagePath);
  }

  void cancelImage(){
      var imageHistoryItem = imageHistory.getCurrentImageParams();
      if (imageHistoryItem != null) {
        currentImageParams = imageHistoryItem.clone();
        _currentFilter = currentImageParams.filter;
      }
      unselectFilters();
  }

  Future<void> rotateLeft()  async{
    currentImageParams.angle = currentImageParams.angle - 90;
  }

  void rotateRight() {
    currentImageParams.angle = currentImageParams.angle + 90;
  }

  void flipHorizontal() {
    currentImageParams.horizontalFlip = !currentImageParams.horizontalFlip;
  }

  Future<void> flipVertical() async{
    currentImageParams.verticalFlip = !currentImageParams.verticalFlip;
  }

  Future<void> undoAction() async{
    if (imageHistory.enablePreviousImageParams()){
      var prevImageHistory = imageHistory.getPreviousImageParams();
      if (prevImageHistory != null) {
        currentImageParams = prevImageHistory.clone();
        _currentFilter = currentImageParams.filter;
      }
    }
  }

  Future<void> redoAction() async {
    if (imageHistory.enableNextImageParams()) {
      var nextImageHistory = imageHistory.getNextImageParams();
      if (nextImageHistory != null) {
        currentImageParams = nextImageHistory.clone();
        _currentFilter = currentImageParams.filter;
      }
    }
  }

  Future<void> saveWidgetToImage(GlobalKey widgetKey) async {
    Uint8List uint8listImage = await captureWidgetToImage(widgetKey);
    String newFilePath = await ImageHelper.saveImageToTempFile(uint8listImage);
    print ("newFilePath = $newFilePath ");
    ImageHelper.saveToSystemGallery(newFilePath);
  }

  Future<Uint8List> captureWidgetToImage(GlobalKey widgetKey) async {
    try {
      RenderRepaintBoundary boundary =
        widgetKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 2.0);
      ByteData? byteData
      = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        return byteData.buffer.asUint8List();
      }
      return Uint8List(0);
    } catch (e) {
      print("Error capturing widget to image: $e");
      return Uint8List(0);
    }
  }

  Future<void> generateCropWidget(GlobalKey widgetKey) async {
    Uint8List uint8listImage = await captureWidgetToImage(widgetKey);
    String fileName = ImageHelper.getUniqueImageName();
    String filePath = await ImageHelper.getFilePath(fileName);
    final File fileForCrop = File(filePath);
    await fileForCrop.writeAsBytes(uint8listImage);
    cropWidget =  Padding(
      padding: const EdgeInsets.only(bottom: 42),
      child: Crop.file(
        fileForCrop,
        key: cropKey,
      ),
    );
  }

  Future<void> cropImage() async {
    var croppedArea = cropKey.currentState!.area;
    cropKey.currentState!.area;
    if (croppedArea == null) {
      return;
    }

    if (currentImageParams.verticalFlip){ //transform rectangle for cutting
      croppedArea = Rect.fromLTRB(
          croppedArea.left,
          1 - croppedArea.bottom,
          croppedArea.right,
          1 - croppedArea.top
      );
    }

    if (currentImageParams.horizontalFlip){
      croppedArea = Rect.fromLTRB(
          1 - croppedArea.right,
          croppedArea.top,
          1 -  croppedArea.left,
          croppedArea.bottom
      );
    }
    double angleInDegrees = currentImageParams.angle % 360;

    if (angleInDegrees == 90 || angleInDegrees == -270) {
      croppedArea = Rect.fromLTRB(
          croppedArea.top,
          1 - croppedArea.right,
          croppedArea.bottom,
          1 - croppedArea.left
      );
    } else if (angleInDegrees == -90 || angleInDegrees == 270) {
      croppedArea = Rect.fromLTRB(
          1 - croppedArea.bottom,
          croppedArea.left,
          1 - croppedArea.top,
          croppedArea.right
      );
    } else if (angleInDegrees == 180 || angleInDegrees == -180) {
      croppedArea = Rect.fromLTRB(
          1 - croppedArea.right,
          1 - croppedArea.bottom,
          1 - croppedArea.left,
          1 - croppedArea.top
      );
    }

    final file = await ImageCrop.cropImage(
      file: currentImageParams.originalFileForCrop,
      area: croppedArea,
    );
    currentImageParams.originalFileForCrop = file;
    currentImageParams.visibleImage = Image.file(
        currentImageParams.originalFileForCrop
    );
  }

  void unselectFilters() {
    for (var filter in filterList) {
      filter.isSelected = false;
    }
  }

  Future<void> exitEditor() async {
    // TODO: do something with this shit
    //imageHistory.resetHistory();
  }

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




