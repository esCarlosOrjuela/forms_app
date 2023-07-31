import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty, length, format}

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {

  static final RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty(String value) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    if(!Email.regExp.hasMatch(value)) return EmailError.format;
    return value.isEmpty ? EmailError.empty : null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EmailError.empty) return 'Campor requerido';
    if (displayError == EmailError.format) return 'Formato invalido (email@gmail.com)';
    return null;
  }
}
