import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:pphotoeditor/values/colors.dart';

import '../../../../../values/strings/localizer.dart';
import '../core/button_action.dart';
import '../values/colors.dart';
import '../values/dimens.dart';
import '../values/images.dart';


class BottomEditorBar extends StatelessWidget {
  final bool         activeTransformMode;
  final bool         activeAdjustMode;
  final bool         activeFiltersMode;
  final ButtonAction setTransformMode;
  final ButtonAction setAdjustMode;
  final ButtonAction setFiltersMode;

  const BottomEditorBar({
    Key? key,
    required this.activeTransformMode,
    required this.activeAdjustMode,
    required this.activeFiltersMode,
    required this.setTransformMode,
    required this.setAdjustMode,
    required this.setFiltersMode,
  }) : super(key: key);

  TextStyle getTextStyle(bool isActive){
    Color textColor = isActive? Colors.white : clrActive;

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
      color: blackColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildBottomBarButton(         //Transform
            onPressed: () {setTransformMode();},
            child:(activeTransformMode) ? icnTransformA : icnTransform,
            title: Localizer.get('transform'),
            isActive: activeTransformMode,
          ),
          buildBottomBarButton(       //Adjust
            onPressed: () {setAdjustMode();},
            child:(activeAdjustMode) ? icnAdjustA : icnAdjust,
            title: Localizer.get('adjust'),
            isActive: activeAdjustMode,
          ),
          buildBottomBarButton(       //Filters
            onPressed: () {setFiltersMode();},
            child: (activeFiltersMode) ? icnFiltersA  : icnFilters,
            title: Localizer.get("filters"),
            isActive: activeFiltersMode,
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
            Text(
              title,
              style : getTextStyle(isActive)
            ),
          ],
        ),
      ),
    );
  }

}

