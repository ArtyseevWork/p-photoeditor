import 'dart:io' show Platform;
import 'package:flutter/material.dart';

import '../../../../../values/strings/localizer.dart';
import '../core/button_action.dart';
import '../values/colors.dart';
import '../values/dimens.dart';
import '../values/images.dart';

class TransformMenu extends StatelessWidget {
  final bool         activeCutMode;
  final ButtonAction rotateLeft;
  final ButtonAction rotateRight  ;
  final ButtonAction setCutMode  ;
  final ButtonAction flipHorizontal  ;
  final ButtonAction flipVertical     ;

  const TransformMenu({
    Key? key,
    required this.activeCutMode,
    required this.rotateLeft   ,
    required this.rotateRight     ,
    required this.setCutMode     ,
    required this.flipHorizontal     ,
    required this.flipVertical        ,
  }) : super(key: key);

  TextStyle getTextStyle(bool isActive){
    Color textColor = isActive? whiteColor : grey4Color;

    return TextStyle(
        color:textColor,
        fontSize:fontSize14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height64 + (Platform.isIOS ? iosIndent : 0),
      padding: EdgeInsets.only(bottom: Platform.isIOS ? iosIndent : 0),
      color: middleGreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildBottomBarButton(         //rotate left
            onPressed: () {rotateLeft();},
            child: icnRotateLeft,
            title: Localizer.get('rotate_left'),
          ),
          buildBottomBarButton(       //rotate right
            onPressed: () {rotateRight();},
            child: icnRotateRight,
            title: Localizer.get('rotete_right'),
          ),
          buildBottomBarButton(       //cut
            onPressed: () {setCutMode();},
            child: (activeCutMode) ? icnCutA : icnCut,
            title: Localizer.get("cut"),
            isActive: activeCutMode,
          ),
          buildBottomBarButton(       //flip horizontal
            onPressed: () {flipHorizontal();},
            child: icnFlipHorizontal,
            title: Localizer.get("flip horizontal"),
          ),
          buildBottomBarButton(       //flip vertical
            onPressed: () {flipVertical();},
            child: icnFlipVertical,
            title: Localizer.get("flip vertical"),
          ),
        ],
      ),
    );
  }

  Widget buildBottomBarButton({
    required VoidCallback onPressed,
    required Widget child,
    required String title,
    bool isActive = false,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
            Text(
              title,
              style : getTextStyle(isActive),
            ),
          ],
        ),
      ),
    );
  }
}
