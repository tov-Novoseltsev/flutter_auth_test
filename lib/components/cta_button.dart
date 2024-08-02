import 'package:flutter/material.dart';

class CtaButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const CtaButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 240,
        height: 48,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF70C3FF),
              Color(0xFF4B65FF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w800,
          ),
          child: child,
        ),
      ),
    );
  }
}
