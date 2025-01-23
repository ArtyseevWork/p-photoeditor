
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ImagePickedState extends HomeState {
  final String imagePath;

  ImagePickedState(this.imagePath);
}

class ImagePickErrorState extends HomeState {
  final String message;

  ImagePickErrorState(this.message);
}
