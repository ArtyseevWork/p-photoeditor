import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pphotoeditor/values/strings/localizer.dart';
import 'package:share_plus/share_plus.dart';



class ImageHelper {
  static const double _thumbCoefficient = 0.5;
  static const String _watermarkAssetPath = 'assets/images/watermark.png';
  static const double _watermarkHeight = 51;
  static const double _watermarkOffset = 24;

  static ui.Image? _cachedWatermark;

  static Future<ui.Image> get _watermark async {
    if (_cachedWatermark != null) {
      return _cachedWatermark!;
    }
    final ByteData bytes = await rootBundle.load(_watermarkAssetPath);
    final codec = await ui.instantiateImageCodec(bytes.buffer.asUint8List());
    _cachedWatermark = (await codec.getNextFrame()).image;
    return _cachedWatermark!;
  }

  static Future<String> saveUInt8(Uint8List image) async {
    final String fileName = '${DateTime.now().millisecondsSinceEpoch}';
    final File imageFile = File('img_$fileName');
    final File thumbFile = File('prv_$fileName');
    final thumb = _resize(image, _thumbCoefficient);
    await imageFile.writeAsBytes(image);
    await thumbFile.writeAsBytes(thumb);
    return fileName;
  }

  static Future<String> saveImageToTempFile(Uint8List image) async {
    try {
      // Получаем временный каталог
      final tempDir = await getTemporaryDirectory();

      // Создаём уникальное имя для файла
      final tempFilePath = '${tempDir.path}/temp_image_${DateTime.now().millisecondsSinceEpoch}.png';

      // Сохраняем данные в файл
      final tempFile = File(tempFilePath);
      await tempFile.writeAsBytes(image);

      // Возвращаем путь к временному файлу
      return tempFilePath;
    } catch (e) {
      print('Ошибка при создании временного файла: $e');
      rethrow; // Пробрасываем исключение выше, если необходимо
    }
  }


  static Uint8List _resize(Uint8List imageData, double coefficient) {
    img.Image image = img.decodeImage(imageData)!;
    img.Image resizedImage = img.copyResize(
      image,
      width: (image.width * coefficient).toInt(),
      height: (image.height * coefficient).toInt(),
    );
    return img.encodeJpg(resizedImage);
  }

  static Future<String> toBase64(String assetPath) async {
    ByteData bytes = await rootBundle.load(assetPath);
    final buffer = bytes.buffer;
    return base64.encode(Uint8List.view(buffer));
  }

  static Future<bool> saveToSystemGalleryWithWatermark(String imagePath) async {
    try {
      String imageTempPath = await _addWatermark(imagePath);
      await ImageGallerySaverPlus.saveFile(imageTempPath);
      File(imageTempPath).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> saveToSystemGallery(String imagePath) async {
    try {
      await ImageGallerySaverPlus.saveFile(imagePath);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<String> _addWatermark(String imagePath) async {
    final imageFile = File(imagePath);
    if (!imageFile.existsSync()) {
      return '';
    }

    final Uint8List bytes = await imageFile.readAsBytes();
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ui.Image image = frameInfo.image;

    const double offsetX = _watermarkOffset;
    final double offsetY = image.height - _watermarkHeight - _watermarkOffset;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    canvas.drawImage(image, Offset.zero, Paint());
    canvas.drawImage(await _watermark, Offset(offsetX, offsetY), Paint());
    final picture = recorder.endRecording();
    final img = await picture.toImage(image.width, image.height);
    final pngBytes = await img.toByteData(format: ui.ImageByteFormat.png);
    return await _saveToTemporaryFile(pngBytes!.buffer.asUint8List());
  }

  static Future<String> _saveToTemporaryFile(Uint8List bytes) async {
    try {
      final directory = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final imageFile = File('${directory.path}/temp_image_$timestamp.jpg');
      await imageFile.writeAsBytes(bytes);
      return imageFile.path;
    } catch (e) {
      return '';
    }
  }

  static Future<void> share(String imagePath) async {
    try {
      String imageTempPath = await _addWatermark(imagePath);
      if (Platform.isAndroid) {
        await Share.shareXFiles(
          [XFile(imageTempPath) ],
          text: Localizer.get('image_share'),
        );
      } else if (Platform.isIOS) {
        await Share.shareXFiles(
          [XFile(imageTempPath, name: 'image')],
          text: Localizer.get('image_share'),
        );
      }
      File(imageTempPath).delete();
    } catch (e) {
      return;
    }
  }

  static void delete(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      return;
    }
  }

  static Future<String> getFilePath(String fileName) async {
    final directory = await getTemporaryDirectory();
    String filePath = '${directory.path}/$fileName';
    return filePath;
  }

  static void deleteFile(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
      } else {
      }
    } catch (e) {
      print("deleteFile Error : $e");
    }
  }

  static String getUniqueImageName() {
    return'pc_${DateTime.now().millisecondsSinceEpoch}';
  }

  static Future<String> resizeImage(String imagePath, int newWidth, int newHeight) async {
    try {
      // Читаем исходное изображение
      final file = File(imagePath);
      if (!file.existsSync()) {
        throw Exception("Файл не найден: $imagePath");
      }
      final imageBytes = await file.readAsBytes();

      // Декодируем изображение
      final originalImage = img.decodeImage(imageBytes);
      if (originalImage == null) {
        throw Exception("Не удалось декодировать изображение");
      }

      // Изменяем размеры изображения
      final resizedImage = img.copyResize(
        originalImage,
        width: newWidth,
        height: newHeight,
      );

      // Создаем путь для сохранения уменьшенного изображения
      final directory = Directory.systemTemp; // Временная директория
      final resizedImagePath = '${directory.path}/resized_image.png';

      // Кодируем изображение обратно в PNG
      final resizedImageBytes = img.encodePng(resizedImage);

      // Сохраняем новое изображение на диск
      final resizedFile = File(resizedImagePath);
      await resizedFile.writeAsBytes(resizedImageBytes);

      return resizedImagePath;
    } catch (e) {
      print("Ошибка при уменьшении изображения: $e");
      rethrow;
    }
  }

  static Future<String> resizeImageFromFile(XFile imageFile, int newWidth, int newHeight) async {
    try {
      // Читаем исходное изображение
      final imageBytes = await imageFile.readAsBytes();

      // Декодируем изображение
      final originalImage = img.decodeImage(imageBytes);
      if (originalImage == null) {
        throw Exception("Не удалось декодировать изображение");
      }

      // Изменяем размеры изображения
      final resizedImage = img.copyResize(
        originalImage,
        width: newWidth,
        height: newHeight,
      );

      // Создаем путь для сохранения уменьшенного изображения
      final directory = Directory.systemTemp; // Временная директория
      final resizedImagePath = '${directory.path}/resized_image.png';

      // Кодируем изображение обратно в PNG
      final resizedImageBytes = img.encodeJpg(resizedImage, quality: 85);

      // Сохраняем новое изображение на диск
      final resizedFile = File(resizedImagePath);
      await resizedFile.writeAsBytes(resizedImageBytes);

      return resizedImagePath;
    } catch (e) {
      print("Ошибка при уменьшении изображения: $e");
      rethrow;
    }
  }

}
