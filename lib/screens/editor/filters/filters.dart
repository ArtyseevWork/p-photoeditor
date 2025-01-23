
import 'dart:ui';
import 'package:colorfilter_generator/colorfilter_generator.dart';
import 'package:colorfilter_generator/presets.dart';
import 'package:flutter/material.dart';
import 'package:pphotoeditor/screens/editor/filters/wallpaper_filter.dart';


class AddictiveRed extends WallpaperFilter {
  AddictiveRed(super.imagePath, super.filterName);
  @override
  Widget setFilter(Widget childWidget){
    ColorFilterGenerator myFilter = ColorFilterGenerator(
        name: filterName,
        filters: [
          PresetFilters.addictiveRed.matrix,
        ]
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}


class AddictiveBlue extends WallpaperFilter {
  AddictiveBlue(super.imagePath, super.filterName);
  @override
  Widget setFilter(Widget childWidget){
    ColorFilterGenerator myFilter = ColorFilterGenerator(
        name: filterName,
        filters: [
          PresetFilters.addictiveBlue.matrix,
        ]
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}
class Amaro extends WallpaperFilter {
  Amaro(super.imagePath, super.filterName);
  @override
  Widget setFilter(Widget childWidget){
    ColorFilterGenerator myFilter = ColorFilterGenerator(
        name: filterName,
        filters: [
          PresetFilters.amaro.matrix,
        ]
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Aden extends WallpaperFilter {
  Aden(super.imagePath, super.filterName);
  @override
  Widget setFilter(Widget childWidget){
    ColorFilterGenerator myFilter = ColorFilterGenerator(
        name: filterName,
        filters: [
          PresetFilters.aden.matrix,
        ]
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Ashby extends WallpaperFilter {
  Ashby(super.imagePath, super.filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.ashby.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Brannan extends WallpaperFilter {
  Brannan(super.imagePath, super.filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.brannan.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Brooklyn extends WallpaperFilter {
  Brooklyn(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.brooklyn.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Charmes extends WallpaperFilter {
  Charmes(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.charmes.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Clarendon extends WallpaperFilter {
  Clarendon(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.clarendon.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Crema extends WallpaperFilter {
  Crema(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.crema.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Dogpatch extends WallpaperFilter {
  Dogpatch(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.dogpatch.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Earlybird extends WallpaperFilter {
  Earlybird(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.earlybird.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class F1977 extends WallpaperFilter {
  F1977(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.f1977.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Gingham extends WallpaperFilter {
  Gingham(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.gingham.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Ginza extends WallpaperFilter {
  Ginza(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.ginza.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Hefe extends WallpaperFilter {
  Hefe(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.hefe.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Helena extends WallpaperFilter {
  Helena(String imagePath, String filterName) : super(imagePath, filterName);

  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.helena.matrix,
      ],
    );

    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Hudson extends WallpaperFilter {
  Hudson(String imagePath, String filterName) : super(imagePath, filterName);

  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.hudson.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Inkwell extends WallpaperFilter {
  Inkwell(String imagePath, String filterName) : super(imagePath, filterName);

  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.inkwell.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Juno extends WallpaperFilter {
  Juno(String imagePath, String filterName) : super(imagePath, filterName);

  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.juno.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Kelvin extends WallpaperFilter {
  Kelvin(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.kelvin.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Lark extends WallpaperFilter {
  Lark(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.lark.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class LoFi extends WallpaperFilter {
  LoFi(String imagePath, String filterName) : super(imagePath, filterName);

  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.loFi.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Ludwig extends WallpaperFilter {
  Ludwig(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.ludwig.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Maven extends WallpaperFilter {
  Maven(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.maven.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Mayfair extends WallpaperFilter {
  Mayfair(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.mayfair.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Moon extends WallpaperFilter {
  Moon(String imagePath, String filterName) : super(imagePath, filterName);

  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.moon.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Nashville extends WallpaperFilter {
  Nashville(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.nashville.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Perpetua extends WallpaperFilter {
  Perpetua(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.perpetua.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Reyes extends WallpaperFilter {
  Reyes(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.reyes.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Rise extends WallpaperFilter {
  Rise(String imagePath, String filterName) : super(imagePath, filterName);

  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.rise.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Sierra extends WallpaperFilter {
  Sierra(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.sierra.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Skyline extends WallpaperFilter {
  Skyline(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.skyline.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Slumber extends WallpaperFilter {
  Slumber(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.slumber.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Stinson extends WallpaperFilter {
  Stinson(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.stinson.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Sutro extends WallpaperFilter {
  Sutro(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.sutro.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Toaster extends WallpaperFilter {
  Toaster(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.toaster.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Valencia extends WallpaperFilter {
  Valencia(String imagePath, String filterName) : super(imagePath, filterName);

  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.valencia.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Vesper extends WallpaperFilter {
  Vesper(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.vesper.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Walden extends WallpaperFilter {
  Walden(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.walden.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class Willow extends WallpaperFilter {
  Willow(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.willow.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}

class XProII extends WallpaperFilter {
  XProII(String imagePath, String filterName) : super(imagePath, filterName);
  @override
  Widget setFilter(Widget childWidget) {
    ColorFilterGenerator myFilter = ColorFilterGenerator(
      name: filterName,
      filters: [
        PresetFilters.xProII.matrix,
      ],
    );
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(myFilter.matrix),
      child: childWidget,
    );
  }
}