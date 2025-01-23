
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pphotoeditor/image_repo.dart';
import '../../values/strings/localizer.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ImageRepo imageRepo;

  HomeBloc(this.imageRepo) : super(HomeInitial()) {
    on<PickImageEvent>(_onPickImage);
  }

  Future<void> _onPickImage(PickImageEvent event, Emitter<HomeState> emit) async {
    try {
      final imagePath = await imageRepo.pickImage(event.source);
      if (imagePath != null) {
        emit(ImagePickedState(imagePath));
      } else {
        emit(ImagePickErrorState(Localizer.get("no_image")));
      }
    } catch (e) {
      emit(ImagePickErrorState("Error: ${e.toString()}"));
    }
  }
}
