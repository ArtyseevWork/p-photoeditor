import 'package:equatable/equatable.dart';

abstract class LoginBlocState extends Equatable {
  const LoginBlocState();
  @override
  List<Object?> get props => [];
}

class LoginNumberUpdated extends LoginBlocState {
  final String phoneNumber;
  const LoginNumberUpdated(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class LoginErrorState extends LoginBlocState {
  final String errorMessage;

  const LoginErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class LoginInitialState extends LoginBlocState {}

class LoginSuccess extends LoginBlocState {}

class LoginLoading extends LoginBlocState {}



