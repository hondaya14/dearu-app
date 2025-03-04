import 'package:flutter/material.dart';

import '../../base/presentation/base_screen.dart';
import '../../common/logger.dart';

class LetterEditPainter extends CustomPainter {
  final List<List<Offset>> strokes;
  final List<Offset> currentStroke;
  final double pencilDarkness;
  final double pencilThickness;
  final Color pencilColor;
  final Color paperColor;
  final double textureIntensity;

  LetterEditPainter({
    required this.strokes,
    required this.currentStroke,
    required this.pencilDarkness,
    required this.pencilThickness,
    required this.pencilColor,
    required this.paperColor,
    required this.textureIntensity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // すべての保存された線を描画
    for (var stroke in strokes) {
      _drawPencilStroke(canvas, stroke);
    }
    // 現在描画中の線を描画
    _drawPencilStroke(canvas, currentStroke);
  }

  void _drawPencilStroke(Canvas canvas, List<Offset> points) {
    if (points.length < 2) return;

    // 基本の鉛筆パス
    final path = Path();
    path.moveTo(points.first.dx, points.first.dy);

    for (int i = 1; i < points.length; i++) {
      // 線を滑らかにするためのベジェ曲線の制御点
      final p0 = i > 0 ? points[i - 1] : points[0];
      final p1 = points[i];

      path.quadraticBezierTo(p0.dx, p0.dy, p1.dx, p1.dy);

      final screenDiagonalDistance =
          Offset(screenSize?.width ?? 1, screenSize?.height ?? 1).distance;
      final distance = (p1 - p0).distance / screenDiagonalDistance;

      //path.lineTo(p1.dx, p1.dy);

      logger.i(distance);

      // 鉛筆の基本スタイル
      final basePaint = Paint()
        ..color = pencilColor.withAlpha(255 * (1 - distance).toInt())
        ..strokeWidth = pencilThickness
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..style = PaintingStyle.stroke;

      canvas.drawPath(path, basePaint);
    }
  }

  @override
  bool shouldRepaint(covariant final LetterEditPainter oldDelegate) {
    return true;
  }
}
