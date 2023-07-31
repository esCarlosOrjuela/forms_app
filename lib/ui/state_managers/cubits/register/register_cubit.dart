import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/inputs/email.dart';
import 'package:forms_app/infrastructure/inputs/password.dart';
import 'package:formz/formz.dart';

import '../../../../infrastructure/inputs/username.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void usernameChanged(String value) {
    final username = UserName.dirty(value);
    emit(state.copyWith(userName: username, isValid: Formz.validate([username, state.email, state.password])));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(email: email, isValid: Formz.validate([email, state.userName, state.password])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(password: password, isValid: Formz.validate([password, state.email, state.userName])));
  }

  void onSubmit() {

    emit(state.copyWith(
      status: FormStatus.validating,
      userName: UserName.dirty(state.userName.value),
      email: Email.dirty(state.email.value),
      password: Password.dirty(state.password.value),
      isValid: Formz.validate([state.userName, state.email, state.password])
    ));

    print('Submit: $state');
  }
}
