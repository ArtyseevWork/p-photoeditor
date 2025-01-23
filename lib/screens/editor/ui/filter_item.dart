import 'package:flutter/material.dart';

import '../values/colors.dart';
import '../values/dimens.dart';
import '../filters/wallpaper_filter.dart';

Widget filterItem({
  required WallpaperFilter filter,
  required VoidCallback onTap,
}) {

  Color textColor = grey4Color;
  Widget thumbImage = ClipRRect(
    borderRadius: BorderRadius.circular(4), // Закругляем углы изображения
    child: filter.thumbnail, // Используем ClipRRect для обрезки изображения
  );

  if (filter.isSelected) {
    textColor = whiteColor;
    thumbImage = Container(
      padding: const EdgeInsets.all(1), // Добавляем отступы для рамки
      decoration: BoxDecoration(
        color: Colors.white, // Белый цвет рамки
        borderRadius: BorderRadius.circular(4), // Закругляем углы рамки
      ),
      child: thumbImage,
    );

  }

  return  InkWell(
    onTap: onTap,
    child: Container(
      width: width72,
      height: height64,
      margin: const EdgeInsets.only(
        left: indent8,
        right: indent8
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          thumbImage,
          Text(
            filter.name,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize14,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          )
        ],
      ),
    ),
  );
}

