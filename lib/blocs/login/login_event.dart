abstract class LoginBlocEvent {}

class LoginNumberKeyPressed extends LoginBlocEvent {
  final String key;
  LoginNumberKeyPressed(this.key);
}

class LoginNumberClearPressed extends LoginBlocEvent {}

class LoginNumberSubmitPressed extends LoginBlocEvent {}
