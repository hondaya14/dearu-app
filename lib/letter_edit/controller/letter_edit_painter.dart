import 'dart:math' as math;

import 'package:flutter/material.dart';

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

    for (int i = 4; i < points.length - 3; i++) {
      // 線を滑らかにするためのベジェ曲線の制御点
      // final p0 = i > 0 ? points[i - 1] : points[0];
      // final p1 = points[i];

      // interpolation
      final interpolation_points = [];
      final p0 = points[i];
      final p1 = points[i + 1];
      final p2 = points[i + 2];
      final p3 = points[i + 3];

      // todo: スプライン補完を入れて滑らかな線にする
      for (int j = 0; i < 10; i++) {
        final t = j / 10;
        final x = 0.5 *
            ((2 * p1.dx) +
                (-p0.dx + p2.dx) * t +
                (2 * p0.dx - 5 * p1.dx + 4 * p2.dx - p3.dx) * (math.pow(t, 2)) +
                (-p0.dx + 3 * p1.dx - 3 * p2.dx + p3.dx) * (math.pow(t, 3)));
        final y = 0.5 *
            ((2 * p1.dy) +
                (-p0.dy + p2.dy) * t +
                (2 * p0.dy - 5 * p1.dy + 4 * p2.dy - p3.dy) * (math.pow(t, 2)) +
                (-p0.dy + 3 * p1.dy - 3 * p2.dy + p3.dy) * (math.pow(t, 3)));
        interpolation_points.add(Offset(x, y));
      }
      // スプライン補完する
      for (var point in interpolation_points) {
        path.lineTo(point.dx, point.dy);
      }
      logger.i(interpolation_points);
      path.lineTo(p1.dx, p1.dy);
    }

    // 鉛筆の基本スタイル
    final basePaint = Paint()
      ..color = pencilColor.withAlpha(250)
      ..strokeWidth = pencilThickness
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, basePaint);
  }

  @override
  bool shouldRepaint(covariant final LetterEditPainter oldDelegate) {
    return true;
  }
}
