
import 'package:image_picker/image_picker.dart';

class ImageRepo {
  final ImagePicker _imagePicker = ImagePicker();

  Future<String?> pickImage(ImageSource source) async {
    try {
      final XFile? xFile = await _imagePicker.pickImage(source: source);
      return xFile?.path;
    } catch (e) {
      throw Exception("Error pickImage $e");
    }
  }
}
