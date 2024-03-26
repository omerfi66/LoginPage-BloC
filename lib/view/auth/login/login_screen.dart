import 'package:bloccloginpage/bloc/auth/login/login_bloc.dart';
import 'package:bloccloginpage/repository/auth/login/login_repository.dart';
import 'package:bloccloginpage/view/auth/form_submission_status.dart';
import 'package:bloccloginpage/view/auth/login/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final authRepo = LoginRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
          create: (context) =>
              LoginBloc(authRepo: context.read<LoginRepository>()),
          child: BlocListener<LoginBloc, LoginState>(
            listenWhen: (previous, current) =>
                previous.formStatus != current.formStatus,
            listener: (context, state) {
              final formStatus = state.formStatus;
              if (formStatus is SubmissionFailed) {
                _showSnackBar(context, formStatus.exception.toString());
              }
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  //mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset('assets/penguin.png'),
                    const SizedBox(height: 15),
                    FormWidget()
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _showSnackBar(BuildContext context, String mesaage) {
    final snackBar = SnackBar(content: Text(mesaage));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
