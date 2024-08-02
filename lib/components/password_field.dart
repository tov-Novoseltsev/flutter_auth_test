import 'package:clario_auth/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ValidationRule {
  final String message;
  final bool Function(String value) validate;

  ValidationRule(this.message, this.validate);
}

final _validationRules = [
  ValidationRule(
    '8 characters or more (no spaces)',
    (String value) => value.length >= 8 && !value.contains(' '),
  ),
  ValidationRule(
    'Uppercase and lowercase letters',
    (String value) =>
        value.contains(RegExp(r'[A-Z]')) && value.contains(RegExp(r'[a-z]')),
  ),
  ValidationRule(
    'At least one digit',
    (String value) => value.contains(RegExp(r'\d')),
  ),
];

class PasswordField extends StatefulWidget {
  final void Function(String? value) onChange;
  final bool wasSubmitted;

  const PasswordField({
    super.key,
    required this.onChange,
    required this.wasSubmitted,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  String? value;

  bool? getIsValid(bool valid) {
    if (valid) return true;

    if (widget.wasSubmitted) return false;

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final validations = _validationRules
        .map(
          (rule) => ValidationRuleText(
            rule.message,
            isValid: getIsValid(rule.validate(value ?? '')),
          ),
        )
        .toList();

    final isFieldValid = validations.every((obj) => obj.isValid == true);
    final color = getFieldColor(getIsValid(isFieldValid));

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        style: BorderStyle.solid,
        width: 1,
        color: color,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          keyboardType: TextInputType.visiblePassword,
          obscureText: obscureText,
          style: TextStyle(
            fontSize: 16,
            color: color,
          ),
          maxLength: 64,
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
            hintText: 'Create your password',
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Container(
                padding: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset(
                  'assets/hide_password.svg',
                  colorFilter: ColorFilter.mode(
                    color,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
            widget.onChange(value);
          },
          validator: (value) => isFieldValid == true ? null : '',
        ),
        const SizedBox(height: 20),
        Wrap(
          direction: Axis.vertical,
          spacing: 4,
          children: validations,
        ),
      ],
    );
  }
}

class ValidationRuleText extends StatelessWidget {
  final String value;
  final bool? isValid;

  const ValidationRuleText(
    this.value, {
    super.key,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          height: 18 / 13,
          color: getFieldColor(isValid),
        ),
      ),
    );
  }
}
