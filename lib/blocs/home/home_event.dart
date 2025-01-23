
import 'package:image_picker/image_picker.dart';

abstract class HomeEvent {}

class PickImageEvent extends HomeEvent {
  final ImageSource source;

  PickImageEvent(this.source);
}
