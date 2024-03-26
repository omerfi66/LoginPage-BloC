import 'package:bloccloginpage/bloc/auth/login/login_bloc.dart';
import 'package:bloccloginpage/bloc/auth/login/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserNameTextfield extends StatelessWidget {
  const UserNameTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
                color: Colors.yellow.shade700,
                width: 2.0), // Border color and thickness
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
                color: Colors.yellow.shade700,
                width: 2.0), // Focused border color and thickness
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
                color: Colors.yellow.shade700,
                width: 2.0), // Enabled border color and thickness
          ),
          icon: const Icon(Icons.person),
          hintText: 'username',
        ),
        validator: (value) =>
            state.isValidUsername ? null : 'User name is too short',
        onChanged: (value) {
          context.read<LoginBloc>().add(LoginUserNameChange(userName: value));
        },
      );
    });
  }
}
