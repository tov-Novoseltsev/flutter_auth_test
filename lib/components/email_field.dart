import 'package:clario_auth/theme.dart';
import 'package:flutter/material.dart';

final _emailRegExp = RegExp(
  r'^[^@]+@[^@]+\.[^@]+',
);

bool _validateEmail(String email) {
  if (email.isEmpty) return false;

  return _emailRegExp.hasMatch(email);
}

class EmailField extends StatefulWidget {
  final void Function(String? value) onChange;
  final bool wasSubmitted;

  const EmailField({
    super.key,
    required this.onChange,
    required this.wasSubmitted,
  });

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  String? value;

  bool? getIsValid(bool valid) {
    if (valid) return true;

    if (widget.wasSubmitted) return false;

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isFieldValid = value != null && _validateEmail(value!);
    final color = getFieldColor(getIsValid(isFieldValid));

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 1,
        color: color,
      ),
    );

    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        fontSize: 16,
        color: color,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          top: 10,
          right: 10,
          bottom: 10,
          left: 20,
        ),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        focusedErrorBorder: border,
        errorBorder: border,
        errorStyle: const TextStyle(fontSize: 0),
        hintStyle: TextStyle(
          fontSize: 16,
          color: color,
        ),
        hintText: 'Email',
      ),
      validator: (value) => isFieldValid == true ? null : '',
      onChanged: (value) {
        setState(() {
          this.value = value;
        });

        widget.onChange(value);
      },
    );
  }
}
