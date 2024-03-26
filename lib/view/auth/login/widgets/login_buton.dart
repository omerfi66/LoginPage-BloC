import 'package:bloccloginpage/bloc/auth/login/login_bloc.dart';
import 'package:bloccloginpage/bloc/auth/login/login_event.dart';
import 'package:bloccloginpage/view/auth/form_submission_status.dart';
import 'package:bloccloginpage/view/list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButon extends StatelessWidget {
  const LoginButon({super.key, required this.formKey});

  final dynamic formKey;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: ((context, state) {
        return state.formStatus is FormSubmiting
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.yellow.shade700,
              ))
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow.shade700,
                  minimumSize: const Size(150, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), // Köşeleri yuvarlar
                  ),
                ),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginSubmitted());
                    await Future.delayed(const Duration(seconds: 2));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListPage(),
                        ));
                  }
                },
                child: const Text(
                  'LogIn',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ));
      }),
    );
  }
}
