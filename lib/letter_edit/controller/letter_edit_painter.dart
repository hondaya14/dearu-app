import 'package:flutter/material.dart';

class LetterEditPainter extends CustomPainter {
  final List<List<Offset>> strokes;
  final List<Offset> currentStroke;
  final double scale;
  final Offset offset;
  final double pencilDarkness;
  final double pencilThickness;
  final Color pencilColor;
  final Color paperColor;
  final double textureIntensity;

  LetterEditPainter({
    required this.strokes,
    required this.currentStroke,
    required this.scale,
    required this.offset,
    required this.pencilDarkness,
    required this.pencilThickness,
    required this.pencilColor,
    required this.paperColor,
    required this.textureIntensity,
  });

  @override
  void paint(final Canvas canvas, final Size size) {
    canvas.translate(offset.dx, offset.dy);
    canvas.scale(scale);

    // すべての保存された線を描画
    for (var stroke in strokes) {
      _drawPencilStroke(canvas, stroke);
    }
    // 現在描画中の線を描画
    _drawPencilStroke(canvas, currentStroke);
  }

  void _drawPencilStroke(final Canvas canvas, final List<Offset> points) {
    if (points.length < 2) return;

    // 基本の鉛筆パス
    final path = Path();
    path.moveTo(points.first.dx, points.first.dy);

    for (int i = 1; i < points.length; i++) {
      // 線を滑らかにするためのベジェ曲線の制御点
      final p0 = i > 0 ? points[i - 1] : points[0];
      final p1 = points[i];

      path.quadraticBezierTo(p0.dx, p0.dy, p1.dx, p1.dy);
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
