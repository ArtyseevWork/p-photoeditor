import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import '../../../../../values/strings/localizer.dart';
import '../core/button_action.dart';
import '../values/colors.dart';
import '../values/dimens.dart';


class BottomApplyBar extends StatelessWidget {
  final ButtonAction applyAction;
  final ButtonAction cancelAction;

  const BottomApplyBar({
    Key? key,
    required this.applyAction,
    required this.cancelAction,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height64 + (Platform.isIOS ? iosIndent : 0),
      padding: EdgeInsets.only(bottom: Platform.isIOS ? iosIndent : 0),
      color: blackColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildBottomBarButton(         //Cancel
            onPressed: cancelAction,
            title: Localizer.get('editor_cancel'),
          ),
          buildBottomBarButton(       //Apply
            onPressed: applyAction,
            title: Localizer.get('editor_apply'),
          ),
        ],
      ),
    );
  }

  Widget buildBottomBarButton({
    required VoidCallback onPressed,
    required String title,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: indent8,
            horizontal: indent16
        ),
        child:
          Text(
            title,
            style: const TextStyle(
              color:violetColor,
              fontSize:fontSize20,
              fontWeight: FontWeight.w400,
              fontFamily:'Inter',
            ),
        ),
      )
    );
  }

}

