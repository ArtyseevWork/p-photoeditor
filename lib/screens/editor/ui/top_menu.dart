import 'package:flutter/material.dart';

import '../../../../../values/strings/localizer.dart';
import '../core/button_action.dart';
import '../values/colors.dart';
import '../values/dimens.dart';
import '../values/images.dart';


Widget topMenu(
  final bool         activeUndo ,
  final bool         activeRedo ,
  final bool         cropMode   ,
  final ButtonAction closeAction,
  final ButtonAction saveAction ,
  final ButtonAction undoAction ,
  final ButtonAction redoAction ,
){

  return SafeArea(
    child: Container(
      height: height64,
      child: cropMode? Container() :
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          TextButton(
              onPressed: closeAction,
              child: icnCloseEditor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: undoAction,
                  child: activeUndo? icnUndoA : icnUndo
              ),
              TextButton(
                  onPressed: redoAction,
                  child: activeRedo? icnRedoA : icnRedo
              ),
            ],
          ),

          TextButton(
            onPressed: saveAction,
            child:
              Text(Localizer.get('save'),
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color:violetColor,
                  fontSize:fontSize20,
                  fontWeight: FontWeight.w400,
                  fontFamily:'Inter',
                ),
              ),
          ),
        ],
      ),
    ),
  );
}