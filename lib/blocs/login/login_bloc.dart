import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pphotoeditor/values/strings/localizer.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  static const int phoneNumberLength = 5; // длина номера телефона
  String _phoneNumber = "";

  LoginBloc() : super(LoginInitialState()) {
    on<LoginNumberKeyPressed>(_onKeyPressed);
    on<LoginNumberClearPressed>(_onClearPressed);
    on<LoginNumberSubmitPressed>(_onSubmitPressed);
  }

  void _onKeyPressed(
      LoginNumberKeyPressed event,
      Emitter<LoginBlocState> emit
  ) {
    if (_phoneNumber.length < 15) {
      _phoneNumber += event.key;
      emit(LoginNumberUpdated(_phoneNumber));
    }
  }

  void _onClearPressed(
      LoginNumberClearPressed event,
      Emitter<LoginBlocState> emit
  ) {
    if (_phoneNumber.isNotEmpty) {
      _phoneNumber = _phoneNumber.substring(0, _phoneNumber.length - 1);
      emit(LoginNumberUpdated(_phoneNumber));
    }
  }

  Future<void> _onSubmitPressed(
      LoginNumberSubmitPressed event,
      Emitter<LoginBlocState> emit
  ) async {
    emit(LoginLoading()); // Состояние загрузки
    if (!_isValidPhoneNumber(_phoneNumber)) {
      emit(LoginErrorState(Localizer.get("invalid_phone")));
      return;
    }

    final isServerValid = await _checkPhoneNumberOnServer(_phoneNumber);
    if (!isServerValid) {
      emit(LoginErrorState(Localizer.get("failed_verification")));
    } else {
      emit(LoginSuccess());
    }
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    return phoneNumber.length == phoneNumberLength;
  }

  Future<bool> _checkPhoneNumberOnServer(String phoneNumber) async {
    var result = false;
    try {
      if (phoneNumber == "77777") result = true;
      await Future.delayed(Duration(seconds: 1)); // имитация запроса
      return result; // пример ответа
    } catch (e) {
      print("Ошибка подключения к серверу: $e");
      return false;
    }
  }

}
