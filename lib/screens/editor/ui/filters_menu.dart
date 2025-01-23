import 'dart:io' show Platform;
import 'package:flutter/material.dart';

import '../../../../../values/strings/localizer.dart';
import '../core/button_action.dart';
import '../values/colors.dart';
import '../values/dimens.dart';
import '../values/images.dart';


class FiltersMenu extends StatelessWidget {
  final bool         activeTransformMode;
  final bool         activeAdjustMode;
  final bool         activeFiltersMode;
  final ButtonAction setTransformMode;
  final ButtonAction setAdjustMode;
  final ButtonAction setFiltersMode;

  const FiltersMenu({
    Key? key,
    required this.activeTransformMode,
    required this.activeAdjustMode,
    required this.activeFiltersMode,
    required this.setTransformMode,
    required this.setAdjustMode,
    required this.setFiltersMode,
  }) : super(key: key);

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
            child:(activeTransformMode) ? iconGeneratorA : iconGenerator,
            title: Localizer.get('transform'),
            isActive: activeTransformMode,
          ),
          buildBottomBarButton(       //Adjust
            onPressed: () {setAdjustMode();},
            child:(activeAdjustMode) ? iconGalleryA : iconGallery,
            title: Localizer.get('adjust'),
            isActive: activeAdjustMode,
          ),
          buildBottomBarButton(       //Filters
            onPressed: () {setFiltersMode();},
            child: (activeAdjustMode) ? iconGalleryA : iconGallery,
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
        children: [
          child,
            Text(title),
          ],
        ),
      ),
    );
  }

  }
