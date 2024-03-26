import 'package:bloc/bloc.dart';
import 'package:bloccloginpage/bloc/auth/login/login_event.dart';
import 'package:bloccloginpage/repository/auth/login/login_repository.dart';
import 'package:bloccloginpage/view/auth/form_submission_status.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository? authRepo;

  LoginBloc({this.authRepo}) : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginUserNameChange) {
      emit(state.copyWith(userName: event.userName));
    } else if (event is LoginPasswordChange) {
      emit(state.copyWith(password: event.password));
    } else if (event is LoginSubmitted) {
      emit(state.copyWith(formStatus: FormSubmiting()));

      try {
        await authRepo?.login();
        emit(state.copyWith(formStatus: SubmissionSucces()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
