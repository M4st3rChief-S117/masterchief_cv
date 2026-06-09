import 'dart:math';

import 'package:flutter/material.dart';

class EllipticalOrbitPainter extends CustomPainter {
  final double centerX;
  final double centerY;
  final double radiusX;
  final double radiusY;
  final Color color;

  EllipticalOrbitPainter({
    required this.centerX,
    required this.centerY,
    required this.radiusX,
    required this.radiusY,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    // Draw elliptical orbit path
    final path = Path();
    for (int i = 0; i <= 360; i++) {
      final angle = i * pi / 180;
      final x = centerX + cos(angle) * radiusX;
      final y = centerY + sin(angle) * radiusY;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    // Draw dotted effect
    final dashPath = Path();
    for (int i = 0; i <= 360; i += 10) {
      final angle = i * pi / 180;
      final x = centerX + cos(angle) * radiusX;
      final y = centerY + sin(angle) * radiusY;

      if (i % 20 == 0) {
        dashPath.moveTo(x, y);
        final nextAngle = (i + 5) * pi / 180;
        final nextX = centerX + cos(nextAngle) * radiusX;
        final nextY = centerY + sin(nextAngle) * radiusY;
        dashPath.lineTo(nextX, nextY);
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
