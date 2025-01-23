import 'package:pphotoeditor/values/strings/localizer.dart';
import 'default.dart';
import 'filters.dart';
import 'wallpaper_filter.dart';

class FilterStack {

  static Future<List<WallpaperFilter>> getAllFilters(String imagePath) async {
    List<WallpaperFilter> resultList = [];
    resultList.add(Default(imagePath, Localizer.get('Default')));
    //resultList.add(AddictiveBlue(imagePath, Localizer.get('AddictiveBlue')));
    resultList.add(AddictiveRed(imagePath,  Localizer.get('AddictiveRed')));
    //resultList.add(Aden(imagePath, Localizer.get('Aden')));
    resultList.add(Ashby(imagePath, Localizer.get('Ashby')));
    resultList.add(Brannan(imagePath, Localizer.get('Brannan')));
    //resultList.add(Brooklyn(imagePath, Localizer.get('Brooklyn')));
    //resultList.add(Charmes(imagePath, Localizer.get('Charmes')));
    //resultList.add(Clarendon(imagePath, Localizer.get('Clarendon')));
    //resultList.add(Crema(imagePath, Localizer.get('Crema')));
    //resultList.add(Dogpatch(imagePath, Localizer.get('Dogpatch')));
    //resultList.add(Earlybird(imagePath, Localizer.get('Earlybird')));
    resultList.add(F1977(imagePath, Localizer.get('F1977')));
    //resultList.add(Gingham(imagePath, Localizer.get('Gingham')));
    //resultList.add(Ginza(imagePath, Localizer.get('Ginza')));
    //resultList.add(Hefe(imagePath, Localizer.get('Hefe')));
    //resultList.add(Helena(imagePath, Localizer.get('Helena')));
    resultList.add(Hudson(imagePath, Localizer.get('Hudson')));
    //resultList.add(Inkwell(imagePath, Localizer.get('Inkwell')));
    //resultList.add(Juno(imagePath, Localizer.get('Juno')));
    //resultList.add(Kelvin(imagePath, Localizer.get('Kelvin')));
    //resultList.add(Lark(imagePath, Localizer.get('Lark')));
    resultList.add(LoFi(imagePath, Localizer.get('LoFi')));
    //resultList.add(Ludwig(imagePath, Localizer.get('Ludwig')));
    //resultList.add(Maven(imagePath, Localizer.get('Maven')));
    //resultList.add(Mayfair(imagePath, Localizer.get('Mayfair')));
    //resultList.add(Moon(imagePath, Localizer.get('Moon')));
    //resultList.add(Nashville(imagePath, Localizer.get('Nashville')));
    //resultList.add(Perpetua(imagePath, Localizer.get('Perpetua')));
    //resultList.add(Reyes(imagePath, Localizer.get('Reyes')));
    resultList.add(Rise(imagePath, Localizer.get('Rise')));
    //resultList.add(Sierra(imagePath, Localizer.get('Sierra')));
    resultList.add(Skyline(imagePath, Localizer.get('Skyline')));
    //resultList.add(Slumber(imagePath, Localizer.get('Slumber')));
    //resultList.add(Stinson(imagePath, Localizer.get('Stinson')));
    //resultList.add(Sutro(imagePath, Localizer.get('Sutro')));
    //resultList.add(Toaster(imagePath, Localizer.get('Toaster')));
    //resultList.add(Valencia(imagePath, Localizer.get('Valencia')));
    //resultList.add(Vesper(imagePath, Localizer.get('Vesper')));
    resultList.add(Walden(imagePath, Localizer.get('Walden')));
    resultList.add(Willow(imagePath, Localizer.get('Willow')));
    resultList.add(XProII(imagePath, Localizer.get('XProII')));

    return resultList;
  }
}

