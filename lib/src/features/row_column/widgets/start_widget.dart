import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../config/constants/app_colors.dart';

Stack startWidget({required double size}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(height: 50 * size, width: 50 * size, color: Colors.black),
      Transform.rotate(
        angle: -math.pi / 4,
        child: Container(
          height: 50 * size,
          width: 50 * size,
          color: Colors.black,
        ),
      ),
      Text(
        'A',
        style: TextStyle(
            fontSize: 20 * size,
            color: AppColors.yellow,
            fontWeight: FontWeight.bold),
      )
    ],
  );
}
