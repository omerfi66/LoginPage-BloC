import 'package:bloccloginpage/view/auth/login/widgets/login_buton.dart';
import 'package:bloccloginpage/view/auth/login/widgets/password_textfield.dart';
import 'package:bloccloginpage/view/auth/login/widgets/username_textfield.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  FormWidget({super.key});

  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const UserNameTextfield(),
            const SizedBox(height: 15),
            const PasswordTextfield(),
            const SizedBox(height: 15),
            LoginButon(formKey: _formKey),
          ],
        ));
  }
}
