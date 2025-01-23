import 'package:flutter/material.dart';

import '../../../../../values/strings/localizer.dart';
import '../core/button_action.dart';
import '../values/colors.dart';
import '../values/dimens.dart';

Widget confirmationDialog({
  String? title,
  required String message,
  required String confirmActionName,
  required ButtonAction cancelAction,
  required ButtonAction confirmAction,
}) {
  return Align(
    alignment: Alignment.center,
    child: IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: indent33,
          horizontal: indent16
        ),
        margin: const EdgeInsets.all(indent16),
        decoration: BoxDecoration(
          color: blackColor,
          borderRadius: BorderRadius.circular(radius24),
        ),
        child: Column(
          children: [
            if (title != null)Text(
              title.toUpperCase(),
              style: const TextStyle(
                color:yellowColor,
                fontSize:fontSize24,
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: indent16),
            Text(message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: whiteColor,
                fontSize: fontSize16,
                fontWeight: FontWeight.w400
              ),
            ),
            const SizedBox(height: indent30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _cancelButton(cancelAction),
                _confirmButton(confirmAction, confirmActionName),
              ],
            ),
          ],
        )
      ),
    ),
  );
}

Widget _cancelButton(ButtonAction cancelAction) {
  return GestureDetector(
    onTap: cancelAction,
    child: Container(
      width: 120,
      height:height56,
      decoration: BoxDecoration(
        color: blackColor,
        borderRadius: BorderRadius.circular(radius16),
        border: Border.all(
          color: middleGreyColor,
          width: 1.0,
        ),
      ),
      child: Center(
        child: Text(
          Localizer.get('button_cancel'),
          style: const TextStyle(
            color: whiteColor,
            fontSize: fontSize20,
            fontWeight: FontWeight.w400
          ),
        ),
      ),
    ),
  );
}

Widget _confirmButton(
  ButtonAction confirmAction,
  String confirmActionName,
) {
  return GestureDetector(
    onTap: confirmAction,
    child: Container(
      width: 120,
      height: height56,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(radius16),
        border: Border.all(
          color: middleGreyColor,
          width: 1.0,
        ),
      ),
      child: Center(
        child: Text(
          confirmActionName,
          style: const TextStyle(
            color:blackColor,
            fontSize:fontSize20,
            fontWeight: FontWeight.w700
          ),
        ),
      ),
    ),
  );
}