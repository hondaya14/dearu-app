import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

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

      //path.lineTo(p1.dx, p1.dy);
    }

    // 鉛筆の基本スタイル
    final basePaint = Paint()
      ..color = pencilColor.withAlpha(250)
      ..strokeWidth = pencilThickness
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    // 鉛筆のテクスチャを表現するためのシェーダー
    final shader = ui.Gradient.linear(
      Offset.zero,
      const Offset(10, 10),
      [
        pencilColor.withAlpha(255),
        pencilColor.withAlpha(120),
      ],
      [0.0, 1.0],
      TileMode.repeated,
      Matrix4.rotationZ(0.5).storage,
    );

    basePaint.shader = shader;
    canvas.drawPath(path, basePaint);

    // 鉛筆の粒子感を表現するための小さなドット
    if (points.length > 2) {
      final random = math.Random(42); // 一貫性のある乱数を生成
      final dotPaint = Paint()
        ..color = pencilColor.withAlpha(255)
        ..strokeWidth = pencilThickness * 1
        ..strokeCap = StrokeCap.round;

      for (int i = 0; i < points.length; i += 3) {
        final point = points[i];
        // パスの周りにランダムな点を追加
        for (int j = 0; j < 3; j++) {
          final offsetX = (random.nextDouble() - 0.6) * pencilThickness * 1.5;
          final offsetY = (random.nextDouble() - 0.6) * pencilThickness * 1.5;
          // canvas.drawPoints(
          //   ui.PointMode.points,
          //   [Offset(point.dx + offsetX, point.dy + offsetY)],
          //   dotPaint,
          // );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant final LetterEditPainter oldDelegate) {
    return true;
  }
}
