import 'package:flutter/widgets.dart';
import 'package:pphotoeditor/screens/editor/core/viewmodel.dart';

import 'editor_model.dart';

class EditorViewModel extends EventViewModel {
  final EditorModel _model      = EditorModel();
  bool  showBlurScreen          = false;
  bool  showSaveDialog          = false;
  bool  showCancelDialog        = false;
  bool  showTransformMenu       = false;
  bool  showAdjustMenu          = false;
  bool  showFiltersMenu         = false;
  bool  showSlider              = false;
  bool  showApplyMenu           = false;
  bool  openViewerFlag          = false;
  bool  showSavedToast          = false;

  bool  activeUndo         = false;
  bool  activeRedo         = false;
  int   currentMode        = 0;

  bool brightnessMode = false;
  bool contrastMode   = false;
  bool sharpenMode    = false;
  bool saturationMode = false;
  bool sepiaMode      = false;
  bool cropMode       = false;

  double sliderValue = 50;

  /* ************ helpers ***************/
  void _resetMainMenu(void Function() doAction) {
    showTransformMenu  = false;
    showAdjustMenu     = false;
    showFiltersMenu    = false;
    showSlider         = false;
    cropMode           = false;
    showSaveDialog     = false;
    showCancelDialog   = false;
    showBlurScreen     = false;
    showApplyMenu      = false;
    _resetAdjustFilters((){});
    doAction();
    notify();
  }

  void _resetAdjustFilters(void Function() doAction) {
    brightnessMode     = false;
    contrastMode       = false;
    sharpenMode        = false;
    saturationMode     = false;
    sepiaMode          = false;
    doAction();
    notify();
  }
  /* ********** ! helpers ***************/


  /* ************ actions ***************/

  Future<void> saveAction(GlobalKey widgetKey) async {
    await _model.saveWidgetToImage(widgetKey);
    showSavedToast = true;
    closeAction();
  }

  void closeAction() async{
    _resetMainMenu(() {openViewerFlag = true;});
  }

  Future<void> undoAction() async{
    _resetMainMenu(() {});
    await _model.undoAction();
    drawHistoryButtons();
    notify();
  }

  Future<void> redoAction() async{
    _resetMainMenu(() {});
    await _model.redoAction();
    drawHistoryButtons();
    notify();
  }

  Future<void> drawHistoryButtons() async{
    if(imageHistory.enablePreviousImageParams()){
      activeUndo = true;
    } else{
      activeUndo = false;
    }
    if(imageHistory.enableNextImageParams()){
      activeRedo = true;
    } else{
      activeRedo = false;
    }
  }


  Future<void> setSliderValue(double newValue) async{
      sliderValue = newValue;
      if (brightnessMode) {
        _model.setBrightnessValue(newValue);
      } else if (contrastMode) {
        _model.setContrastValue(newValue);
      } else if (sharpenMode) {
        _model.setSharpenValue(newValue);
      } else if (saturationMode) {
        _model.setSaturationValue(newValue);
      } else if (sepiaMode) {
        _model.setSepiaValue(newValue);
      } else {
        _model.currentFilter.setValue(newValue);
      }
      notify();
  }

  Future<void> setFilter(int index) async{
    showApplyMenu = true;
    _model.setCurrentFilter(index);
    sliderValue = 50;
    _model.currentFilter.setValue(50);
    showSlider = _model.currentFilter.showSlider;
    notify();
  }

  Future<void> editWallpaper(String imagePath) async {
    await _model.openWallpaper(imagePath);
    notify();
  }

  Future<void> applyImage() async{
    showApplyMenu = false;
    if (cropMode){
      cropMode = false;
      await _model.cropImage();
    } false;
    _model.applyImage();
    drawHistoryButtons();
    _resetMainMenu(() {});
  }

  Future<void> cancelImage() async{
    _resetMainMenu(() => showSlider = false);
    _model.cancelImage();
    cropMode = false;
    showApplyMenu = false;
    drawHistoryButtons();
    notify();
  }


  Future<void> rotateLeft() async{
    await _model.rotateLeft();
    cropMode  = false;
    showApplyMenu = true;
    notify();
  }

  Future<void> rotateRight() async{
    _model.rotateRight();
    cropMode      = false;
    showApplyMenu = true;
    notify();
  }

  Future<void> flipHorizontal() async{
    _model.flipHorizontal();
    cropMode      = false;
    showApplyMenu = true;
    notify();
  }

  void flipVertical() {
    _model.flipVertical();
    showApplyMenu = true;
    cropMode      = false;
    notify();
  }
  /* ********** ! actions ***************/


  /* ************ modes ***************/
  Future<void> openSaveDialog() async{
    _resetMainMenu((){
      showSaveDialog = true;
      showBlurScreen = true;
    });
  }

  Future<void>  openCancelDialog() async{
    _resetMainMenu((){
      showCancelDialog = true;
      showBlurScreen = true;
    });
  }


  void setBrightnessMode(){
    showApplyMenu = true;
    sliderValue = brightnessValue;
    showSlider = true;
    _resetAdjustFilters(() => brightnessMode = true);
  }

  void setContrastMode(){
    showApplyMenu = true;
    sliderValue = contrastValue;
    showSlider = true;
    _resetAdjustFilters(() => contrastMode = true);
  }

  void setSharpenMode(){
    showApplyMenu = true;
    sliderValue = sharpenValue;
    showSlider = true;
    _resetAdjustFilters(() => sharpenMode = true);
  }

  void setSaturationMode(){
    showApplyMenu = true;
    sliderValue = saturationValue;
    showSlider = true;
    _resetAdjustFilters(() => saturationMode = true);
  }

  void setSepiaMode(){
    showApplyMenu = true;
    sliderValue = sepiaValue;
    showSlider = true;
    _resetAdjustFilters(() => sepiaMode = true);
  }

  void setDefaultMode() {
    _resetMainMenu((){});
  }

  void setTransformMode() {
    _resetMainMenu(() => showTransformMenu = true);
  }

  void setAdjustMode() {
    _resetMainMenu(() => showAdjustMenu = true);
  }

  void setFiltersMode() {
    _resetMainMenu(() => showFiltersMenu = true);
  }

  Future <void> setCropMode(GlobalKey widgetKey) async {
    showApplyMenu = true;
    await _model.generateCropWidget(widgetKey);
    notify();
    _resetAdjustFilters(() => cropMode = true);
  }

  void exitEditor(){
    _model.exitEditor();
  }
  /* ********** ! modes ***************/

  get contrastValue    => _model.currentImageParams.contrastValue ;
  get brightnessValue  => _model.currentImageParams.brightnessValue ;
  get sharpenValue     => _model.currentImageParams.sharpenValue ;
  get saturationValue  => _model.currentImageParams.saturationValue ;
  get sepiaValue       => _model.currentImageParams.sepiaValue ;
  get filterList       => _model.filterList;
  get currentFilter    => _model.currentFilter;
  get visibleImage     => _model.currentImageParams.visibleImage;
  get imageParams      => _model.currentImageParams;
  get imageHistory     => _model.imageHistory;
  get cropWidget       => _model.cropWidget;
  get isLoading       => _model.isLoading;
}