
import '../image_helper.dart';
import 'image_params.dart';

class ImageHistory {
  final int size;
  final List<ImageParams> listImageParams = [];
  int position = -1;

  ImageHistory(this.size);

  ImageParams? getPreviousImageParams() {
    if (position > 0) {
      position--;
      return listImageParams[position];
    }
    return null;
  }

  ImageParams? getCurrentImageParams() {
      return listImageParams[position];
  }

  ImageParams? getNextImageParams() {
    if (position < listImageParams.length - 1) {
      position++;
      return listImageParams[position];
    }
    return null;
  }

  bool enablePreviousImageParams() {
    return position > 0;
  }

  bool enableNextImageParams() {
    return position < listImageParams.length - 1;
  }

  void addNewImageParams(ImageParams? imageParams) {
    if (imageParams == null) {
      return;
    }
    if (position < listImageParams.length - 1) {
      for (int i = listImageParams.length - 1; i >= position + 1; i--) {
        listImageParams.removeAt(i);
      }
    }

    if (listImageParams.length >= size) {
      listImageParams.removeAt(0);
      position--;
    }
    listImageParams.add(imageParams.clone());
    position++;
  }

  bool wasSomeEdit() {
    return listImageParams.length > 1;
  }

  void resetHistory(){
    for (var i in  listImageParams) {
      try {
        var x = i.originalFileForCrop;
        ImageHelper.deleteFile(x.path);
      } catch (e){
        print("resetHistory: $e");
      }
    }
  }
}

