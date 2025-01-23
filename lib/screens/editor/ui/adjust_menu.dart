import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import '../../../../../values/strings/localizer.dart';
import '../core/button_action.dart';
import '../values/colors.dart';
import '../values/dimens.dart';
import '../values/images.dart';

class AdjustMenu extends StatelessWidget {
  final bool         activeBrightnessMode;
  final bool         activeContrastMode  ;
  final bool         activeShadowMode  ;
  final bool         activeSaturationMode  ;
  final bool         activeSepiaMode     ;
  final ButtonAction setBrightnessMode;
  final ButtonAction setContrastMode  ;
  final ButtonAction setShadowMode  ;
  final ButtonAction setSaturationMode  ;
  final ButtonAction setSepiaMode     ;

  const AdjustMenu({
    Key? key,
    required this.activeBrightnessMode,
    required this.activeContrastMode  ,
    required this.activeShadowMode  ,
    required this.activeSaturationMode  ,
    required this.activeSepiaMode     ,
    required this.setBrightnessMode   ,
    required this.setContrastMode     ,
    required this.setShadowMode     ,
    required this.setSaturationMode     ,
    required this.setSepiaMode        ,
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
        children: [
          buildBottomBarButton(         //Brightness
            onPressed: () {setBrightnessMode();},
            child:(activeBrightnessMode) ? icnBrightnessA : icnBrightness,
            title: Localizer.get('brightness'),
            isActive: activeBrightnessMode,
          ),
          buildBottomBarButton(       //Contrast
            onPressed: () {setContrastMode();},
            child:(activeContrastMode) ? icnContrastA : icnContrast,
            title: Localizer.get('contrast'),
            isActive: activeContrastMode,
          ),
          buildBottomBarButton(       //shadow
            onPressed: () {setShadowMode();},
            child: (activeShadowMode) ? icnShadowA : icnShadow,
            title: Localizer.get("sharpen"),
            isActive: activeShadowMode,
          ),
          buildBottomBarButton(       //saturation
            onPressed: () {setSaturationMode();},
            child: (activeSaturationMode) ? icnSaturationA : icnSaturation,
            title: Localizer.get("saturation"),
            isActive: activeSaturationMode,
          ),
          buildBottomBarButton(       //Sepia
            onPressed: () {setSepiaMode();},
            child: (activeSepiaMode) ? icnSepiaA : icnSepia,
            title: Localizer.get("sepia"),
            isActive: activeSepiaMode,
          ),
        ],
      ),
    );
  }

  Widget buildBottomBarButton({
    required VoidCallback onPressed,
    required Widget child,
    required String title,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
