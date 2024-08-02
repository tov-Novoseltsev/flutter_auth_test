import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainBackground extends StatelessWidget {
  final Widget child;

  const MainBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFF4F9FF),
                  Color(0xFFE0EDFB),
                ],
              ),
            ),
            child: child,
          ),
        ),
      ],
    );
  }
}
