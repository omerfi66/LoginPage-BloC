part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String userName;
  bool get isValidUsername => userName.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  const LoginState({
    this.userName = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith(
      {String? userName, String? password, FormSubmissionStatus? formStatus}) {
    return LoginState(
        userName: userName ?? this.userName,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus);
  }

  @override
  List<Object?> get props => [userName, password, formStatus];
}

//final class LoginInitial extends LoginState {}
