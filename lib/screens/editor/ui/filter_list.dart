import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import '../values/colors.dart';
import '../values/dimens.dart';
import '../filters/wallpaper_filter.dart';
import 'filter_item.dart';


Widget filterList({
  required List<WallpaperFilter> filters,
  required Function(int filterPosition) selectFilter,
}) {
  return Container(
    height: height64 + (Platform.isIOS ? iosIndent : 0),
    padding: EdgeInsets.only(bottom: Platform.isIOS ? iosIndent : 0),
    color: middleGreyColor,
    child:  ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: filters.length,
      clipBehavior: Clip.none,
      itemBuilder: (BuildContext context, int index) {
        return filterItem(
          filter: filters[index],
          onTap: () {
            selectFilter(index);
          },
        );
      },
    ),
  );
}
