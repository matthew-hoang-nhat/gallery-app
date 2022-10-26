import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constants/app_colors.dart';

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppColors.grey
      ..strokeWidth = 5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    Paint circlePaint = Paint()..color = AppColors.white;
    Offset position = Offset(50, size.height / 2 - 20);

    Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height)),
          const Radius.circular(10)));

    canvas
      ..drawPath(path, paint)
      ..drawArc(
        Rect.fromCenter(
          center: Offset(size.width * 20 / 100, size.height),
          height: 20,
          width: 20,
        ),
        math.pi,
        math.pi,
        false,
        circlePaint,
      )
      ..drawArc(
        Rect.fromCenter(
          center: Offset(size.width * 20 / 100, 0),
          height: 20,
          width: 20,
        ),
        0,
        math.pi,
        false,
        circlePaint,
      );

    // canvas.drawCircle(position, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
