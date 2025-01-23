import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'package:image/image.dart' as img;

class ImageResizeParams {
  final String imagePath;
  final int newWidth;
  final int newHeight;

  ImageResizeParams(this.imagePath, this.newWidth, this.newHeight);
}

class ImageResizer {
  static Future<String> resizeImage(String imagePath, int newWidth, int newHeight) async {
    // Создаем порт для общения с изолятом
    final receivePort = ReceivePort();

    // Запускаем изолят
    await Isolate.spawn(_resizeImageIsolate, receivePort.sendPort);

    // Получаем sendPort из изолята
    final sendPort = await receivePort.first as SendPort;

    // Создаем новый ReceivePort для ответа
    final responsePort = ReceivePort();

    // Отправляем данные в изолят
    sendPort.send([
      ImageResizeParams(imagePath, newWidth, newHeight),
      responsePort.sendPort,
    ]);

    // Получаем результат
    final resizedImagePath = await responsePort.first as String;
    return resizedImagePath;
  }

  // Функция, которая выполняется в изоляте
  static void _resizeImageIsolate(SendPort sendPort) {
    // Создаем порт для общения внутри изолята
    final port = ReceivePort();

    // Отправляем sendPort изолята обратно
    sendPort.send(port.sendPort);

    // Слушаем входящие сообщения
    port.listen((message) async {
      final params = message[0] as ImageResizeParams;
      final replyPort = message[1] as SendPort;

      try {
        // Выполняем операцию изменения размера
        final resizedImagePath = await _resizeImage(
          params.imagePath,
          params.newWidth,
          params.newHeight,
        );

        // Отправляем результат обратно
        replyPort.send(resizedImagePath);
      } catch (e) {
        print("Ошибка в изоляте: $e");
        replyPort.send("");
      }
    });
  }

  // Логика изменения размера изображения (как у вас)
  static Future<String> _resizeImage(String imagePath, int newWidth, int newHeight) async {
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
  }
}
