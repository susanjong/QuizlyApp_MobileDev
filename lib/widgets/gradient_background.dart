import 'package:flutter/material.dart';

// Widget background gradient di menu login dan sign up
class GradientBackground extends StatelessWidget {
  final Widget child;
  final List<Color>? colors;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const GradientBackground({
    Key? key,
    required this.child,
    this.colors,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: colors ??
              const [
                Color(0xFFFFBBBE),
                Color(0xFFFDF8E8),
              ],
        ),
      ),
      child: child,
    );
  }
}

/// Widget untuk background solid color
class SolidBackground extends StatelessWidget {
  final Widget child;
  final Color? color;

  const SolidBackground({
    Key? key,
    required this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? const Color(0xFFFFFFFF),
      child: child,
    );
  }
}
