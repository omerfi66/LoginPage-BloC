import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginUserNameChange extends LoginEvent {
  final String? userName;

  LoginUserNameChange({this.userName});
  @override
  List<Object?> get props => [userName];
}

class LoginPasswordChange extends LoginEvent {
  final String? password;

  LoginPasswordChange({this.password});
  @override
  List<Object?> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  @override
  List<Object?> get props => [];
}
