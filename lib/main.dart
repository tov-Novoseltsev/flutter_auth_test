import 'package:clario_auth/auth_screen.dart';
import 'package:clario_auth/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth',
      theme: AppThemeProvider.light,
      home: AuthScreen(),
    );
  }
}
