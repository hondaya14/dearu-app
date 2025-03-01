import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pointSP = StateNotifierProvider<PointStateNotifier, List<Offset?>>((ref) {
  return PointStateNotifier([]);
});

class PointStateNotifier extends StateNotifier<List<Offset?>> {
  PointStateNotifier(super._state);

  void update(List<Offset?> points) {
    state = points;
  }

  void delete() {
    state.clear();
  }
}

enum PaperTexture { plain, canvas, sketch, washi }

class LetterEditPainter extends CustomPainter {
  final List<List<Offset>> strokes;
  final List<Offset> currentStroke;
  final double pencilDarkness;
  final double pencilThickness;
  final Color pencilColor;
  final PaperTexture paperTexture;
  final Color paperColor;
  final double textureIntensity;

  LetterEditPainter({
    required this.strokes,
    required this.currentStroke,
    required this.pencilDarkness,
    required this.pencilThickness,
    required this.pencilColor,
    required this.paperTexture,
    required this.paperColor,
    required this.textureIntensity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 背景の描画
    _drawPaperBackground(canvas, size);

    // すべての保存された線を描画
    for (var stroke in strokes) {
      _drawPencilStroke(canvas, stroke);
    }
    // 現在描画中の線を描画
    _drawPencilStroke(canvas, currentStroke);
  }

  void _drawPaperBackground(Canvas canvas, Size size) {
    // 基本の紙の色で背景を塗る
    final backgroundPaint = Paint()
      ..color = paperColor
      ..style = PaintingStyle.fill;

    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    if (paperTexture == PaperTexture.plain || textureIntensity <= 0) {
      return; // 無地の場合はテクスチャなし
    }

    final random = math.Random(42); // シード値を固定して一貫性のあるパターンを生成

    switch (paperTexture) {
      case PaperTexture.canvas:
        _drawCanvasTexture(canvas, size, random);
        break;
      case PaperTexture.sketch:
        _drawSketchTexture(canvas, size, random);
        break;
      case PaperTexture.washi:
        _drawWashiTexture(canvas, size, random);
        break;
      default:
        break;
    }
  }

  void _drawCanvasTexture(Canvas canvas, Size size, math.Random random) {
    // キャンバステクスチャ - 等間隔の細かい格子パターン
    final texturePaint = Paint()
      ..color = Colors.black.withOpacity(textureIntensity * 0.3)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    // 横線
    for (double y = 0; y < size.height; y += 4) {
      final path = Path();
      path.moveTo(0, y);

      for (double x = 0; x < size.width; x += 2) {
        final yOffset = (random.nextDouble() - 0.5) * 0.5;
        path.lineTo(x, y + yOffset);
      }

      canvas.drawPath(path, texturePaint);
    }

    // 縦線
    for (double x = 0; x < size.width; x += 4) {
      final path = Path();
      path.moveTo(x, 0);

      for (double y = 0; y < size.height; y += 2) {
        final xOffset = (random.nextDouble() - 0.5) * 0.5;
        path.lineTo(x + xOffset, y);
      }

      canvas.drawPath(path, texturePaint);
    }
  }

  void _drawSketchTexture(Canvas canvas, Size size, math.Random random) {
    // スケッチ紙テクスチャ - ランダムな点と短い線
    final dotPaint = Paint()
      ..color = Colors.black.withOpacity(textureIntensity * 0.4)
      ..strokeWidth = 0.3
      ..strokeCap = StrokeCap.round;

    // ランダムな点
    for (int i = 0; i < size.width * size.height / 100; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;

      if (random.nextDouble() < 0.7) {
        // 点を描画
        canvas.drawPoints(
          ui.PointMode.points,
          [Offset(x, y)],
          dotPaint,
        );
      } else {
        // 短い線を描画
        final endX = x + (random.nextDouble() - 0.5) * 3;
        final endY = y + (random.nextDouble() - 0.5) * 3;
        canvas.drawLine(
          Offset(x, y),
          Offset(endX, endY),
          dotPaint,
        );
      }
    }
  }

  void _drawWashiTexture(Canvas canvas, Size size, math.Random random) {
    // 和紙テクスチャ - 繊維のようなランダムな線と小さな斑点
    final fiberPaint = Paint()
      ..color = Colors.black.withOpacity(textureIntensity * 0.2)
      ..strokeWidth = 0.7
      ..strokeCap = StrokeCap.round;

    // 繊維のような線
    for (int i = 0; i < 300; i++) {
      final startX = random.nextDouble() * size.width;
      final startY = random.nextDouble() * size.height;

      final path = Path();
      path.moveTo(startX, startY);

      // ランダムな長さと方向の線
      double currentX = startX;
      double currentY = startY;
      final length = random.nextInt(15) + 5;

      for (int j = 0; j < length; j++) {
        final angle = random.nextDouble() * 2 * math.pi;
        final distance = random.nextDouble() * 2;

        currentX += math.cos(angle) * distance;
        currentY += math.sin(angle) * distance;

        path.lineTo(currentX, currentY);
      }

      fiberPaint.color = Colors.black
          .withOpacity(textureIntensity * random.nextDouble() * 0.3);
      canvas.drawPath(path, fiberPaint);
    }

    // 小さな斑点
    final spotPaint = Paint()
      ..color = Colors.black.withOpacity(textureIntensity * 0.15)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 500; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 0.8;

      canvas.drawCircle(Offset(x, y), radius, spotPaint);
    }
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

      path.lineTo(p1.dx, p1.dy);
    }

    // 鉛筆の基本スタイル
    final basePaint = Paint()
      ..color = pencilColor.withOpacity(pencilDarkness)
      ..strokeWidth = pencilThickness
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    // 鉛筆のテクスチャを表現するためのシェーダー
    final shader = ui.Gradient.linear(
      Offset.zero,
      const Offset(10, 10),
      [
        pencilColor.withOpacity(pencilDarkness),
        pencilColor.withOpacity(pencilDarkness * 0.7),
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
        ..color = pencilColor.withOpacity(pencilDarkness * 0.3)
        ..strokeWidth = pencilThickness * 0.2
        ..strokeCap = StrokeCap.round;

      for (int i = 0; i < points.length; i += 3) {
        final point = points[i];
        // パスの周りにランダムな点を追加
        for (int j = 0; j < 3; j++) {
          final offsetX = (random.nextDouble() - 0.5) * pencilThickness * 1.5;
          final offsetY = (random.nextDouble() - 0.5) * pencilThickness * 1.5;
          canvas.drawPoints(
            ui.PointMode.points,
            [Offset(point.dx + offsetX, point.dy + offsetY)],
            dotPaint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant LetterEditPainter oldDelegate) {
    return true;
  }
}
