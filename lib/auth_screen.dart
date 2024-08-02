import 'package:clario_auth/components/cta_button.dart';
import 'package:clario_auth/components/email_field.dart';
import 'package:clario_auth/components/main_background.dart';
import 'package:clario_auth/components/password_field.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  bool wasSubmitted = false;

  String? email;
  String? password;

  void _showSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Sign up success'),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: MainBackground(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 138),
                    Text(
                      'Sign up',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 40),
                    EmailField(
                      wasSubmitted: wasSubmitted,
                      onChange: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    PasswordField(
                      wasSubmitted: wasSubmitted,
                      onChange: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    const SizedBox(height: 40),
                    CtaButton(
                      onPressed: () {
                        setState(() {
                          wasSubmitted = true;
                        });

                        final isValid = _formKey.currentState!.validate();

                        if (isValid) {
                          debugPrint('Email: $email, password: $password');
                          _showSuccess();
                        }
                      },
                      child: const Text('Sign up'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
