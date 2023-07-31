part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

// Estado del formulario
class RegisterFormState extends Equatable {
  final FormStatus status;
  final UserName userName;
  final Email email;
  final Password password;
  final bool isValid;

  const RegisterFormState({
    this.status = FormStatus.invalid,
    this.userName = const UserName.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.isValid = false
  });

  @override
  List<Object> get props => [status, userName, email, password];

  RegisterFormState copyWith({
    FormStatus? status,
    UserName? userName,
    Email? email,
    Password? password,
    bool? isValid,
  }) =>RegisterFormState(
    status: status ?? this.status,
    userName: userName ?? this.userName,
    email: email ?? this.email,
    password: password ?? this.password,
    isValid: isValid ?? this.isValid);
}
