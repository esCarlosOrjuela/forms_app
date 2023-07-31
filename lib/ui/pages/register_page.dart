import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/inputs/password.dart';

import '../state_managers/cubits/register/register_cubit.dart';
import '../widgets/custom_textform_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nuevo Usuario'),
        ),
        body: BlocProvider(
          create: (context) => RegisterCubit(),
          child: const _RegisterView()
        ));
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FlutterLogo(size: 100),
                  SizedBox(height: 27),
                  _RegisterForms(),
                ],
              ),
            )));
  }
}

class _RegisterForms extends StatelessWidget {
  const _RegisterForms();

  @override
  Widget build(BuildContext context) {
    final bindingRegisterFormCubit = context.watch<RegisterCubit>();
    final userName = bindingRegisterFormCubit.state.userName;
    final email = bindingRegisterFormCubit.state.email;
    final password = bindingRegisterFormCubit.state.password;

    return Form(
        child: Column(children: [
          CustomTextFormField(
            label: 'Nombre Usuario',
            errorMessage: userName.errorMessage,
            onChanged: (text) => bindingRegisterFormCubit.usernameChanged(text),
          ),
          const SizedBox(height: 15),
          CustomTextFormField(
              label: 'Correo',
              errorMessage: email.errorMessage,
              onChanged: (text) => bindingRegisterFormCubit.emailChanged(text),
            ),
          const SizedBox(height: 15),
          CustomTextFormField(
              label: 'Contraseña',
              isPassword: true,
              errorMessage: password.errorMessage,
              onChanged: (text) => bindingRegisterFormCubit.passwordChanged(text),
            ),
          const SizedBox(height: 27),
          FilledButton.tonalIcon(
            onPressed: () {
              bindingRegisterFormCubit.onSubmit();
            },
            label: const Text('Crear Usuario'),
            icon: const Icon(Icons.add_task_sharp),
          ),
          const SizedBox(height: 27)
        ]));
  }
}
