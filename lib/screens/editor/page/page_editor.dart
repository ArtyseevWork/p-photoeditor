import 'package:flutter/material.dart';
import 'package:pphotoeditor/screens/editor/page/editor_view_model.dart';
import 'package:pphotoeditor/screens/editor/ui/adjust_menu.dart';
import 'package:pphotoeditor/screens/editor/ui/bottom_apply_bar.dart';
import 'package:pphotoeditor/screens/editor/ui/bottom_editor_bar.dart';
import 'package:pphotoeditor/screens/editor/ui/filter_list.dart';
import 'package:pphotoeditor/screens/editor/ui/filter_slider.dart';
import 'package:pphotoeditor/screens/editor/ui/main_image.dart';
import 'package:pphotoeditor/screens/editor/ui/top_menu.dart';
import 'package:pphotoeditor/screens/editor/ui/transform_menu.dart';
import 'package:pphotoeditor/screens/loader.dart';
import 'package:pphotoeditor/utils/toast/widgets.dart';
import 'package:pphotoeditor/values/colors.dart';
import '../../../../../values/strings/localizer.dart';
import '../ui/blur_screen.dart';
import '../ui/confirmation_dialog.dart';
import '../core/observer.dart';


class EditorPage extends StatefulWidget {
  String imagePath;

  EditorPage({super.key, required this.imagePath});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> implements EventObserver {

  final EditorViewModel editor = EditorViewModel();
  final GlobalKey widgetKey = GlobalKey();
  bool filtersLoading = false;
  final ToastUI toastUI = ToastUI();


  @override
  void initState() {
    editor.editWallpaper(widget.imagePath);
    editor.subscribe(this);
    super.initState();
  }

  @override
  void deactivate() {
    editor.exitEditor();
    super.deactivate();
    editor.unsubscribe(this);
  }

  @override
  void notify() {
    if (editor.openViewerFlag) {
      if (editor.showSavedToast){
        showMessageToast(Localizer.get("image_was_saved"));
      }
      editor.openViewerFlag= false;
      Navigator.pop(context);//todo
      return;
    }
    setState(() {});
  }

  void saveAction(){
    editor.saveAction(widgetKey);
  }

  void setCropMode(){
    editor.setCropMode(widgetKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clrWhite,
      body: Stack(
        children: [
          editor.isLoading ? const Loader(): Column(
            children:[
              topMenu(
                  editor.activeUndo ,
                  editor.activeRedo ,
                  editor.cropMode   ,
                  editor.openCancelDialog,
                  editor.openSaveDialog,
                  editor.undoAction ,
                  editor.redoAction ,
              ),
              Expanded(
                child: Stack(
                  children: [
                    MainImage(
                      widgetKey,
                      editor.visibleImage,
                      editor.imageParams,
                      editor.cropMode,
                      editor.currentFilter,
                      editor.cropWidget,
                    ),
                    if (editor.showSlider)
                    filterSlider(
                      editor.sliderValue,
                      editor.setSliderValue
                    ),
                  ],
                ),
              ),
              if (editor.showTransformMenu) TransformMenu(
                activeCutMode  :editor.cropMode,
                rotateLeft     :editor.rotateLeft,
                rotateRight    :editor.rotateRight,
                setCutMode     :setCropMode,
                flipHorizontal :editor.flipHorizontal,
                flipVertical   :editor.flipVertical,
              ),
              if (editor.showAdjustMenu)    AdjustMenu(
                activeBrightnessMode :editor.brightnessMode,
                activeContrastMode   :editor.contrastMode  ,
                activeShadowMode     :editor.sharpenMode  ,
                activeSaturationMode :editor.saturationMode  ,
                activeSepiaMode      :editor.sepiaMode     ,
                setBrightnessMode    :editor.setBrightnessMode,
                setContrastMode      :editor.setContrastMode  ,
                setShadowMode        :editor.setSharpenMode  ,
                setSaturationMode    :editor.setSaturationMode  ,
                setSepiaMode         :editor.setSepiaMode     ,
              ),
              if (editor.showFiltersMenu)   filterList(
                  filters: editor.filterList,
                  selectFilter: editor.setFilter,
              ),
              if(    !editor.showTransformMenu
                  && !editor.showAdjustMenu
                  && !editor.showFiltersMenu ) Container(height: 64,
              ),
              if (!editor.showApplyMenu)
                BottomEditorBar(
                activeTransformMode: editor.showTransformMenu,
                activeAdjustMode: editor.showAdjustMenu,
                activeFiltersMode: editor.showFiltersMenu,
                setTransformMode: editor.setTransformMode,
                setAdjustMode: editor.setAdjustMode,
                setFiltersMode:editor.setFiltersMode,
              ),
              if (editor.showApplyMenu)
                BottomApplyBar(
                  applyAction:  editor.applyImage,
                  cancelAction: editor.cancelImage,
                ),
            ],
          ),
          if (editor.showBlurScreen) blurScreen(onPressed:editor.setDefaultMode),


          if (editor.showSaveDialog) confirmationDialog(
            message: Localizer.get('save_dialog'),
            confirmActionName: Localizer.get('save'),
            confirmAction: saveAction,
            cancelAction: editor.setDefaultMode,
          ),

          if (editor.showCancelDialog) confirmationDialog(
            message: Localizer.get('cancel_dialog'),
            confirmActionName: Localizer.get('editor_continue'),
            confirmAction: editor.closeAction,
            cancelAction: editor.setDefaultMode,
          ),
        ],
      ),
    );
  }

  void showMessageToast(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      toastUI.info(message,context),
    );
  }
}


