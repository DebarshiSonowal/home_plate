import 'package:flutter/material.dart';
import 'package:home_plate/Constants/constants.dart';

const double _kCurveHeight = 35;

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - _kCurveHeight);
    p.relativeQuadraticBezierTo(
        size.width / 5, 3 * _kCurveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();

    // Create the gradient
    const gradient = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        Constants.gradient1Color,
        Constants.gradient2Color,
        Constants.gradient3Color
      ],
      stops: [0.44, 0.75, 0.95], // Define your gradient colors
    );

    // Apply the gradient
    canvas.drawPath(
        p,
        Paint()
          ..shader = gradient
              .createShader(Rect.fromLTWH(0, 0, size.width, size.height)));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
