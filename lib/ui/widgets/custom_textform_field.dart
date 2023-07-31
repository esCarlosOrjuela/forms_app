import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
    final String? label;
    final String? hint;
    final bool isPassword;
    final String? errorMessage;
    final Function(String)? onChanged;
    final String? Function(String?)? validator;

  const CustomTextFormField({super.key, this.label, this.hint, this.errorMessage, this.onChanged, this.validator, this.isPassword = false});

  @override
  Widget build(BuildContext context) {

    final colorsTheme = Theme.of(context).colorScheme;

    final borderTextField = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(
        color: Colors.black,
        width: 1,
      ),
    );

    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          errorText: errorMessage,
          enabledBorder: borderTextField,
          focusColor: colorsTheme.primary,
          label: (label != null) ? Text(label!) : null,
          suffixIcon: Icon(Icons.check, color: colorsTheme.primary),
          icon: Icon(Icons.verified_user, color: colorsTheme.primary),
          prefixIcon: Icon(Icons.supervised_user_circle_outlined, color: colorsTheme.primary),
          errorBorder: borderTextField.copyWith(borderSide: BorderSide(color: Colors.red.shade900)),
          focusedBorder: borderTextField.copyWith(borderSide: BorderSide(color: colorsTheme.primary)),
          focusedErrorBorder: borderTextField.copyWith(borderSide: BorderSide(color: Colors.red.shade900))

        ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
